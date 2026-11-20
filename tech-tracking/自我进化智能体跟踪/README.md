---
---
# 自我进化智能体 · 持续跟踪

> 建档：2026-11-02 ｜ 本文件是**活文档**（跟踪维度现状 + 渠道 + 日志），每次跟踪后更新；详细数据见同目录的日期快照。
> 背景：从《AI技术热点全景扫描-2026-11-02》中立项，与 [[jev-system1-tracking]]（决策模型）并行跟踪。

## 为什么跟踪（核心判断）

- 自我进化智能体是 2026 年 agent 领域公认的未来方向：agent 从"被动调用工具"走向"从经验中持续改进自己"
- **两层结构**（立项时确立的分析框架）：
  - **载体层 = 常驻智能体（always-on runtime）**：7×24 常驻、跨会话记忆、多渠道交互——是自我进化的**基础**
  - **机制层 = 进化机制**：学习循环、技能沉淀、harness 自我改进——是自我进化的**本体**
- **跟踪原则（用户判断，2026-11-02 确立）**：载体层**产品换代极快**——OpenClaw 8 个月从"史上最快增长"到基本无人提起，接棒者为 Hermes Agent（爱马仕）、DeepSeek Harness 等。因此**盯范式迁移与进化机制，不盯单一产品**；单品热度只作为范式验证信号
- 进化路线共识：不碰模型权重、只进化外围（技能库、记忆、harness 程序）——API 模型时代唯一可落地路线

## 载体层换代史（活表格：新品出现即追加）

| 代际 | 产品 | 主体 | 时间 | 状态（2026-11-02） | 范式贡献 |
|---|---|---|---|---|---|
| 1 | OpenClaw | 开源社区 | 2026 初爆发（60 天破 React 十年星标纪录） | **已退热**：社区"不会成为真产品"讨论、替代品清单泛滥 | 证明常驻个人助手需求：本地运行 + Discord/iMessage/Slack 等既有渠道 |
| 2 | **Hermes Agent（爱马仕）** | Nous Research | 2026-02 开源，持续更新中 | 活跃（28.4k⭐ 4 月口径；v0.23.1 @11-10）；Hermes Cloud 付费托管常驻（11 月口径） | **首个内置学习循环**：每 15 任务复盘、经验生成技能、两层记忆（MEMORY.md + FTS5 跨会话检索）——载体与进化机制首次结合；商业化路径=官方托管常驻 |
| 2.5 | NanoClaw / NemoClaw 等 | 社区/NVIDIA | 2026 中 | 细分存续 | 极简（树莓派）/ 安全增强（NVIDIA 官方教程）等垂直方向 |
| 2.7 | **GenericAgent** | 开源社区（复旦 A³LAB × 深圳 Aquaintelling） | 2026-01 创建，持续日更 | 活跃（14.4k⭐ @11-18；arXiv 2604.17091 + 评测数据集随仓公开；第三方复现未见） | 与 2 代同赛道（开源常驻单品+内置学习循环）的最完整开源实证：3.3K 行种子自举技能树——运行时把执行路径固化 SOP 写入 L0–L4 分层记忆（L1 防写坏护栏）、反思由记忆系统触发而非用户；Lifelong AgentBench token 6.0x 优 OpenClaw（跨基准 2.9–3.9×，头条口径）；11-18 实测入表（[快照](2026-11-18.html)）。注：仓库创建早于 Hermes 开源，2 代"首个内置学习循环"归属待复核 |
| 3 | **DeepSeek Harness** | DeepSeek | 2026-10 v1.2 | 活跃 | **智能体编排/操作系统化**：Codex 与 Claude Code 作为子智能体插件、Git 工作树、思考翻译、Cordis 插件化四层解构 |
| 3.1 | dsh-superagent-prototype | DeepSeek | 2026-10-31 开源（MIT） | 活跃（研究原型） | 3 代载体官方常驻化：事件驱动常驻 coding agent（监听 GitHub/飞书→自动出 PR、可并行、"会主动干活更懂何时闭嘴"分寸规则）——编排 OS 厂商亲自下场常驻智能体 |
| 3.5 | **TechRadar（本课题实验管线）** | 自建（38服务器） | 2026-11-02 上线 | 活跃 | 载体替代实证：OpenClaw→dsh 架构的 API 模式先行（dsh 集成待二期）；日采集+Laya 影子初筛+DeepSeek 周报，全链路 systemd 化；**11-15 自主化路径立项**（[演进注记](2026-11-15.html)）：巡检/蒸馏/push 三环节从人工断点降级为 agent 闭环，判断资产显式化优先、载体后选 |
| ? | dots | OpenAI | DevDay 2026-09-29 发布 | 平台级变量 | 独立云电脑 + 4000+ 应用连接 + Astra 驱动；闭源平台派常驻智能体，已出 system card |

> 📌 2026-11-02 实录：OpenClaw（1 代）在 38服务器正式退役（系统级+用户级双单元均下线）——生命周期 2026 初爆红 → 11 月自建替代，全程约 10 个月，再次验证"载体换代快、盯机制不盯单品"。

## 跟踪维度与现状

| # | 维度 | 现状（2026-11-18） | 下次关注 |
|---|---|---|---|
| 1 | **载体层（常驻运行时）** | 无第 4 代信号，三路线在"常驻+自我改进"处合流：3 代 DSH 官方下场常驻化（dsh-superagent，10-31 MIT）；2 代 Hermes 托管商业化（Hermes Cloud）；平台派吸收学习循环（Managed Agents Dreaming）；插件生态大到长出 curation 基建（awesome-dsh-plugin 每日自动抓取+人工复核，11-12） | 第 4 代载体特征判定（编排 OS 常驻化 vs 平台吞并）；dsh-superagent 是否转正；dots 开放生态 |
| 2 | **进化机制（学习循环/技能沉淀）** | 🚨 第三深度（harness 自我改写）标准化收敛（[11-14 快照](2026-11-14.html)）：学术定名 Self-Harness（2606.09498，被引 111+）→ Lilian Weng 工程化长文（07-04）→ DSH 创造模式产品化（待验证）→ Claude Managed Agents Dreaming/Outcomes 平台原生；Hermes 学习循环仍是最完整开源实现；11-15 蒸馏散点 +2 经 11-18 核实修正（[快照](2026-11-18.html)）：智元 LIFE **部分实证**（感知-记忆前半环真代码+LoRA 权重，EDM 技能环 paperware，22★@11-18）；SkillAnchor **实体不存在**（合成失真第 4 例，撤——"格式级互通"正确锚点=arXiv 2608.14036 技能跨框架鲁棒性实证）；**首个可量化对照基准=EAT**（Berkeley Sky Lab，NeurIPS'26，arXiv 2610.36848；FlashInfer-Bench 47 负载 1.21x mean——**引用必带限定语：追加预算；匹配 $800 预算 0.72x 仍低于专家 kernel**）；11-18 实测：**WSP 权重直接编辑实证**（gpt-6-astra 无梯度改 Qwen-0.8B 权重 0.016%，MATH-500 7.9→48.1——"碰权重"从不可能变为实证通路；原"Astra"条目系周报改名）＋GenericAgent **实证**（运行时 SOP 固化+分层记忆，14.4K★@11-18；6x 系头条口径，跨基准 2.9–3.9×）；**11-20 watch 核查：WSP 成 arXiv 子领域**（[快照](2026-11-20.html)——11-16~19 四天 ≥10 篇六路齐发：第三方复现/机制理论/架构学/基准 IWIBench/框架/域扩散；**大改小边界维持、小自改零复现无逆转**）；互通线新锚点 **SkCC**（2605.03353 v4，跨框架技能编译器+安全） | "Self-Harness"为标准检索词；框架采纳（LangChain 内置？）；技能市场/共享机制；技能跨框架鲁棒性线（2608.14036 后续 + SkCC 评审/采纳信号）；WSP 子领域（IWIBench 模型横评结果 / W47 周报对 11-16~19 论文群覆盖观察） |
| 3 | **Harness 自我进化研究** | 锚点文献确立：Self-Harness（2606.09498）三段循环（失败挖掘→harness 提案→回归测试）；EvolveNet（2608.04968）；self-evolving-agent-patterns（1000+ 模式）；Raven（EverMind，repo 6.2k★@11-18 + arXiv 2609.33439）：**离线 harness 进化（验证器门控）实证偏强 2.5/3**（HarnessBank 七基准 held-out），"L3 数字生命"系通稿自设话术 0/3——11-02 挂起关闭；HyperVolve 融资（待证实）；EvoGroup 部分实证（11-18：论文 arXiv 2611.03868 真实——群聊记忆垂直域的 Self-Harness 变体、无回归门，但**代码未兑现**且周报"群体互进化"系误读，仅作限定用途旁证） | Self-Harness 复现与主流框架采纳；Raven 独立复现/同行评审（自报口径）；EvoGroup 代码兑现复查（低频） |
| 4 | 平台厂商 | OpenAI dots（常驻+云电脑）；**Claude Managed Agents 已长出学习循环（Dreaming 持续学习 + Outcomes 自验证，官方文档）——watch 命中，但在平台层非 skills 层**；Manus、Claude Cowork 等 | Dreaming 出研究预览后的采用数据；skills 层是否跟进学习循环；dots system card 安全边界 |
| 5 | 学术线 | 2026-06 系统性 survey（Model-Centric → Environment-Driven Co-Evolution）；harness 进化成为新分支 | 顶会专题；世界模型（Genie 4）作为进化训练场的交叉 |
| 6 | 安全与治理 | 常驻代理权限事件（Meta Muse 读私信→苹果收紧 macOS FDA）；"代理攻击面"（认证/审计/权限分级） | L3 级自主性的治理框架；常驻代理的权限最小化标准 |
| 7 | 与决策模型交叉 | 决策模型（Jev 生态）可作 harness 内高频门控组件；RLCD²（决策前简短推理）与 harness 进化同构 | 决策层进入主流 harness 框架的案例 |

## 跟踪渠道

| 类型 | 入口 |
|---|---|
| GitHub | [NousResearch/hermes-agent](https://github.com/nousresearch/hermes-agent) ｜ [AFunLS/self-evolving-agent-patterns](https://github.com/AFunLS/self-evolving-agent-patterns) ｜ [Zhang-Henry/CoEvoSkills](https://github.com/Zhang-Henry/CoEvoSkills) ｜ DeepSeek Harness 官方仓库（待锁定） |
| arXiv | 搜索：`self-evolving agent` / `harness evolution` / `agent skill learning` / `continual agent learning` |
| 厂商 | OpenAI（dots system card）｜ Anthropic（Claude Code skills/changelog）｜ Nous Research 博客 ｜ DeepSeek |
| 社区 | r/AgentsOfAI、r/selfhosted、Hacker News、宝玉等中文博主、CSDN/知乎（DeepSeek Harness 解析多为中文首发） |
| 综述锚点 | [Self-Evolving Agents: The Emerging Stack](https://blog.agihouse.org/posts/self-evolving-agents-the-emerging-stack-and-field-insights) ｜ [Vellum: OpenClaw Alternatives](https://www.vellum.ai/blog/best-openclaw-alternatives)（换代风向标） |

## 快照日志

| 日期 | 快照文件 | 要点 |
|---|---|---|
| 2026-11-02 | [2026-11-02.md](2026-11-02.html) | 建档：两层框架（载体/机制）+ 载体换代史（OpenClaw→Hermes→DS Harness→dots）+ 现状基线 |
| 2026-11-08 | [2026-11-08.md](2026-11-08.html) | W45 周报蒸馏（标题级待证实）：「学习循环标准化」watch 首次密集命中但均为散点（Astra 权重级/EvoGroup harness 级/GenericAgent 技能级）；编排 OS 化基建同批出现（Amazon Infinity/Rivet/Temporal）；Astra 为反共识信号（碰权重，粒度待核）；HyperVolve 大额融资；国内通稿两条待验证 |
| 2026-11-14 | [2026-11-14.md](2026-11-14.html) | 🚨 第三深度（harness 自我改写）标准化收敛：Self-Harness 定名→Lilian Weng 工程化→DSH 创造模式（待验证）→Managed Agents Dreaming/Outcomes 平台原生；载体层 dsh-superagent（3 代官方常驻化，10-31 MIT）+ Hermes Cloud（2 代托管商业化）；无第 4 代信号，三路线在"常驻+自我改进"合流 |
| 2026-11-15 | [2026-11-15.md](2026-11-15.html) | W46 蒸馏（无 🚨）：学习循环标准化散点 +2（智元 LIFE、SkillAnchor 跨模型技能互通）；首个可量化对照基准 Self-Reorganising 1.21x 超 FlashInfer（通稿类主张以此为尺）；平台吞并线三案例强化（百度 Famou 3.0/Salesforce R&D Agents/IBM+微软）——第 4 代判定证据继续偏向"平台吞并"但无产品级实锤；GenericAgent/EvoGroup 实测第三次顺延 |
| 2026-11-17 | [2026-11-17.md](2026-11-17.html) | **点位 4 首期人工合入**（W46 蒸馏 agent 草稿 `ebe9d32` 产出 11-17、审合入 11-20）：事实集与 11-15 人工快照一致（无新事实），价值=agent 侧判断结构 + GAP-1/2 修复实证（四次顺延链数出、判断带 11-08 出处、watch 未命中如实记录）；合入时应用 11-18 修正清单（SkillAnchor 撤、EAT 真名+限定语、LIFE 收窄、GenericAgent 入表 2.7 行）并修两处已知瑕疵（基线语义、.html 链接）；🚨 提议复核=不采纳 |
| 2026-11-18 | [2026-11-18.md](2026-11-18.html) | **B 线欠账全清专题**（两波 7 实体全验：三仓四顺延红线 + W46 条目/Raven 尺子各二顺延同日清）：Astra=周报改名→真身 **WSP 权重直接编辑实证**（反共识通路打开，两重降速随行）；GenericAgent **实证**入表 2.7 行；EvoGroup 部分实证（代码未兑现）；LIFE 部分实证（技能环 paperware，归类收窄）；**SkillAnchor 实体不存在**（失真第 4 例，撤）；Raven 双层拆分（"L3"通稿 0/3 / 离线 harness 进化 2.5/3，11-02 挂起关闭）；1.21x 尺子真身=EAT/Berkeley（够格，引用必带"匹配预算 0.72x 低于专家 kernel"限定语；且与 11-08 W45 #4 同物跨周重复）。**累计实体级硬失真 4/7**——rubric C6 当日立项当日两验，另获 API 直查/同物异名两条方法纪律 |
| 2026-11-20 | [2026-11-20.md](2026-11-20.html) | **watch 线低频检查专题**（API 直查，C6 纪律首次 watch 线实操）：**WSP 成 arXiv 子领域**——11-16~19 四天 ≥10 篇六路齐发（首个 arXiv 第三方复现 2611.21449（Opus 5.5 亦能写权重）、绕圈修复机制理论化 2611.21432、架构学 22055、基准 IWIBench 2611.08647（大改小范式）、框架 WeightCode、域扩散 VLM/扩散/材料/真拖拉机、伦理安全面 24330）——**大改小边界维持、小模型自改零复现无逆转**；互通线新锚点 **SkCC**（2605.03353 v4，跨框架技能编译器+安全，进入工程方案阶段）；EvoGroup 代码仍未兑现、Raven 无复现评审（均无变化）。同日点位 4 首期合入见 [11-17 快照](2026-11-17.html) |

## 更新约定

1. 每次跟踪：新增 `YYYY-MM-DD.md` 快照 + 更新本 README（现状列、换代史表、快照日志）
2. star 数等时效数据必须标注日期；厂商通稿口径（如 Raven）标注"待验证"
3. 重大变化（第 4 代载体出现、学习循环标准化、平台开放/吞并生态）在快照开头用"🚨 变化"标出
4. **单品退热不算新闻，范式迁移才算**——换代史表格是本课题最核心的资产
