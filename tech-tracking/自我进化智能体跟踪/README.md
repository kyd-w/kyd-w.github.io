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
| 2 | **Hermes Agent（爱马仕）** | Nous Research | 2026-02 开源，持续更新中 | 活跃（28.4k⭐，4 月口径） | **首个内置学习循环**：每 15 任务复盘、经验生成技能、两层记忆（MEMORY.md + FTS5 跨会话检索）——载体与进化机制首次结合 |
| 2.5 | NanoClaw / NemoClaw 等 | 社区/NVIDIA | 2026 中 | 细分存续 | 极简（树莓派）/ 安全增强（NVIDIA 官方教程）等垂直方向 |
| 3 | **DeepSeek Harness** | DeepSeek | 2026-10 v1.2 | 活跃 | **智能体编排/操作系统化**：Codex 与 Claude Code 作为子智能体插件、Git 工作树、思考翻译、Cordis 插件化四层解耦 |
| ? | dots | OpenAI | DevDay 2026-09-29 发布 | 平台级变量 | 独立云电脑 + 4000+ 应用连接 + Astra 驱动；闭源平台派常驻智能体，已出 system card |

## 跟踪维度与现状

| # | 维度 | 现状（2026-11-02） | 下次关注 |
|---|---|---|---|
| 1 | **载体层（常驻运行时）** | 换代进行中：OpenClaw 退热 → Hermes（个人侧）→ DeepSeek Harness（开发者/编排侧）→ dots（平台侧）三条路线分叉 | 第 4 代载体特征（编排 OS？平台吞并？）；dots 是否开放生态 |
| 2 | **进化机制（学习循环/技能沉淀）** | Hermes 学习循环（15 任务复盘→技能提取）是当前最完整实现；CoEvoSkills 技能包协同进化 | 学习循环的标准化；技能市场/共享机制是否出现 |
| 3 | **Harness 自我进化研究** | EvolveNet（2608.04968，协作进化 harness）；self-evolving-agent-patterns（1000+ 自主循环工程模式）；Raven（EverMind，"L3 数字生命"，开源） | EvolveNet 类方法进入主流框架；Raven 实测可信度（通稿口径需验证） |
| 4 | 平台厂商 | OpenAI dots（常驻+云电脑）；Claude Code skills/hooks 生态；Manus、Claude Cowork 等 | dots system card 的安全边界；Claude skills 是否长出学习循环 |
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
| 2026-11-02 | [2026-11-02.md](2026-11-02.md) | 建档：两层框架（载体/机制）+ 载体换代史（OpenClaw→Hermes→DS Harness→dots）+ 现状基线 |

## 更新约定

1. 每次跟踪：新增 `YYYY-MM-DD.md` 快照 + 更新本 README（现状列、换代史表、快照日志）
2. star 数等时效数据必须标注日期；厂商通稿口径（如 Raven）标注"待验证"
3. 重大变化（第 4 代载体出现、学习循环标准化、平台开放/吞并生态）在快照开头用"🚨 变化"标出
4. **单品退热不算新闻，范式迁移才算**——换代史表格是本课题最核心的资产
