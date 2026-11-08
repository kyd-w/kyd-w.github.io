# 技术周报 · 2026-W45

## ① 结论速览

1. **AI驱动攻击链实证：ConnectWise凭证滥用归因Storm-0940并涉及AI agent ARTEX** —— 微软将ConnectWise云备份凭证滥用归因于Storm-0940并涉及AI agent ARTEX，是AI驱动攻击链的实证案例；与同批CyberStrikeAI（44个AI agent自动化攻击）形成攻击侧agent化的双向印证，需关注agent安全边界。（可信度：中｜课题：Agent范式（伞形））
2. **CyberStrikeAI以44个AI Agent自动化对日目标攻击并生成RAGE框架** —— 多agent编排在攻击侧落地，与ARTEX条目同批出现，共同指向agent范式被武器化的风险信号。（可信度：中｜课题：Agent范式（伞形））
3. **决策模型赛道竞争加剧：Baseten joey-1（2B/$0.01每百万token）与Liquid AI d1-2B密集入场** —— 两款小参数决策模型同批发布，joey-1以极低价格入场、d1-2B强调OpenAI兼容路由与自动failover，直接对应Jev的份额竞争与『决策层被基础设施收编』风险信号，需与OpenRouter份额对照。（可信度：中｜课题：Jev / 决策模型）
4. **Sarvam AI发布开放权重决策模型Prism（基于Sarvam 105B）** —— 又一家厂商推出开放权重决策模型，直接对标Jev赛道，需评估其定位与开放策略差异。（可信度：高｜课题：Jev / 决策模型）
5. **Jev以低成本调用Opus达到同等准确率（4倍成本优势）获外部验证** —— 直接涉及Jev决策模型调用强模型达到同等准确率，是Jev护城河与成本优势的关键外部验证信号，对应watch中『Jev校准差距/独立验证』维度。（可信度：中｜课题：Jev / 决策模型）
6. **Google System One模型驱动A2UI组件生成，决策模型进入主流UI生成管线** —— 决策模型被主流UI生成管线原生集成，可核对『决策层被主流框架原生集成』信号。（可信度：中｜课题：Jev / 决策模型）
7. **平台层吞并决策/路由层：Snowflake动态模型路由降token成本3倍、Cisco Model Foundry推出Antares-3B agentic漏洞定位专用模型** —— Snowflake按复杂度分流请求、Cisco以专用小模型切入agent工具层，均为平台一体化收编决策层/工具层的典型信号，对决策模型独立化构成压力。（可信度：中｜课题：Agent范式（伞形））
8. **cloudflare/security-audit-skill周增9,155星，skill/playbook标准化与市场信号强化** —— coding-agent安全审计skill的高增长是skill/playbook出现标准化与市场信号的直接证据，对应watch项②。（可信度：高｜课题：Agent范式（伞形））
9. **Agent编排基建OS化：Amazon Infinity运行时（Rust）、Rivet在S3上编排Agent、Temporal AI框架集成GA** —— 云厂商自研运行时、编排下沉至对象存储、工作流引擎原生支持agent编排，三者同向指向编排OS化与平台吞并载体特征，需关注是否挤压独立harness项目空间。（可信度：中｜课题：Agent范式（伞形））
10. **Agent工具链安全事件密集：Langflow认证绕过与RCE、Claude Code泄露邮箱及密码至1122个公开GitHub文件、Postman静默安装AI插件并尝试共享全部API数据** —— 编排工具高危漏洞与主流Agent CLI默认配置导致真实凭据泄露，是Agent工具链安全与合规风险的实证案例群，其中Claude Code条目为高置信度实证。（可信度：高｜课题：Agent范式（伞形））
11. **Agent沙箱隔离基建标准化：Firecracker VM逃逸公开利用、Replit沙箱引擎转向microVM、Devvm每项目一VM** —— 微VM隔离逃逸研究与沙箱引擎改造同批出现，直接关系智能体多租户执行环境的安全边界与隔离基建标准化。（可信度：中｜课题：Agent范式（伞形））
12. **监管首次将外部AI智能体纳入风险考量：美银行监管机构发布首个AI框架应对rogue agents** —— 智能体治理与合规环境的制度性信号，与ChatGPT连接器间静默传数据暴露的身份治理缺口相互印证。（可信度：中｜课题：Agent范式（伞形））
13. **Pydantic AI等2026 Python Agent框架综述：MCP双向支持与OpenTelemetry追踪原生集成** —— 主流框架原生集成MCP与可观测性，对应watch项①『决策层被主流框架原生集成』的可证伪信号。（可信度：中｜课题：Agent范式（伞形））
14. **MaxxBench质疑DeepSWE分数真实性，独立评测验证需求上升** —— 针对Agent/编码模型评测分数可信度的独立质疑，呼应watch项④『独立评测验证基建起飞』。（可信度：中｜课题：Agent范式（伞形））
15. **并行Agent工作流工具链自发形成：worktrunk（Git worktree CLI，+1,802★/周）** —— 并行Agent工作流的开发工具链正在自发形成，是harness层工具需求的具体信号。（可信度：中｜课题：Agent范式（伞形））
16. **自我进化学习循环机制信号密集：Astra直接读写权重改进Qwen、失败转化为对话图变更、EvoGroup群体agent自进化harness** —— 权重级改进、失败驱动自改写、群体harness三条路径同批出现，直接对应『学习循环标准化』与『第4代载体编排OS化』watch项。（可信度：中｜课题：自我进化智能体）
17. **GenericAgent以3.3K行种子长出技能树，token消耗降6倍** —— 自进化智能体以技能树结晶任务并大幅降token，是技能市场与学习循环标准化的开源实证，对应watch项『技能市场信号』。（可信度：中｜课题：自我进化智能体）
18. **自进化进入学术体系化与跨域效能验证：具身智能体综述、NeurIPS MolSAGE药物发现达SOTA、UC Berkeley Evolving Agent Teams** —— 综述体系化、跨领域SOTA效能证据与多agent团队自重建三条线并进，为自我进化方向提供可证伪的效能与理论支撑。（可信度：中｜课题：自我进化智能体）
19. **HyperVolve完成数亿元天使轮研发自进化模型，资本开始押注该范式** —— 自进化方向获大额早期融资，说明资本开始押注该范式，需跟踪其技术路线与后续实测可信度。（可信度：中｜课题：自我进化智能体）
20. **AI加速自身研究的实证讨论升温** —— AI加速自身研究的实证讨论，与自我进化智能体的学习循环叙事直接相关，属叙事层信号。（可信度：中｜课题：自我进化智能体）
21. **国内机构发布首个自进化金融大模型XuanYuan 4.5，AGIBOT Worken框架向具身扩展** —— 国内大厂入场自我进化方向，但均为通稿性质，需独立验证。（可信度：低｜课题：自我进化智能体）
22. **算力基建向轨道与超大规模延伸：Google Gemma 4卫星在轨推理、收购Crusoe怀俄明数据中心地块** —— 太空推理回传是算力基础设施向轨道延伸的首个可验证工程信号，与超大规模选址扩张共同指向算力基建竞赛。（可信度：中｜课题：general）
23. **AI数据归档需求传导至硬件供应链：Fujifilm磁带产能扩5倍** —— 磁带扩产是AI数据归档需求传导到硬件供应链的少见硬指标，可佐证训练/推理数据留存规模。（可信度：中｜课题：general）
24. **本地推理硬件与开放模型栈变动：Nvidia RTX Spark加密固件致Linux推理降至35%、AMD开源GPU软件栈、Kimi K3.1 Pro与腾讯Hy4开放权重发布** —— 加密固件限制本地推理可用性、开源栈与开放权重模型密集发布，共同影响Agent部署成本结构与模型选型逻辑。（可信度：中｜课题：general）
25. **中国首个前沿AI出口管制公告（Mofcom No.48）** —— 可能影响国内模型与agent生态的开放节奏，属政策面背景信号。（可信度：低｜课题：general）
26. **Microsoft Research AI Frontiers团队被传结束** —— 头部机构收缩AI前沿研究组织，可能影响Agent与自进化方向的人才与成果供给，属生态信号。（可信度：中｜课题：general）
27. **Anthropic增长放缓与IPO争议** —— 增长放缓信号可能影响agent平台一体化收编节奏与生态格局判断，属间接影响。（可信度：低｜课题：general）

## ② 热榜汇总

**GitHub Trending 周榜**


**Hacker News（去重后）**

- [Agent memory needs its OpenTelemetry moment](https://www.lorekit.io/blog/open-agent-memory-format)（score=51 comments=35）
- [Goodbye Claude, Hello Pi](https://caleb.software/posts/claude-to-pi.html)（score=345 comments=208）
- [Clj.rs – a Clojure dialect implemented in Rust](https://clj.rs/)（score=70 comments=8）
- [Petered (what happens after the Peter Principle)](https://aworkinglibrary.com/writing/petered)（score=3 comments=0）
- [What I run on my $10 USD OpenStick homelab](https://blog.bosscher.ch/posts/openstick/)（score=598 comments=114）
- [Claude Code's "Don't Ask Again" exposes passwords in 1,122 public GitHub files](https://apiiro.com/blog/coding-agents-leaking-secrets-github-dont-ask-again)（score=419 comments=280）
- [GitHub Down Again?](https://github.com/torvalds/linux)（score=86 comments=75）
- [New typeface using intricate designs from Shakespeare's First Folio (2023)](https://www.itsnicethat.com/news/typeland-shakespeares-globe-amifer-folio-graphic-design-090323)（score=9 comments=7）
- [Finding Xanadu: Inside a JRPG classic translation 15 years in the making](https://readonlymemo.com/legend-of-xanadu-pc-engine-fan-translation-interview-making-of/)（score=23 comments=0）
- [WaveDudeNext 2D Wave Simulator](https://github.com/graealex/WaveDudeNext)（score=19 comments=3）

## ③ 课题跟踪

- **Agent范式（伞形）**：watch项①『决策层被主流框架原生集成』获新证据：Pydantic AI等框架原生集成MCP与OpenTelemetry、Google System One驱动A2UI；watch项②『skill/playbook标准化与市场』强化：cloudflare/security-audit-skill周增9,155星；watch项④『独立评测验证基建』出现MaxxBench质疑DeepSWE分数；风险信号『平台一体化收编决策层/工具层』密集兑现：Snowflake动态路由、Cisco Antares-3B、Amazon Infinity运行时、Rivet、Temporal GA；新增风险面：Langflow RCE、Claude Code凭据泄露至1122个公开文件、Firecracker VM逃逸、美银行监管首个AI框架纳入外部agent风险。
- **Jev / 决策模型**：竞争加剧：Baseten joey-1（2B/$0.01每百万token）、Liquid AI d1-2B（OpenAI兼容路由+自动failover）、Sarvam Prism开放权重决策模型同批入场；护城河正面信号：Jev以低成本调用Opus达同等准确率（4倍成本优势）获外部验证；收编压力：Snowflake按复杂度动态路由、Google System One进入UI生成管线。OpenRouter份额与Decision Index独立化仍待核对。
- **自我进化智能体**：学习循环标准化信号密集：Astra权重级读写改进、失败驱动对话图变更、EvoGroup群体agent自进化harness、GenericAgent技能树（token降6倍）；第4代载体特征向多agent团队扩展（UC Berkeley Evolving Agent Teams）；学术体系化（具身智能体综述、NeurIPS MolSAGE达SOTA）；资本侧HyperVolve数亿元天使轮；国内XuanYuan 4.5与AGIBOT Worken为通稿待验证。Claude skills是否长出学习循环仍无直接证据。
- **general**：新增背景信号：Google Gemma 4卫星在轨推理与Crusoe数据中心收购指向算力基建竞赛；Fujifilm磁带扩产5倍佐证AI数据归档需求；Nvidia RTX Spark加密固件致Linux推理降至35%影响本地部署；中国首个前沿AI出口管制公告；Microsoft Research AI Frontiers团队被传结束。

## ④ 精选 deep-dive

- **Agent工具链安全事件群复盘：从Langflow RCE、Claude Code凭据泄露到Firecracker VM逃逸** —— 本周跨5批出现多起高置信度Agent工具链安全事件（编排工具RCE、CLI默认配置泄露、沙箱逃逸、监管框架跟进），已构成『持续发酵』型议题，需系统梳理攻击面、默认配置风险与隔离基建应对，直接支撑agent-paradigm课题的风险侧判断。
- **决策模型赛道竞争格局与Jev护城河交叉验证：joey-1、d1-2B、Prism与Snowflake路由** —— 本周同批出现多款小参数决策模型与平台层动态路由，同时Jev获『低成本调用Opus达同等准确率』外部验证，需结合OpenRouter份额与Decision Index独立化逐条核对Jev护城河是否被侵蚀。

## ⑤ 数据附录

- 本周分析 token：25636
- Laya 初筛效果（影子期）：样本 301｜影子期未拦截
