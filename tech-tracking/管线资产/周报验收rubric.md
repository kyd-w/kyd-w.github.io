---
---
# 周报验收 Rubric（判断资产 1/2）

> 3.5 代管线自主化点位清单第 1 项产物（见 [自我进化智能体跟踪/2026-11-15.md](../自我进化智能体跟踪/2026-11-15.html) 演进注记）。
> 把 W45（故障）/W46（修复验证）两轮人工验收的 tacit 清单显式化。**当前由人工跑（Tier 3 断点），目标降级为 agent 自查 + 人审例外（Tier 2）**——C1–C5 均为机械可查（文件存在性 / git / HTTP），无一项必须靠人；C6（2026-11-18 增）为抽样半判断，二期移交。
>
> 版本：2026-11-17 首版（依据：W45 故障根因、W46 验收实操、`tools/pi_files/weekly/` 管线源码）；2026-11-18 增 C6 实体名溯源（依据：W45 周报实体级失真 2/3 实证——见 [自我进化智能体跟踪/2026-11-18.md](../自我进化智能体跟踪/2026-11-18.html)，用户决策）

## 适用对象与时机

| 项 | 值 |
|---|---|
| 验收对象 | TechRadar 周报（周日 01:30 `techradar-weekly.timer` 自动产出） |
| 验收时机 | 周日早晨或周一（Pages 构建 + inbox 同步完成后） |
| 管线流程 | `weekly_synth.py` → DeepSeek 分批 map-reduce（CHUNK=30）→ `report.py` 渲染 → `publish.py` 写 `_posts/{周一日期}-weekly-report.md` → commit `技术周报 YYYY-Www` → push |
| 关键路径（38服务器） | `~/techradar/logs/weekly-synth/{日期}.jsonl`（StepLog）、`~/techradar/weekly/findings.json`、站点克隆 `/airuntime/workspace/kyd-w.github.io` |
| 云侧断言源（不进内网） | `https://kyd-w.github.io/techradar-status/status.json`——点位 3 产物（`status_export.py`，挂周报后/采集后/23:50 三点 ≈3 次/日），C1/C3/C5 的字段化信号 |

## 检查清单（按序，前一项失败后项无意义）

### C1 · 定时器触发了吗

- **查（云侧）**：`status.json` 的 `tasks.weekly-synth` 周日应为真实尾事件（如 `synth.done`/`publish`），非 `{status: "missing"}`；周一查时看昨日回看（exporter 已含今日→昨日逻辑）
- **查（内网，深度核查）**：38服务器 `~/techradar/logs/weekly-synth/{周日日期}.jsonl` 存在，且含 `synth.input` 步（`new_items=N`）
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
- **查（云侧）**：`status.json` 的 `site.synced == true`（exporter 已代跑 ls-remote 比对 origin/local；`null` = 当轮 ls-remote 失败，回退 C4 HTTP 判定）且 `site.weekly_post_26h != null`（subject 形如 `技术周报 YYYY-Www`）
- **查（内网，深度核查）**：站点克隆内 `git -C /airuntime/workspace/kyd-w.github.io log --oneline --since='26 hours ago' -- _posts` 出现 `技术周报 YYYY-Www` commit（`run_health.sh` 每晚 23:50 已自动做此检查并落 `health/{日期}.status`）；`git ls-remote origin` 的 main HEAD 与本地克隆 HEAD 一致（GitHub TLS 间歇抽风时本地成功≠远端成功）
- **通道信号**：`last_push.result`（`fail inbox` = 收件箱同步通道有未推遗留；`fail exporter` = status 通道自身未推通——此时本 JSON 也是陈旧的，先看 `generated_at` 判断新鲜度）
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

### C6 · 实体名溯源（抽样，2026-11-18 增）

- **背景**：W45 周报三仓实测发现实体级失真 2/3——①模型名当项目名（gpt-6-astra →"Astra"项目）②无中生有属性（"对话图"，源文 0 次出现）③定性错误（"群体协同进化"，实为群聊单 agent）。失真会原样流进蒸馏 agent 输入链（垃圾进垃圾出）
- **查（抽样 2–3 条）**：优先抽**首次出现的人名/项目名**与**含具体机制描述**的条目，核实体存在性与名称准确性（GitHub/官方页检索）；机制描述抽 1–2 个关键名词回源比对
- **方法纪律（11-18 首实操沉淀）**：①实体存在性以 arXiv/GitHub **API 直查**为准——搜索引擎摘要会返回幻觉 URL（实例：伪造 alphaxiv 链接，arXiv 查无）；②警惕**同物异名跨周重复**——EAT 以真名入 W45、以媒体转述名"Self-Reorganising"再入 W46 而未被合并，溯源时新条目名先与快照链已有实体比对
- **通过**：抽样全准，或失真可定位为上游源素材自身口径（记录来源，不阻塞发布）
- **失败处置**：失真条目在蒸馏/快照环节改口径（参照 11-18 Astra→WSP 处理）；失真率 ≥1/3 且连续两周 → 升级管线侧（`weekly_synth` prompt 加实体保真约束）
- **性质**：抽样半判断，人工跑；agent 化需 web 检索工具，二期（先积累失真率基线）

## 验收结论分级

- **✅ 通过**：C1–C4 全过（C6 抽样通过或失真已定位记录）
- **🟡 降级通过**：C1–C4 过 + C5 有降级项 → 验收记录里写明
- **❌ 不通过**：任一 C1–C4 失败 → 按处置表动作后**从 C1 重跑全表**（修复可能引入新问题）

## 移交映射（Tier 3 → Tier 2）

| 检查项 | 机械可查性 | agent 化备注 |
|---|---|---|
| C1 | 文件存在 + 字段断言 | 云侧读 `status.json` tasks 字段（点位 3 已出内网）；日志全链深度核查仍需内网 SSH |
| C2 | JSON 解析 + 章节标题断言 | 纯读，随时可移交 |
| C3 | git log + ls-remote 比对 | 云侧读 `status.json` site 字段（origin/local 对齐由 exporter 代查）；本地克隆核查仍需内网 |
| C4 | HTTP GET + 正文断言 | 纯读，随时可移交 |
| C5 | 半判断（区分"设计内降级"与异常） | 规则已表化，可先移交后人工抽查 |
| C6 | 抽样+检索（半判断） | 需 web 检索工具，二期移交；先人工抽查积累失真率基线 |

**与蒸馏的衔接**：周报须先过本 rubric 才可进入蒸馏（[周报蒸馏playbook.md](周报蒸馏playbook.html) 前置条件）——防止把截断/未发布的半成品蒸馏进课题快照（垃圾进垃圾出）。
