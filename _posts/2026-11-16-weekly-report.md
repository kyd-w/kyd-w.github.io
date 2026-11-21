# 技术周报 · 2026-W47

## ① 结论速览

1. **Microsoft Agent Framework PyPI 包被投毒窃取 Azure/CI 凭据（多批合并）** —— 同一事件在第三、四批独立出现（Endor Labs、SecurityWeek 等），影响面约 19 万月下载量，且披露方称发布后 6 分钟即检出——既是 agent 生态供应链投毒实案，也是防御侧响应速度的可量化样本；『持续发酵』：多批出现且从单一披露升级为多家安全厂商交叉确认。（可信度：高｜课题：security-risk）
2. **Google GTIG：agentic 威胁活动越过显著阈值，攻击者用 AI agent 运行漏洞利用与犯罪战役** —— 第二批（Amazon 威胁情报 Artex agent）与第四批（GTIG AI Threat Tracker、Agent Zero 等开源 agent 框架被滥用）构成同一趋势的升级链，直接命中『AI 挖洞/agent 承载攻击进入主流攻防实案』信号；『持续发酵』：跨批出现且从单点案例升级为云厂商威胁情报的阈值判断。（可信度：中｜课题：security-risk）
3. **Google 发现攻击者用 AI agent 从软件补丁自动构建并运行漏洞利用** —— AI agent 从辅助编码跨到自动化漏洞利用开发，是攻防节奏变化的直接实证，与 GTIG 阈值判断互为佐证。（可信度：中｜课题：security-risk）
4. **Optimizely 被入侵，向 Zoom、GitLab 等大厂投放恶意软件** —— 第三方脚本供应链投毒波及头部品牌，是 agent/工具生态权限与投毒实案的邻近样本，可交叉验证投毒路径与影响面。（可信度：中｜课题：security-risk）
5. **Java4Shell（CVE-2026-114938）与 Nginx 未认证 RCE 密集出现** —— 基础设施级高危漏洞本周集中出现且热度极高，构成评估 AI 辅助攻防节奏的背景基线；Java4Shell 在第四批被再次提及（时间标注异常待核实）。（可信度：中｜课题：security-risk）
6. **Self-Evolving AI Agents Survey 2026：首份系统性综述与分类框架** —— 给出『进化什么/如何进化』的分类与评测维度，可作为自我进化课题的基线文献，直接支撑『学习循环标准化』关注项。（可信度：高｜课题：自我进化智能体）
7. **Language Models Can Rewrite Their Own Weights** —— 直接触及自我进化核心机制（模型自改权重），是判断学习循环能否闭环的关键技术信号，与综述同周出现形成呼应。（可信度：中｜课题：自我进化智能体）
8. **Verify by Doing：actor/evaluator harness 协同进化，无需外部 ground-truth 自改进** —— harness 协同进化方法直接对应『学习循环标准化』与自进化评测基建，且与 agent-paradigm 的 harness 议题交叉。（可信度：中｜课题：自我进化智能体）
9. **9 校联合发布 126 页『持久在线智能体』路线图** —— 涉及长期记忆与运行中自我改进，贴近学习循环标准化议题，是学术侧对持久 agent 的系统性表态。（可信度：中｜课题：自我进化智能体）
10. **自进化 agent 产品化落地：变更感知→影响定位→建议升级→人工批准；WorkSwarm 失败反馈自修 skill** —— 两批分别出现产品形态与 skill 自修正案例，共同指向『学习循环标准化/技能市场』信号，但均为个体实践，可信度中等。（可信度：中｜课题：自我进化智能体）
11. **决策模型赛道竞品密集：Perplexity Decider v1.3、Strands Decider、Liquid AI d1 系列、Clef 27B/9B、d3 系列** —— 多批出现新决策模型且多走开放权重路线，直接冲击 Jev 差异化定位；其中『开源决策模型人工复核分流 8% vs Jev 50%』是护城河与校准差距的量化线索，需核实来源。（可信度：中｜课题：Jev / 决策模型）
12. **决策模型被主流平台集成：Amazon 多后端接入 Jev 与开源替代，第三方盘点将 Jev 与 Clef/Kev 并列** —— 直接对应『决策层被主流平台集成』与『品类认知形成』信号，是 Jev 课题最接近可证伪的一条进展。（可信度：中｜课题：Jev / 决策模型）
13. **宣称登顶 Decision Index 的全尺寸开源决策模型（300 模型同台）** —— 涉及 Decision Index 独立性与新玩家入场，但疑似营销通稿，需核实后再计入『Decision Index 独立化』信号。（可信度：低｜课题：Jev / 决策模型）
14. **IETF 草案将 A2A 等 agent 消息格式纳入网络管理标准** —— agent 互操作标准化的可证伪信号，对应『skill/playbook 出现标准』关注项，但处于草案阶段。（可信度：中｜课题：Agent范式（伞形））
15. **Sierra Poppy 1.0（Personal Agent Protocol）获 Shopify 全店启用、Meta Muse 接入** —— 个人 agent 与企业交互协议出现首批规模化采用方，是『skill/playbook 出现标准或市场』的直接样本。（可信度：中｜课题：Agent范式（伞形））
16. **平台一体化收编信号群：Azure Databricks Agent Bricks 明确 agent loop 由 LangGraph/OpenAI Agents SDK 承载、Microsoft Agent Framework 1.0 取代 Semantic Kernel、Windows 11 采集 coding agent 使用数据、CopilotKit OpenBot 1.0 内置治理层** —— 多批从云平台、OS、框架、开源运行时四个层面同时出现收编 agent 决策层/工具层的动作，是课题风险信号『平台一体化收编』最密集的一周；『持续发酵』：跨批出现且收编层级从框架扩展到 OS 与云平台。（可信度：中｜课题：Agent范式（伞形））
17. **harness 生态活跃度反证：HN 高热讨论『每个模型最佳 harness』、LangChain 3 亿美元 C 轮估值 30 亿** —— 与课题『harness 类项目衰退加速』假设形成反向证据，编排层仍在扩张，需在课题内做正反核对而非单向确认。（可信度：中｜课题：Agent范式（伞形））
18. **独立评测验证基建兴起：AWS agent 可观测性框架、Claude Code 自建测试框架自审、AI Agent Studio 内置自动评测** —— 对应『独立评测验证基建起飞』信号，但多为厂商自述，需交叉验证。（可信度：中｜课题：Agent范式（伞形））
19. **AI agent 在审计场景提问质量超过 KPMG 会计师；DaisyRose-27B 小规模 RL 使 Terminal-Bench 从 5.6% 升至 12%** —— 前者是 agent 在专业服务替代性的可证伪实测，后者为 agent 训练/评测基建提供可复现数据点。（可信度：中｜课题：Agent范式（伞形））
20. **GPT-6.2 Astra/Sol、Gemini 4 Neon 等新一代模型密集发布** —— 本周模型能力基线显著变化，是 agent 决策层底座与决策模型能力假设的共同输入，但非课题可证伪信号。（可信度：中｜课题：general）
21. **Lovable 应用泄露护照信息与超 20 万条私信** —— AI 生成应用低代码平台的大规模数据暴露，是『防御侧滞后』的实证样本，可入安全风险案例库。（可信度：中｜课题：security-risk）

## ② 热榜汇总

**GitHub Trending 周榜**


**Hacker News（去重后）**

- [Derek Lowe: Detonating a Pile of Lead Azide](https://www.science.org/content/blog-post/detonating-huge-pile-lead-azide-really)（score=299 comments=181）
- [Lean Verification of the Riemann Hypothesis - Joint statement by...](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/)（score=356 comments=263）
- [Brazil's tax authority open-sources its tax calculator on GitHub under MIT](https://www.gov.br/receitafederal/pt-br/assuntos/noticias/2026/novembro/receita-federal-publica-primeiro-codigo-fonte-aberto-no-github-e-amplia-transparencia-da-reforma-tributaria)（score=437 comments=147）
- [My Monitor Was Cutting My Download Speed by 75%](https://blog.tymscar.com/posts/studiodisplayethernet/)（score=255 comments=115）
- [Show HN: Zero C#, Power of C# without any GC](https://onurgumus.github.io/zero-csharp/index.html)（score=42 comments=30）
- [Hurried Announcement: Alessandro Masullo GRH](https://math216.wordpress.com/2026/11/20/hurried-announcement-alessandro-masullo-grh/)（score=2307 comments=1097）
- [Levent Alpöge claims proof of the Generalized Riemann Hypothesis [pdf]](https://alpo.ge/remark.pdf)（score=2808 comments=1975）
- [PostgreSQL Extensions in Go](https://jespino.github.io/gopgext/)（score=4 comments=0）
- [I'm quite pleased by the tech architecture of my art website](https://klauria.tech/klauria-art/)（score=51 comments=8）
- [Inkling 2 Mini](https://thinkingmachines.ai/news/inkling-2-mini/)（score=1231 comments=238）

## ③ 课题跟踪

- **security-risk**：信号②（agent/MCP/skills 生态投毒实案）由『待观察』升级为『已实证』：Microsoft Agent Framework PyPI 投毒获多家安全厂商交叉确认，影响面约 19 万月下载，检出时延 6 分钟可作防御侧响应基线；信号①（AI 挖洞进主流攻防实案）同步升级：GTIG 判定 agentic 威胁活动越过显著阈值，AI agent 已用于从补丁自动构建漏洞利用。建议新增跟踪项：agent 框架官方包仓库的发布签名/审计机制现状。
- **Jev / 决策模型**：『决策层被主流平台集成』信号首次出现明确样本（Amazon 多后端接入 Jev 与开源替代），但同期开源竞品密度显著上升（Perplexity Decider、Strands Decider、Liquid d1、Clef、d3），且出现 Jev 人工复核分流比例偏高（50% vs 8%）的量化质疑。建议将『OpenRouter 份额』与『人工复核分流比』并列为护城河硬指标，并核实 Decision Index 独立性。
- **Agent范式（伞形）**：风险信号『平台一体化收编决策层/工具层』本周在云平台（Agent Bricks）、OS（Windows 11 采集）、框架（Microsoft Agent Framework 1.0 取代 Semantic Kernel）、开源运行时（OpenBot 1.0 内置治理）四个层面同时出现，建议将该风险信号从背景观察提升为一级跟踪项；同时『harness 类项目衰退加速』假设本周出现反向证据（HN 高热 harness 选型讨论、LangChain 大额融资），建议标注为『存在争议，需继续双向核对』。
- **自我进化智能体**：『学习循环标准化』信号本周获得基线文献支撑（Self-Evolving AI Agents Survey 2026 分类框架）与机制层突破（模型自改权重、harness 协同进化无需外部 ground-truth），并有产品化落地形态（变更感知→建议升级→人工批准）。建议将『自改权重/无监督自改进』列为下一代载体特征候选，并跟踪 Claude skills 是否出现同类学习循环。

## ④ 精选 deep-dive

- **决策模型赛道竞争格局重估：开源替代、平台集成与 Jev 校准差距** —— 本周 Jev 课题信号密度最高且方向不一——Perplexity/Strands/Liquid/Clef/d3 多线开源竞品、Amazon 多后端集成、第三方盘点已把 Jev 与 Clef/Kev 并列，同时出现『人工复核分流 8% vs 50%』的量化对比。需要一次性核实各竞品真实性、Decision Index 独立性，并判断 Jev 护城河（OpenRouter 份额）是否被实质侵蚀。
- **agent 生态供应链投毒与 agentic 攻击阈值：从个案到趋势** —— Microsoft Agent Framework 投毒（6 分钟检出、19 万月下载）、Optimizely 供应链攻击、GTIG agentic 威胁阈值判断、AI agent 自动生成漏洞利用四件事同周出现，且分属『投毒实案』与『AI 挖洞实案』两条信号。值得系统梳理攻击面迁移路径与防御侧响应时长，判断是否触发课题的『应急响应恶化』风险信号。

## ⑤ 数据附录

- 本周分析 token：25481
- Laya 初筛效果（影子期）：样本 897｜影子期未拦截
