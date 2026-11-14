# 技术周报 · 2026-W46

## ① 结论速览

1. **Google发布首个决策模型：1M tokens低至$0.1，单次前向生成结果** —— 决策模型范式被头部平台以极低定价推向市场，直接冲击Jev的定价与护城河叙事；同周Perplexity Decider v1.3发布、Kakao/Sarvam等决策类产品跟进，构成『决策模型赛道拥挤化』持续发酵（多批出现且从创业公司扩散到大厂）。（可信度：中｜课题：Jev / 决策模型）
2. **Perplexity Decider v1.3发布训练/评测/用例，KDnuggets盘点Jev开源替代** —— 大厂级竞争者进入决策模型赛道并公开评测方法，同时出现Jev替代品盘点，需对照Jev护城河（OpenRouter份额、Decision Index独立化）逐条核实。（可信度：中｜课题：Jev / 决策模型）
3. **Google Gemini Decisions API（HN 220分）** —— 若为决策API的开发者侧落地，即命中课题①『决策层被主流框架原生集成』可证伪信号，需核实官方文档确认。（可信度：中｜课题：Agent范式（伞形））
4. **google/skills官方Agent Skills集合(+1,933★/wk)与addyosmani/agent-skills(+3,502★/wk)** —— 平台方与社区同时推出skill库并高速起量，是『skill/playbook出现标准或市场』信号的强证据；同周Donchitos/Claude-Code-Game-Studios（49 agent+72 skill）佐证规模化。（可信度：高｜课题：Agent范式（伞形））
5. **AWS开源UAEF跨框架Agent评测框架并防prompt注入** —— 大厂开源统一评测框架，直接对应『独立评测验证基建起飞』信号；同周Learnings from Auditing Public Evaluations指出基准饱和、MaxxBench质疑DeepSWE分数，形成评测可信度议题群。（可信度：高｜课题：Agent范式（伞形））
6. **vercel-labs/agent-desktop周增6414星：面向AI agent的computer use CLI** —— 大厂实验室出品的CLI原生出口快速起量，命中『CLI原生MCP出口/包装器自动生成』观察点。（可信度：中｜课题：Agent范式（伞形））
7. **IBM与微软联合推出行业化Agent平台；LangChain获3亿美元融资；百度DuMate/多agent数字人平台** —— 平台一体化收编agent层的风险信号持续累积（多批出现：IBM+微软、百度、LangChain资本集中），需评估harness类项目被吞并的加速风险。（可信度：中｜课题：Agent范式（伞形））
8. **Anthropic Claude Fable 5.2/Mythos 5.2可协调agent集群；Gemini 4 Hydrogen提及Orchestrator** —— 头部模型厂商把多agent协调作为原生能力，涉及决策层收编与编排OS化两条线，需核实Orchestrator是否构成原生编排。（可信度：中｜课题：Agent范式（伞形））
9. **Claude Code『Don't Ask Again』致1,122个公开GitHub文件泄露密码** —— CLI agent权限持久化配置导致凭据泄露实案，直接命中『agent/MCP/skills生态权限提升或投毒实案』信号，置信度高。（可信度：高｜课题：security-risk）
10. **ThreatDown警告自主AI agent集群攻击台湾政府网络达四天** —— 多子agent协同攻击的实战案例，命中『AI挖洞进入主流攻防实案』信号；同周45个LLM渗透工具盘点、CNAS『主权agent』失控风险框架构成攻防两侧证据面。（可信度：高｜课题：security-risk）
11. **Cloudflare按Agent粒度访问策略；WhiteMatter融资2000万美元监管企业AI agent；United Airlines禁止AI agent代订票** —— agent身份/权限治理基建与治理创业赛道同时出现，叠加企业以政策封堵agent代操作，是agent权限边界风险市场化的持续发酵信号（多批出现且从基建到政策升级）。（可信度：中｜课题：security-risk）
12. **智元开源LIFE终身具身智能框架（含Plastic Memory）；SkillAnchor跨模型协作式技能进化** —— 学习循环与记忆标准化出现开源框架与学术方法双线推进，直接对应『学习循环标准化/技能市场』观察点。（可信度：中｜课题：自我进化智能体）
13. **百度ERNIE全栈更新，Famou自进化agent升级3.0并推Token Exchange** —— 国内大厂自进化agent平台化+前向部署工程师模式，是『第4代载体特征（编排OS化/平台吞并）』的样本；同周Salesforce R&D Agents自改进落地、IBM+微软行业平台构成平台吞并持续发酵。（可信度：中｜课题：自我进化智能体）
14. **Self-Reorganising AI Agent Team产出超越FlashInfer的GPU kernel（1.21x）** —— 自我进化agent在真实工程任务上的可量化实证，比通稿类宣称更可信，可作为Raven实测可信度的对照基准。（可信度：中｜课题：自我进化智能体）
15. **GenericAgent以3.3K行种子自演化技能树并宣称6倍token节省；EvoGroup群体agent自进化harness** —— 技能市场与harness演化两条线均有新项目，但均为自述数据，需实测验证；EvoGroup直接触及共享上下文记忆标准化。（可信度：中｜课题：自我进化智能体）
16. **自我进化具身智能体综述发布；Metamorphic Project 2501提出Generator-Verifier-Updater框架** —— 该方向开始形成学术议程与候选范式，是课题成熟度提升信号，但框架是否被主流采纳仍待观察。（可信度：低｜课题：自我进化智能体）
17. **微软研究院AI Frontiers团队解散** —— 大型实验室组织调整，可能影响agent与模型研究的外部供给，属行业结构性信号。（可信度：中｜课题：general）
18. **Nvidia据报准备罢免黄仁勋（WSJ）与Jensen Huang resigns传闻** —— 两批均出现但均未证实，若属实则冲击AI算力供给预期，需交叉核实后再评估，暂列待证实。（可信度：低｜课题：general）
19. **中国前沿模型携带出口管制GPU指纹** —— 算力供应链合规风险的可识别证据，影响国内模型迭代节奏，与Jev/self-evolving的国内供给面间接相关。（可信度：中｜课题：general）

## ② 热榜汇总

**GitHub Trending 周榜**


**Hacker News（去重后）**

- [PyPI's redesigned project pages with clearer security signals are now live](https://blog.pypi.org/posts/2026-11-06-ui-updates-complete/)（score=86 comments=18）
- [Italy fines Meta €805M over photo privacy](https://www.rapporteur.com/news/italy-fines-meta-880mn-over-photo-privacy-authority/)（score=67 comments=24）
- [KDE: The Documentary on Free Software [video]](https://tube.kockatoo.org/w/fFinNHfanLT7aBEb2B8y4c)（score=157 comments=23）
- [Why get an expensive Pi when I have an old phone?](https://so.long.thanks.fish/why-pi-when-i-have-an-old-phone/)（score=367 comments=222）
- [Advancing science and engineering with Antigravity's /teamwork](https://research.google/blog/advancing-science-engineering-with-antigravitys-teamwork-feature/)（score=63 comments=16）
- [Show HN: A terminal-native idle factory game, written in Rust with ratatui](https://gitlab.com/snipedbywifi/terminactory)（score=72 comments=12）
- [Generative AI uses more energy on non-English text](https://news.umich.edu/generative-ai-uses-more-energy-on-non-english-text/)（score=93 comments=64）
- [Show HN: Fursoy – Out-of-order RV64IMAFDV core in SystemVerilog (Linux 6.6)](https://github.com/FURSOY/fursoy-cpu)（score=28 comments=7）
- [Show HN: Agweb – a browser for agents that stays out of your way](https://github.com/paul-nameless/agweb)（score=45 comments=12）
- [Testing a Trash Can Faraday Cage](https://www.jefftk.com/p/testing-a-trash-can-faraday-cage)（score=37 comments=20）

## ③ 课题跟踪

- **Agent范式（伞形）**：信号①（决策层原生集成）出现Google Decisions API候选证据，待官方核实；信号②（skill标准/市场）由google/skills与agent-skills高速起量强化为高置信；信号④（独立评测基建）由AWS UAEF开源强化为高置信；风险侧平台收编信号累积（IBM+微软、LangChain融资、百度平台），建议将『平台一体化收编』从风险观察升级为主动跟踪项。
- **Jev / 决策模型**：国内大厂入场信号已由Google决策模型（1M tokens/$0.1）与Perplexity Decider v1.3双重兑现，定价规则面临颠覆；新增待核对项：Jev开源替代盘点（KDnuggets）与Kakao/Sarvam决策产品是否构成路线重叠；OpenRouter份额与Decision Index独立化仍无新数据，列为下周优先核实。
- **自我进化智能体**：第4代载体特征（编排OS化/平台吞并）由百度Famou 3.0、Salesforce R&D Agents、IBM+微软平台三案例强化；学习循环标准化出现LIFE（Plastic Memory）与SkillAnchor两条可跟踪路径；新增待验证项：GenericAgent 6倍token节省与EvoGroup共享上下文harness需实测，Raven可信度可对照Self-Reorganising团队1.21x实证。
- **security-risk**：信号②（agent/MCP/skills权限提升或投毒实案）由Claude Code凭据泄露（1,122文件）高置信兑现；信号①（AI挖洞进主流攻防）由agent集群攻击台湾政府网络四天+45个LLM渗透工具强化；新增治理侧观察：Cloudflare agent粒度访问策略、WhiteMatter agent监管创业、United Airlines封堵agent代操作，建议将『agent治理/监督层市场化』纳入watch。

## ④ 精选 deep-dive

- **决策模型赛道拥挤化：Google Decisions API、Perplexity Decider v1.3与Jev护城河逐条核对** —— 本周决策模型信号从创业公司扩散到Google/Perplexity/Kakao/Sarvam多玩家，且出现Jev开源替代盘点，需系统核对OpenRouter份额、Decision Index独立化、定价规则是否被颠覆，判断Jev叙事是否被平台收编。
- **skill/playbook标准化与平台收编双线：google/skills、agent-skills与IBM+微软/LangChain动向** —— skill库高速起量（平台方+社区）与平台一体化收编（IBM+微软、LangChain 3亿美元、百度）同周发生，需判断skill标准是由社区还是平台主导，以及harness类项目衰退加速信号是否成立。

## ⑤ 数据附录

- 本周分析 token：28378
- Laya 初筛效果（影子期）：样本 584｜影子期未拦截
