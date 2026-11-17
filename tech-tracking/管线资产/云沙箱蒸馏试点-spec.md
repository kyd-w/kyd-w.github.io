---
---
# 云沙箱蒸馏试点 Spec（点位 4）

> 3.5 代管线自主化点位清单第 4 项：把「周报→课题快照」蒸馏环节从 Tier 3 人工断点降为 **agent 草稿 + 人工审合入**（Tier 2）。本文件是试点 agent 的完整作业规约，也是 dry-run 校准依据。
> 硬约束（安全课题内部应用）：**draft 分支 only + 验收门 + 审计轨迹，绝不直推 main**——自主 push 的 agent 等于把 rclone selfupdate / LiteLLM 类供应链风险接到自己仓上，落地形态必须让最坏情况只发生在草稿分支。
> 版本：2026-11-17 首版

## 试点范围

| 项 | 值 |
|---|---|
| 首期课题 | 自我进化智能体跟踪（单课题试点，稳定后扩至 4 课题全量） |
| 时机 | 每周一 03:00 (+08:00)——周日 01:30 周报合成 → 01:35 status 导出 → Pages 构建 → 03:00 蒸馏，全链留缓冲 |
| 载体 | **自建 DeepSeek 工具回路 agent**（2026-11-17 用户决策，弃 Managed Agents）：`distill/agent.py` 跑在 38服务器本地 systemd timer——本地站点克隆即全部输入，**PAT 需求取消**；与"被脚本调用的 LLM"的分界=工具有（read 白名单/write_draft/abort）、迭代有（≤24 轮）、自检有（harness 确定性验收+返工一轮），git 全在 harness |
| 人工保留 | 见文末「人工保留项」 |

## 输入（全部公开面，挂载仓内路径）

1. 本周周报：`_posts/{周一日期}-weekly-report.md`（URL 规律见 rubric C4）
2. 课题 README：`tech-tracking/自我进化智能体跟踪/README.md`
3. **快照链**：`tech-tracking/自我进化智能体跟踪/` 内全部 `YYYY-MM-DD.md`——日期最大的一份为增量基线；**必须回溯更早快照**核对挂起动作的顺延计数与历史判断线索（W46 dry-run 校准 GAP-1/2：不回溯则挂起断链、判断无出处）
4. 课题注册表：`tech-tracking/_topics.yaml`（本课题 watch 项）
5. 作业标准：`tech-tracking/管线资产/周报蒸馏playbook.md`（流程唯一权威，本 spec 不复制其内容只加约束）
6. 验收标准：`tech-tracking/管线资产/周报验收rubric.md`
7. 管线状态：`techradar-status/status.json`
8. 交叉引用（可选）：其他课题目录内最新快照（NOTE-A）

## 前置条件（任一不满足 → 中止并留痕，不产出快照）

| # | 条件 | 判据 |
|---|---|---|
| P1 | 周报已发布 | `status.json` 的 `site.weekly_post_26h != null` 且 subject 含本周周号（C1/C3 云侧断言） |
| P2 | 状态新鲜 | `status.json` 的 `generated_at` 距本次运行 < 48h（失效 = status 通道断了，蒸馏该停） |
| P3 | 周报完整 | 周报正文 ①~⑤ 章节标题齐全且 ① 有编号条目（C2 镜像） |
| P4 | 未蒸馏过 | Memory Store 游标 `last_distilled_week` < 本周周号（防重复；同周重跑走幂等覆盖） |

中止时产出「中止报告」追加到试点日志：缺哪个条件、status.json 关键字段快照。

## 作业流程

= playbook 八步，逐条执行。以下为试点期追加约束：

- **增量基线必须显式**：快照头部写明「对比基线：YYYY-MM-DD 快照」
- 置信度只降不升（playbook 三原则之二）；试点期**一律不做**「官方核实」级升级——发现值得核实的，写入下次关注并标注，由人核
- 🚨 判定：agent 可在草稿中提议（`🚨 提议（待人复核）`字样），无自行定级权
- 挂起动作纪律照 playbook 第 8 步执行

## 产出与推送协议（硬约束）

- **产出两个文件**：
  1. `tech-tracking/自我进化智能体跟踪/草稿-{ISO周号}.md`（如 `草稿-2026-W46.md`）——命名必须带「草稿-」前缀，**绝不占用正式快照的日期命名**
  2. `tech-tracking/管线资产/试点日志.md` 追加一行（周号/前置条件结果/自检结果/置信度分布/挂起建议）
- **推送**：`weekly-draft` 分支 ONLY。commit message：`draft: W{ww} 自我进化蒸馏草稿 by sandbox ({ISO 时间})`
- **禁止**：push main/master；修改 `_posts/`、`techradar-status/`、其他课题目录、`_config.yml`、本 spec；新建分支；改写非本人 commit
- **幂等**：同周重跑允许 force-with-lease 覆盖自己的草稿 commit
- **凭据**：~~fine-grained PAT~~（随载体变更取消）——agent 在 38服务器本地跑，读本地克隆、推 weekly-draft 走 Pi 既有推送凭据；模型 API key 在 `config/env`（`DISTILL_API_KEY`，不进仓不进 prompt）

## 自检（推 draft 前必过，rubric 镜像）

- [ ] 头部三件套：数据来源+周报链接 / 证据等级声明 / 结论先行
- [ ] 每条事实有置信度且 ≤ 周报原级
- [ ] 判断挂课题框架（两层框架 / 换代史 / 三深度），挂不上的已删除
- [ ] 增量基线日期已写明
- [ ] 下次关注 ≤5 条且处理了挂起项
- [ ] 无内网信息（IP / 内网路径 / 凭据）

## 人工保留项（agent 不做）

合入决定（weekly-draft → 控制面 main 的搬运与正式命名）｜🚨 判定复核｜置信度升级｜README 活文档更新（首期草稿只出新快照文件）｜spec/playbook/rubric 三资产本身的修改

## 部署参数（已实装，2026-11-17 载体变更后）

| 项 | 值 | 依据 |
|---|---|---|
| 实现 | `tools/pi_files/distill/agent.py`（harness+工具回路一体） | 自建=点位 5 三选项中的"Agent SDK 自建"轻量版 |
| 模型 | `deepseek-chat`（chat completions + function calling） | 用户指定 DeepSeek；与周报合成同源可对照 |
| 触发 | `systemd/user` 的 `techradar-distill.timer`（Mon 03:00，Persistent） | 全链缓冲，见试点范围表 |
| 游标 | `~/techradar/health/distill.state`（周号，成功才前移；`--force` 供补跑/演练跳过 P1-P4） | 原 Memory Store 的本地等价物 |
| 验收器 | harness 确定性校验（自检清单可机械化项：头部三件套/基线日期/URL 日期段/无内网泄漏），失败自动退回返工 1 轮，仍失败留痕不推 | 原 Outcomes 质检器的本地等价物 |
| 读护栏 | read 白名单=克隆内 `tech-tracking/` `_posts/` `techradar-status/`，单文件 40K 字符截断，无 shell | 模型能力面最小化 |
| 成本量级 | 周频单次，读 ~10 万 token 级 | 个位数人民币/月 |

## 相关

- 路径与决策依据：[自我进化智能体跟踪/2026-11-15.md](../自我进化智能体跟踪/2026-11-15.html) 演进注记
- 作业/验收标准：[周报蒸馏playbook.md](周报蒸馏playbook.html)｜[周报验收rubric.md](周报验收rubric.html)
- 运行记录：[试点日志.md](试点日志.html)
