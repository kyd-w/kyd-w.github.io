---
---
# 周报验收 Rubric（判断资产 1/2）

> 3.5 代管线自主化点位清单第 1 项产物（见 [自我进化智能体跟踪/2026-11-15.md](../自我进化智能体跟踪/2026-11-15.html) 演进注记）。
> 把 W45（故障）/W46（修复验证）两轮人工验收的 tacit 清单显式化。**当前由人工跑（Tier 3 断点），目标降级为 agent 自查 + 人审例外（Tier 2）**——全部检查项均为机械可查（文件存在性 / git / HTTP），无一项必须靠人，这正是可移交的依据。
>
> 版本：2026-11-17 首版（依据：W45 故障根因、W46 验收实操、`tools/pi_files/weekly/` 管线源码）

## 适用对象与时机

| 项 | 值 |
|---|---|
| 验收对象 | TechRadar 周报（周日 01:30 `techradar-weekly.timer` 自动产出） |
| 验收时机 | 周日早晨或周一（Pages 构建 + inbox 同步完成后） |
| 管线流程 | `weekly_synth.py` → DeepSeek 分批 map-reduce（CHUNK=30）→ `report.py` 渲染 → `publish.py` 写 `_posts/{周一日期}-weekly-report.md` → commit `技术周报 YYYY-Www` → push |
| 关键路径（38服务器） | `~/techradar/logs/weekly-synth/{日期}.jsonl`（StepLog）、`~/techradar/weekly/findings.json`、站点克隆 `/airuntime/workspace/kyd-w.github.io` |

## 检查清单（按序，前一项失败后项无意义）

### C1 · 定时器触发了吗

- **查**：38服务器 `~/techradar/logs/weekly-synth/{周日日期}.jsonl` 存在，且含 `synth.input` 步（`new_items=N`）
- **通过**：文件存在、步骤完整（synth.input → synth.analyze → synth.done/publish）
- **辅助**：`systemctl --user list-timers techradar-weekly.timer` 看下次触发；timer 带 `Persistent=true`，停机跨周日应自动补跑
- **失败处置**：`systemctl --user start techradar-weekly.service` 手动补跑

### C2 · 无截断吗

- **查三层**：
  1. `findings.json` 可解析、`findings` 数组非空、`tokens` 在千级以上（`synth.analyze` 步有记录）
  2. 成品周报五个章节齐全：①结论速览（有编号条目）/ ②热榜汇总 / ③课题跟踪 / ④deep-dive / ⑤数据附录
  3. 末行完整（⑤ 附录以 token 数与 Laya 影子行收尾，无句中断裂）
- **背景**：W45 根因 = 148 条素材单次合成超 `max_tokens=8192`，JSON 掐断、3 次重试耗尽。已改分批 map-reduce；`analyze.py` 对 parse 失败有重试并记录 `finish_reason`
- **失败处置**：重跑 `~/techradar/venv/bin/python weekly/weekly_synth.py`；若复发（素材周净增暴涨），调小 `CHUNK`

### C3 · push 实锤了吗（不信返回值）

- **⚠️ 已知缺口**：`publish.py` 在 push 全部失败时**仍返回 `live:{week}`**（待修，rubric 即其补偿机制）——验收禁止以返回值/日志 mode 字段为准
- **查**：站点克隆内 `git -C /airuntime/workspace/kyd-w.github.io log --oneline --since='26 hours ago' -- _posts` 出现 `技术周报 YYYY-Www` commit（`run_health.sh` 每晚 23:50 已自动做此检查并落 `health/{日期}.status`）
- **远端实锤**：`git ls-remote origin` 的 main HEAD 与本地克隆 HEAD 一致（GitHub TLS 间歇抽风时本地成功≠远端成功）
- **失败处置**：手动重推（可挂后台循环自愈）：`cd /airuntime/workspace/kyd-w.github.io && timeout 120 git push origin main:main`

### C4 · 线上 200 吗

- **查**：`GET https://kyd-w.github.io/{年}/{月}/{日}/weekly-report.html`，**日期 = 报告周的周一**（`_posts` 文件名约定：W46 周报发布于周日 11-15，URL 是 `/2026/11/09/weekly-report.html`）
- **通过**：HTTP 200 且正文含 `技术周报 · YYYY-Www` 与 ① 章节（防 404 页误判）
- **注意**：Pages 构建延迟 1–3 分钟，404 先等 10 分钟再判死；200 通过即同时闭环证明 C3 远端 push 落地
- **失败处置**：查 GitHub Actions/Pages 构建日志；确认仓里 `_posts` 文件确实在 main

### C5 · 降级项标注（通过但记录）

| 降级现象 | 定性 | 动作 |
|---|---|---|
| ② 热榜两节为空 | 设计内降级（GitHub TLS 抽风→空榜，不阻塞发布） | 🟡 记录，通过 |
| ③ 显示"本周各课题无注册表级变化" | 正常（topic_updates 为空） | 通过，无需动作 |
| ⑤ Laya 行显示"影子期无样本" | 观察项 | 记录；连续多周无样本才升级处理 |

## 验收结论分级

- **✅ 通过**：C1–C4 全过
- **🟡 降级通过**：C1–C4 过 + C5 有降级项 → 验收记录里写明
- **❌ 不通过**：任一 C1–C4 失败 → 按处置表动作后**从 C1 重跑全表**（修复可能引入新问题）

## 移交映射（Tier 3 → Tier 2）

| 检查项 | 机械可查性 | agent 化备注 |
|---|---|---|
| C1 | 文件存在 + 字段断言 | 需 38服务器 SSH（内网）；云沙箱 agent 够不到 → 依赖点位 3（status JSON 出内网） |
| C2 | JSON 解析 + 章节标题断言 | 纯读，随时可移交 |
| C3 | git log + ls-remote 比对 | 公开仓挂载即可查远端；本地克隆部分依赖内网 |
| C4 | HTTP GET + 正文断言 | 纯读，随时可移交 |
| C5 | 半判断（区分"设计内降级"与异常） | 规则已表化，可先移交后人工抽查 |

**与蒸馏的衔接**：周报须先过本 rubric 才可进入蒸馏（[周报蒸馏playbook.md](周报蒸馏playbook.html) 前置条件）——防止把截断/未发布的半成品蒸馏进课题快照（垃圾进垃圾出）。
