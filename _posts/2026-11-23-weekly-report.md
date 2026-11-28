# 技术周报 · 2026-W48

## ① 结论速览

1. **Microsoft Agent Framework PyPI 包被投毒窃取云凭证（月下载约20万）** —— 官方 AI agent SDK 供应链被劫持并窃取 Azure/CI 凭证，直接命中 agent 生态投毒实案信号；『持续发酵』：跨批1、2重复出现，且从『投毒事件』升级为『多家报道+凭证窃取细节』。（可信度：高｜课题：security-risk）
2. **ARTEX 开源 AI 攻击框架被国家级/威胁行为者实战采用，作者下架后代码仍全球扩散** —— 开源 agentic 攻击框架进入真实入侵并被中朝黑客采用，下架无效说明攻击性 Agent 能力不可撤回；『持续发酵』：跨批3、4、5三批出现，从『被滥用』升级为『国家级采用+代码扩散+作者关停无效』。（可信度：高｜课题：security-risk）
3. **Google 称首例自主 AI 网络攻击已发生/多智能体攻击框架自主武器化漏洞；Amazon 称开源 AI Agent 基本自主利用零日漏洞** —— 多来源指向 AI agent 自主挖洞与攻击进入实案，是『AI挖洞进入主流攻防实案』可证伪信号的关键证据；『持续发酵』：跨批2、4、5出现，从『多智能体攻击框架』升级为『首例自主攻击+零日自主利用』，需核对原始报告来源。（可信度：中｜课题：security-risk）
4. **OpenAI 与 Cisco 推出 Shirudo 等开源工具，AI 辅助在补丁前阻断 Linux 漏洞** —— 防御侧 AI 化产品化落地，可对照『应急响应时长恶化/防御侧 AI 化滞后』风险信号，形成攻防两侧 AI 化速度对照。（可信度：中｜课题：security-risk）
5. **Google 要求 AI Agent 经批准方式访问 Workspace，Gmail MCP 不能发邮件** —— 主流平台对 agent/MCP 出口做权限收编，是『平台一体化收编工具层』风险信号与 MCP 出口标准化的直接证据。（可信度：高｜课题：Agent范式（伞形））
6. **Microsoft Agent Framework 开源 SDK 发布 + Mastra 等框架 1.0 成熟** —— 主流框架原生集成编排/决策能力，对应『决策层被主流框架原生集成』watch 信号，需评估对独立决策模型层的收编压力。（可信度：中｜课题：Agent范式（伞形））
7. **Versine（YC F26）用 MCP 收发资金；Walmart 经 Meta Muse Agent Gateway 开放购物；Visa Agentic Ready 进欧洲支付** —— MCP/agent 向高权限资金动作与受监管商业场景扩展，是 agent 商业化与权限边界风险并存的信号；『持续发酵』：跨批2、3、4出现，从支付概念升级为零售入口+受监管金融落地。（可信度：中｜课题：Agent范式（伞形））
8. **ShellBench：最强 AI Agent 仍难应对日常生活任务；LaunchDarkly 指生产 agent 离线评测/CI 集成崩点** —— 独立评测基准与生产可靠性实践同时出现，对应『独立评测验证基建起飞』watch 信号。（可信度：中｜课题：Agent范式（伞形））
9. **Karpo-Decision-31B 在 Decision Index Full 上 73.9 分并列第一（300 模型）** —— 决策模型赛道新开源权重竞争者，直接对标 GLiDE 27B 与 Gemini Decision 1，是 Jev 护城河与 Decision Index 独立化的可证伪信号；『持续发酵』：跨批1、5出现，从『宣称排名第一』升级为『具体分数并列第一』，可信度上调。（可信度：中｜课题：Jev / 决策模型）
10. **436M/380M 小模型微调在生产数据上匹配或击败 Jev/教师模型；Jev 被猜为 Qwen3.5-35B-A3B** —— 小模型本地微调超越 Jev 的独立反证样本叠加底层模型逆向猜测，直接冲击 Jev 护城河叙事，需核对 OpenRouter 份额是否受影响。（可信度：中｜课题：Jev / 决策模型）
11. **Strands Decider v2、Lory 27B/4B、Maincode/Matilda-Decision-v1、Clef 27B/9B 等决策模型密集发布** —— 开源决策模型赛道新玩家密集入场，品类向模拟受访者/多模态扩张，需评估与 Jev 的定位差异及独立评测；『持续发酵』：跨批1、3、4、5持续出现新玩家，呈赛道升温态势。（可信度：中｜课题：Jev / 决策模型）
12. **Revolut 迁移至自托管开源权重模型，AI 编码成本降 90%；TechCrunch 称 Vercel 路由 1/4 请求流向决策模型** —— 自托管开源权重对闭源 API 的成本替代实案叠加决策模型实际路由份额数据，是 Jev 护城河与开源 vs 闭源竞争的外部量化参照。（可信度：中｜课题：Jev / 决策模型）
13. **DoppelVet：自我进化 Agent 的比较安全验证；Benchmarking Endogenous Misalignment in Self-Evolving Agents** —— 直击自我进化 agent 每次错误批准塑造后续行为的安全边界，为学习循环提供安全验证与评测基准，是学习循环标准化的学术侧关键信号。（可信度：高｜课题：自我进化智能体）
14. **Evolve Where It Matters 技能自进化、EvolveMAS 多 Agent 统一自进化框架、自我学习软件演化综述** —— 技能自进化从运行轨迹修订 skill、自进化扩展到多 Agent 编排层，对应『学习循环标准化/编排 OS 化』watch 信号；『持续发酵』：跨批2、4、5持续出现，从单 agent 学习循环升级为多 agent 编排层框架与综述定义。（可信度：中｜课题：自我进化智能体）
15. **Perplexity Brain 自动创建并更新可复用 agent skills（不改模型权重）** —— 从会话经验自动生成 skill，是『技能市场/学习循环标准化』的直接产品化信号。（可信度：中｜课题：自我进化智能体）
16. **PrismShadow 平台：数据蒸馏、训练、私有部署与 Agent 自我进化一体化** —— 平台把自我进化与训练/部署打包，是『第4代载体特征（平台吞并/编排 OS 化）』的候选样本。（可信度：低｜课题：自我进化智能体）
17. **Convex skills 被指未经告知将用户应用创意发送至远程服务器** —— skills 生态数据外传实案，对应 agent/MCP/skills 生态权限与投毒风险观察点。（可信度：中｜课题：security-risk）
18. **1Password 安全事件、Defang 安全事件、Nfs2root 12 年内核预认证远程 root、Slow Ubuntu 安全响应** —— 同批多起安全事件叠加发行版响应时长恶化讨论，可观察是否形成集中爆雷或供应链投毒模式，并佐证防御侧滞后信号。（可信度：中｜课题：security-risk）
19. **GLM-5.4 首个 loop transformer 编码模型** —— 模型架构层面新范式信号，若属实值得核对技术细节与可复现性，暂归 general 待后续聚合。（可信度：中｜课题：general）
20. **Nvidia 重新任命黄仁勋为 CEO（HN 1943 分）** —— 算力供给方高层变动，是 AI 基建叙事的重大变量，需持续观察对开源路线与算力生态影响。（可信度：低｜课题：general）

## ② 热榜汇总

**GitHub Trending 周榜**

- [backnotprop/plannotator (+1,596★/wk)](https://github.com/backnotprop/plannotator) —— The workspace to stay in the loop and on top of agents - shape, decide, plan, an
- [google-labs-code/stitch-skills (+2,616★/wk)](https://github.com/google-labs-code/stitch-skills) —— A library of Agent Skills designed to work with the Stitch MCP server. Each skil
- [GoogleChrome/modern-web-guidance-src (+2,008★/wk)](https://github.com/GoogleChrome/modern-web-guidance-src) —— Keep your coding agent up to date with the latest web best practices
- [n8n-io/nod (+1,424★/wk)](https://github.com/n8n-io/nod) —— Open source personal agent with its own computer. It chases invoices, preps your
- [alibaba/open-code-review (+2,335★/wk)](https://github.com/alibaba/open-code-review) —— Secure, fast, efficient, battle-tested at Alibaba's scale. Hybrid architecture c
- [mvanhorn/last30days-skill (+5,072★/wk)](https://github.com/mvanhorn/last30days-skill) —— AI agent skill that researches any topic across Reddit, X, YouTube, HN, Polymark
- [ChromeDevTools/chrome-devtools-mcp (+1,150★/wk)](https://github.com/ChromeDevTools/chrome-devtools-mcp) —— Chrome DevTools for coding agents
- [tradermonty/claude-trading-skills (+1,332★/wk)](https://github.com/tradermonty/claude-trading-skills) —— Claude Code skills for equity investors and traders — market analysis, technical
- [ag-ui-protocol/ag-ui (+1,185★/wk)](https://github.com/ag-ui-protocol/ag-ui) —— AG-UI: the Agent-User Interaction Protocol. Bring Agents into Frontend Applicati
- [meta/astryx (+2,306★/wk)](https://github.com/meta/astryx) —— An open source design system that's fully customizable and agent ready

**Hacker News（去重后）**

- [Audible removes download option for purchased audiobooks](https://consumerrights.wiki/w/Audible_removes_download_option_for_purchased_audiobooks)（score=474 comments=196）
- [Claude Code sabotage: preliminary benchmarking](https://xinyadu.github.io/blog/claude-code-sabotage.html)（score=517 comments=171）
- [Physics Breakthrough Simulator](https://pages.ethanmdavidson.com/ai-physics-breakthrough)（score=83 comments=18）
- [GGUF LLM Models with Hidden Malware on Hugging Face Reached 2400 Victims](https://malspark.com/blog/malicious-gguf-models-hugging-face/)（score=142 comments=45）
- [Farewell](https://github.com/p-e-w/heretic/issues/601)（score=791 comments=329）
- [Silently degrading the model's capabilities IS sabotage](https://twitter.com/TimSweeneyEpic/status/2126682647862862063)（score=106 comments=27）
- [Show HN: Luciole Mono – terminal font designed for legibility](https://scriptor-pro.github.io/luciole-mono/)（score=105 comments=39）
- [Computer Disease](https://blog.adafruit.com/2020/01/13/richard-feynman-on-computer-disease/)（score=6 comments=3）
- [Essential Reading in the Age of Math 2.0](https://www.quantabooks.org/essential-reading-in-the-age-of-math-2-0/)（score=12 comments=3）
- [10x faster than Spark on a laptop](https://krishiv.ai/blog/krishiv-0-2-10x-faster-than-spark)（score=10 comments=3）

## ③ 课题跟踪

- **security-risk**：『AI挖洞/攻防进入主流实案』信号由待观察升级为多来源实证（ARTEX 国家级采用、Google 首例自主攻击、Amazon 零日自主利用），建议将该条从可证伪信号转为已部分证实并持续跟踪；防御侧 AI 化（Shirudo）开始落地，攻防两侧速度差成为新观察点。
- **Jev / 决策模型**：决策模型赛道新玩家密集入场（Karpo 73.9 分并列第一、Lory、Strands Decider v2、Matilda），叠加小模型微调反证与 Jev 底层被猜为 Qwen3.5-35B-A3B，护城河叙事承压；建议将『OpenRouter 份额变化』与『Decision Index 独立化』列为下周最高优先级核对项。
- **自我进化智能体**：学习循环标准化信号增强：DoppelVet 比较安全验证、内生失准评测基准、EvolveMAS 多 Agent 自进化框架与综述定义分层，学术侧概念框架趋于成型；建议将『技能市场/学习循环标准化』从观察项升级为可证伪信号核对项。
- **Agent范式（伞形）**：『平台一体化收编工具层』信号强化（Google Workspace 限制 Gmail MCP 发邮件、Walmart Agent Gateway、Visa Agentic Ready），MCP 出口标准化与权限收编并行；独立评测基建（ShellBench）起飞，建议将『MCP 出口标准化』新增为 watch 项。

## ④ 精选 deep-dive

- **ARTEX 与自主 AI 攻击：从开源框架滥用到首例自主网络攻击的攻防态势评估** —— 跨三批持续发酵且升级为国家级采用+首例自主攻击+零日自主利用，需系统核对原始报告、攻击链细节与防御侧（Shirudo 等）响应速度，判断『AI挖洞进入主流实案』信号是否成立。
- **决策模型赛道升温与 Jev 护城河：Karpo/Lory/Strands 密集入场 + 小模型微调反证** —— 多批出现新竞争者与具体排名分数，叠加 436M 小模型超越 Jev 的反证，需对照 OpenRouter 份额与 Decision Index 独立化进展，评估 Jev 护城河是否被侵蚀。

## ⑤ 数据附录

- 本周分析 token：27977
- Laya 初筛效果（影子期）：样本 1161｜影子期未拦截
