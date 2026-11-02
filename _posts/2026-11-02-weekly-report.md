# 技术周报 · 2026-W45

## ① 结论速览

1. **ConnectWise 云备份凭证滥用事件升级：微软归因 Storm-0940 并披露 AI 智能体 ARTEX** —— Huntress 首报后微软跟进归因，攻击链中出现 AI 智能体参与脚本生成与操作，是 AI 驱动攻击从概念走向实战归因的关键样本。（可信度：中｜课题：Agent范式（伞形））
2. **CyberStrikeAI 用 44 个 AI 智能体自动化对日目标攻击，RAGE 框架由 AI 生成** —— 多智能体编排被直接用于扫描与利用互联网暴露服务，与 ConnectWise 事件共同指向『智能体攻击面』这一新风险维度。（可信度：中｜课题：Agent范式（伞形））
3. **决策模型密集涌现：Baseten joey-1（2B/$0.01 每百万 token）、Liquid AI d1-2B、SAP RPT-2、MiniCPM-OCR Jev** —— 多家厂商同期推出面向决策/结构化数据的小型专用模型，且 MiniCPM-OCR Jev 直接以『决策模型』命名，验证决策模型作为独立品类的趋势。（可信度：高｜课题：Jev / 决策模型）
4. **Google A2UI 引入 System One 决策模型驱动界面结构生成** —— 决策模型被嵌入 UI 生成链路（模型决定结构、代码生成组件），是决策模型落地形态的新范式信号。（可信度：中｜课题：Jev / 决策模型）
5. **GitHub Copilot Fusion、Snowflake 动态模型路由：路由/编排层成为产品化焦点** —— 模型选择与路由被做成平台能力（Copilot Fusion 宣称 token 效率提升、Snowflake 称成本降 3 倍），与决策模型『做选择』的定位高度重叠。（可信度：中｜课题：Jev / 决策模型）
6. **LLM 持续学习『睡眠框架』提出知识保留新方法** —— 直接针对持续学习中的灾难性遗忘问题，是自我进化智能体载体层的关键能力补丁。（可信度：中｜课题：自我进化智能体）
7. **AGIBOT 发布 Worken 框架量化机器人有效产出，AGILE 新增自进化智能体能力** —— 具身智能侧明确引入『自进化智能体』并给出产出量化框架，为自我进化提供可度量载体。（可信度：中｜课题：自我进化智能体）
8. **Heretic 2.0 以新方法剥离模型审查** —— 模型后训练干预工具迭代，涉及自我进化中『能力修改』的边界与合规风险。（可信度：低｜课题：自我进化智能体）
9. **中国首个前沿 AI 出口管制（商务部公告第 48 号）** —— 前沿模型被纳入出口管制，将影响开源模型获取与跨境智能体能力供给，需评估对跟踪课题的外部约束。（可信度：中｜课题：general）
10. **欧洲超市冷柜遭第二起疑似网络攻击** —— 关键基础设施连续遭袭，与 ConnectWise、CyberStrikeAI 共同构成本周安全态势升级线索。（可信度：低｜课题：general）

## ② 热榜汇总

**GitHub Trending 周榜**

- [Nutlope/hallmark (+11,566★/wk)](https://github.com/Nutlope/hallmark) —— Anti-AI-slop design skill for Claude Code, Cursor, and Codex.
- [thedotmack/claude-mem (+5,852★/wk)](https://github.com/thedotmack/claude-mem) —— Persistent Context Across Sessions for Every Agent – Captures everything your ag
- [pbakaus/impeccable (+12,017★/wk)](https://github.com/pbakaus/impeccable) —— The design vocabulary for your coding agent. Steer with polish and bolder, revie
- [AgriciDaniel/claude-seo (+5,034★/wk)](https://github.com/AgriciDaniel/claude-seo) —— Universal SEO skill for Claude Code. 26 sub-skills + 19 sub-agents covering tech
- [obra/superpowers (+5,896★/wk)](https://github.com/obra/superpowers) —— An agentic skills framework &amp; software development methodology that works.
- [pingdotgg/t3code (+6,926★/wk)](https://github.com/pingdotgg/t3code) —— 
- [JetBrains/thinkrail (+5,760★/wk)](https://github.com/JetBrains/thinkrail) —— Vibe code with pi in a lightweight, real IDE that customises itself around the w
- [cloudflare/security-audit-skill (+10,069★/wk)](https://github.com/cloudflare/security-audit-skill) —— A coding-agent skill for multi-phase security audits with independently verified
- [jakubkrehel/skills (+1,607★/wk)](https://github.com/jakubkrehel/skills) —— A collection of agent skills that help you build great interfaces.
- [multica-ai/andrej-karpathy-skills (+4,459★/wk)](https://github.com/multica-ai/andrej-karpathy-skills) —— A single CLAUDE.md file to improve Claude Code behavior, derived from Andrej Kar

**Hacker News（去重后）**

- [Show HN: HackerBooks – HackerTube, but for books mentioned on HN](https://hackerbooks.org)（score=1583 comments=259）
- [Postgres 19 is late because so many more bugs are being found now](http://rhaas.blogspot.com/2026/10/postgres-19-is-late-and-its-ais-fault.html)（score=599 comments=365）
- [Show HN: I've updated my Linux System Call website and API](https://syscall.sh/)（score=69 comments=28）
- [Show HN: Wikihack – HackerTube, but for Wikipedia articles mentioned on HN](https://wikihack.netlify.app)（score=287 comments=86）
- [HackerTube: YouTube built from videos recommended by HN](https://karpathy.bearblog.dev/hacker-tube/)（score=2677 comments=597）
- [Bones may release proteins that slow aging and extend life span](https://www.science.org/content/article/bones-may-release-proteins-slow-aging-and-extend-life-span)（score=168 comments=46）
- [Ask HN: Which TV do you recommend for privacy?](https://news.ycombinator.com/item?id=50328896)（score=500 comments=620）
- [F/OSS Comics #13: BSD Unix, Part 3 – The Beginning of BSD Unix](https://fosscomics.com/posts/13.%20BSD%20Unix%20Part%203%20-%20The%20Beginning%20of%20BSD%20Unix/)（score=161 comments=20）
- [Show HN: HackerHack – HackerBooks but for Posts Posted on HN](https://news.ycombinator.com/)（score=113 comments=18）
- [Mystery of 60-Second Fluctuations in Power Grids Solved](https://www.fz-juelich.de/en/news/archive/press-release/2026/mystery-of-60-second-fluctuations-in-power-grids-solved)（score=175 comments=76）

## ③ 课题跟踪

- **Agent范式（伞形）**：本周出现两条智能体被用于攻击的实证（ConnectWise/ARTEX 归因、CyberStrikeAI 44 智能体），建议在跟踪维度中新增『智能体攻击面/对抗性编排』维度，并在可证伪信号中登记『主流厂商对 AI 智能体参与攻击的正式归因』已出现。
- **Jev / 决策模型**：决策模型关注项有实质进展：新增 joey-1、d1-2B、RPT-2、MiniCPM-OCR Jev 四个候选，且出现 A2UI 内嵌决策模型与平台级路由（Copilot Fusion、Snowflake）两类落地形态；建议更新『跟踪维度与现状』表，补充『决策模型 vs 模型路由』区分列，并将 MiniCPM-OCR Jev 列为 OCR 决策子类首个样本。
- **自我进化智能体**：载体层换代史新增两条：LLM 持续学习『睡眠框架』（知识保留方法）与 AGIBOT Worken/AGILE 自进化智能体（具身载体+产出量化）；建议在换代史表中增列『具身智能体』载体行，并在下次关注中登记『自进化能力的量化评估框架』已出现首个机器人侧方案。

## ④ 精选 deep-dive

- **AI 智能体参与实战攻击：从 ConnectWise/Storm-0940-ARTEX 到 CyberStrikeAI 44 智能体** —— 两条独立来源在同一周指向智能体被用于攻击编排与脚本生成，需梳理攻击链、归因证据与防御面，判断是否构成范式拐点。
- **决策模型品类成型：joey-1、d1-2B、RPT-2、MiniCPM-OCR Jev 与路由层竞合** —— 专用小模型与平台级路由（Copilot Fusion、Snowflake）同时发力，需厘清『决策模型』与『模型路由』的边界及对 Jev 课题定位的影响。

## ⑤ 数据附录

- 本周分析 token：3423
- Laya 初筛效果（影子期）：样本 43｜影子期未拦截
