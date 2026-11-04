# Jev / System One 决策模型 · 持续跟踪

> 建档：2026-10-05 ｜ 本文件是**活文档**（跟踪维度现状 + 渠道 + 日志），每次跟踪后更新；详细数据见同目录的日期快照。

## 为什么跟踪（核心判断）

- 当前各 Agent 的底层竞争集中在 **LLM（生成/推理 = "慢思考"）**
- Jev 证明了独立的**决策层**（"快思考"：路由、门控、评分、校验、护栏）可以比 LLM 快 40–200x、便宜 100–400x，且类型安全、输出带校准概率
- 由此可能产生**新的 Agent 范式**：LLM 负责生成与规划，System One 模型承担高频决策——两层解耦、各自演进
- 跟踪目标：持续验证（或证伪）上述判断，重点盯**开源对标（尤其 Laya）**与**训练方法（RLCD 及开源复刻）**

## 跟踪维度与现状

| # | 维度 | 现状（2026-11-02） | 下次关注 |
|---|---|---|---|
| 1 | Jev 本体 | 1.14 预览（10-14：图像 + bounding box + 262k ctx，opt-in）；定价 $0.042/M 未变（微软已按分对齐）；10-09 融资 $870M @ $7.5B（a16z）；Vercel 口径两周 35% 付费团队采用、OpenRouter 流量第一 | 1.14 GA；OpenRouter 份额变化（护城河硬指标）；是否出私有化部署 |
| 2 | **训练方法** | RLCD 论文已落地：arXiv 2609.29429（Just Ask Jev）+ OpenJev-RLCD 开源实现（2609.38850）+ RLCD²（AutoThink 2610.17309，决策前简短推理） | 开源 RLCD 管线与 Jev 的校准差距实测；RLCD² 是否成"难例慢通道"标准解法 |
| 3 | **Laya 专项** | 无新权重；迭代在运行时：0.3.11 加载快 10x → 0.3.13 TileLang GPU fast path → 0.3.14（10-08）新文档站；laya-serve 已 Jev 兼容；官方文档标注 label bias 限制；生态位从"唯一对标"变"开源第一梯队之一"。**11-04 首份自有实测**（[快照](2026-11-04.md)）：零样本双偏置——中文问题保守漂移全糊待定、英文问题字面偏置误报；Pi4B 热启动 2s/条；结论=边界问题非知识问题，LoRA 校准（数百条级）可解，无需 RLCD 全量 | 是否跟进多模态（Clef-omni/d1-omni 已出）；0.3.x→0.4/1.0 信号；昇腾路线；11-16 影子期评估（命中率/ECE）定校准路线 |
| 4 | 其他开源对标 | 品类爆发：Cloudflare Clef/flash/omni（Apache-2.0 + 完全 Jev 兼容）、AWS Strands Decider 2B（含数据全开）、pplx-decider 27B、Liquid d1/d1-omni、kev 家族化（0.5B–9B）、StartLux-Decision（中国，HF 开源榜一，待证实）、Jiwo（sub-1B 第一）、Ollaya 本地运行时 | 头部收敛；Qwen3.5 基座 lineage 合规问题；StartLux 独立验证 |
| 5 | 应用范式 | 基础设施化完成：vLLM/llama.cpp systemone 端点、Snowflake SQL 函数、Cloudflare Workers、Airflow/Camunda/Kestra 集成；TypeSafe schema 成为事实标准（类比 Chat Completions API） | LangChain 等框架是否把决策层做成一等公民；国内工作流/低代码平台集成 |
| 6 | 学术与批评 | label-flip 实证（交换 yes/no 标签语义→准确率崩塌，Laya 已列为已知限制）；首个对抗基准（typed 输出被操纵时无可见异常）；共性弱点：数字/日期/序数；各家"第一"均为自选子集，独立评测缺位 | HF Decision Index 私有题机制（60%+40%）能否压制刷榜；独立对抗评测 |
| 7 | 产业信号 | OpenAI Decisions API 公测（10-06，$0.10/M，GPT-6 Luna 套壳）、Microsoft Decision-1（Foundry+OpenRouter）、Snowflake Decision 私有预览；国内大厂观望（"暂缓系理性选择"），开源侧 StartLux/InternLM 活跃；价值向平台/评测工具/编排层转移 | 国内大厂 2027 Q1 前是否入场；Decision Index 独立化；类别价格战 |

## 跟踪渠道

| 类型 | 入口 |
|---|---|
| 官方 | <https://typesafe.ai/blog> |
| 基准榜（10 月新增） | [HF Jev Decision Index](https://huggingface.co/spaces/multimodalart/jev-decision-index)（v0.4.1，60% 私有题+40% 私有任务）｜ [JevBench](https://github.com/fstandhartinger/jevbench)（准确率/校准/延迟/成本）｜ OpenRouter 决策模型流量榜 |
| GitHub 总入口 | [AnotiaWang/awesome-decision-models](https://github.com/AnotiaWang/awesome-decision-models) |
| GitHub 重点仓库 | [jaredpalmer/kev](https://github.com/jaredpalmer/kev) ｜ [wfzyx/von](https://github.com/wfzyx/von) ｜ [receptron/laya](https://github.com/receptron/laya) ｜ [yibie/awesome-jev](https://github.com/yibie/awesome-jev)（Convai Innovations 组织页也要看 Laya 主仓库） |
| 大厂官方博客（10 月新增） | commandline.microsoft.com（Decision-1）｜ Cloudflare blog（Clef）｜ Liquid AI（d1）｜ Snowflake（Decision）｜ OpenAI（Decisions API） |
| arXiv | 搜索：`decision model` / `typed decision model` / `calibrated decision` / `RLCD`（"System One" 已不是品类通用名） |
| Hugging Face | Laya / Von / kev / Clef / pplx-decider / StartLux 权重页 ｜ [davanstrien 开放决策数据集](https://huggingface.co/collections/davanstrien/jev-style-decision-models-open-data)（2352 decisions，23 语言） |
| 社区 | r/LocalLLaMA、Hacker News、X（Austen Allred 每日 AI 栏目）、Kai Waehner 博客（本系列第 4 篇）、国内：53AI / 腾讯云开发者 / 开源中国 / 36kr |

## 快照日志

| 日期 | 快照文件 | 要点 |
|---|---|---|
| 2026-10-05 | [2026-10-05.md](2026-10-05.md) | 建档：Jev 发布 3 周全景——技术特征、价格/延迟、生态 5 层拆解（开源权重/微调/免训练/应用/索引）、7 个开源对标 |
| 2026-11-02 | [2026-11-02.md](2026-11-02.md) | 🚨 品类成立：OpenAI/微软/AWS/Cloudflare/Snowflake/Perplexity/Liquid 一月内全部入场，TypeSafe schema 成事实标准；TypeSafe 融资 $870M@$7.5B；RLCD 论文落地；Jev 1.14 预览（图像+bbox+262k）；中国 StartLux 登 HF 开源榜一、大厂观望；核心假设强验证 |
| 2026-11-04 | [2026-11-04.md](2026-11-04.md) | 自有实证：Laya 影子管线 3 天 142 条 + 中英对照实验——零样本双偏置（中文保守漂移/英文字面偏置），边界问题非知识问题，LoRA 百条级校准可解；官方三 checkpoint 分任务发布=分场景有效实证；决策服务候选托管 37服务器 |

## 更新约定

1. 每次跟踪：新增 `YYYY-MM-DD.md` 快照（含数据快照日期、来源链接）+ 更新本 README 的"现状"列与快照日志
2. star 数等时效数据必须标注日期；单一来源的传言标注"待证实"
3. 重大变化（GA、RLCD 论文、Laya 大版本、框架原生集成）在快照开头用"🚨 变化"标出
