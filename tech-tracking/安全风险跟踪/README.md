---
---
# 安全风险 · 持续跟踪

> 建档：2026-11-12 ｜ 本文件是**活文档**（跟踪维度现状 + 渠道 + 日志），每次跟踪后更新；详细数据见同目录的日期快照。
> 背景：用户判断（2026-11-12 确立）——"近期各类系统安全保障受到 AI 的冲击很大"，传统安全的攻防两侧都在被 AI 重写。立项首日素材：Go 生态一日 14 个安全公告（见 [2026-11-12.md](2026-11-12.html)）。

## 为什么跟踪（核心判断）

- **AI 不是安全领域的新工具，而是新变量**：攻击侧（自动化漏洞挖掘、深度伪造、AI 生成钓鱼）与防御侧（AI 辅助审计、运营）能力同时跃升，但攻击侧见效更快——防御体系的假设（人力稀缺、攻击有成本）正在失效
- **两层结构**（立项时确立的分析框架）：
  - **冲击层 = AI 重写攻防格局**：AI 把攻击的边际成本打到近零（挖洞、伪造、社工），传统"依靠攻击成本高"的防线整体贬值
  - **新增面 = AI 自身成为攻击面**：agent 权限失控、prompt injection、MCP/skills 生态投毒、工具链 selfupdate 机制——AI 生态自己长出来的漏洞类别
- **供应链是两层交汇点（核心论点）**：agent 生态的工具链（Go/npm/PyPI 包、自更新机制、技能市场）同时暴露给"AI 加速的攻击者"和"AI 生成的新攻击面"。2026-11-12 Go 生态事件（rclone selfupdate 签名绕过等 14 个公告）是首个立项样本
- 与 [[self-evolving-agents-tracking]] 的交叉：自我进化的核心机制就是**自我更新**（selfupdate/技能自动装载）——进化越自动化，供应链信任问题越尖锐。rclone 事件恰好打击的就是这个机制

## 跟踪维度与现状

| # | 维度 | 现状（2026-11-14） | 下次关注 |
|---|---|---|---|
| 1 | **供应链安全（立项样本所在）** | 落地率复查（11-14）：修复先行、公告滞后 16 天（rclone v1.75.2=10-09，公告批 10-25/26）；go-jose 双 CVE 定号（116586→v4.1.5 / 116587→v4.1.6）；发行版层已跟进（Amazon ALAS / Debian / Red Hat）。**新交汇点样本：LiteLLM 网关发布管线被投毒（10-21，TeamPCP，二次中招，PyPI+Docker 双通道）** | 下游应用层吸收率；TeamPCP 连续打击安全工具链（Trivy/KICS/LiteLLM）的下一步目标 |
| 2 | AI 增强攻击 | **空档已补齐（11-14 快照）**：OpenAI 官方挖洞成本表（11-06：948 个 Linux LPE / $1.21M / 净盈利 16-55x / 10 项新型利用技术）；curl 赏金关停（01-26：AI slop 淹没人工分诊——防御经济学崩坏标志事件）；Cloudflare Glasswing/Mythos（05-18：利用链拼接 + PoC 自证闭环，行业出现 2 小时补丁 SLA） | Linux 上游对 948 LPE 的消化进度；下一个因 AI 改制/关停的赏金平台；"AI slop 淹没分诊"的量化研究 |
| 3 | AI 自身攻击面（agent/MCP/skills） | 从散点升级为实案+统计（证据多为厂商级，待验证）：PromptPwnd 事件（2025-12）、6 起真实 MCP 权限滥用（浏览器内嵌 MCP 越权至宿主）、CVE-2026-27826（MCP 请求重定向）、MCP STDIO 命令注入家族（04 月）、"82% 文件操作类 MCP 有可利用缺陷"统计 | OWASP Agentic AI Top 10 演进；agent 权限最小化标准是否出现（仍未） |
| 4 | 包生态投毒（slop poisoning 等） | **空档已补齐（11-14 快照）**：slopsquatting 成建制化研究对象——CSA 研究笔记（04-19）、Endor Labs 分析（07 月，coding agent 幻觉→恶意包闭环）、学术实证（Park et al. 幻觉包名注册研究、Al-Zofi et al. 系统综述） | PyPI/npm/Go 官方 AI 投毒专项通报（仍未）；注册表签名/信誉机制升级 |
| 5 | 沙箱与隔离 | OpenAI 报告顺带实证：cyber 模型第一刀砍在测试/隔离基建上（QEMU TCG 0-day；Kata/Moby/gVisor 被主动测试修复）——沙箱实现自身成 offensive 首要目标 | microVM 是否成为 agent 运行时标配；沙箱被作为攻击面的实证案例 |
| 6 | 防御侧 AI 化与治理 | INTERPOL 深伪公众宣传（10 月）；OpenAI Patch the Planet/Daybreak（补丁随报告建制化产出）；CSA 呼吁 CVD 改革（2026 CVE 预测上调 ~59,427）；应急时长量化仍缺 | 应急响应时长是否恶化（量化信号仍未出现）；agent 权限、AI 安全立法落地 |

## 跟踪渠道

| 类型 | 入口 |
|---|---|
| 官方公告 | Go vuln DB（pkg.go.dev/vuln）｜ GitHub Advisory Database ｜ NVD ｜ CISA KEV ｜ Red Hat/各发行版 RHSA |
| 项目 | rclone changelog ｜ klauspost/compress releases ｜ go-jose releases |
| 供应链专项 | osv.dev ｜ Snyk/SentinelOne/Rapid7 漏洞库（趋势分析）｜ Phylum/Socket（包投毒监测） |
| AI 安全 | OWASP LLM/Agentic AI Top 10 ｜ Anthropic/OpenAI system card 与安全博客 ｜ r/NetSec、Hacker News |
| 中文 | 安全客/FreeBuf/嘶吼 ｜ 微信公众号（如 PFinalClub 本次首发源） |

## 快照日志

| 日期 | 快照文件 | 要点 |
|---|---|---|
| 2026-11-12 | [2026-11-12.md](2026-11-12.html) | 建档：Go 生态一日 14 公告事件详情（rclone selfupdate 签名绕过 / klauspost zstd 溢出 / go-jose 三连），确立"冲击层 × 新增面 × 供应链交汇"两层框架 |
| 2026-11-14 | [2026-11-14.md](2026-11-14.html) | 三 🚨：OpenAI 挖洞工业化成本表（948 LPE / 净盈利 16-55x）、curl 赏金因 AI slop 关停、LiteLLM 网关供应链被投毒；维度 2/4 空档补齐；新格局判断"AI slop 是独立威胁类别" |

## 更新约定

1. 每次跟踪：新增 `YYYY-MM-DD.md` 快照 + 更新本 README（现状列、快照日志）
2. CVE 编号、修复版本、CVSS 必须标注来源快照日期；通稿口径标注"待验证"
3. 重大事件（在野利用、agent 生态投毒实案、防御体系失效实证）在快照开头用"🚨 变化"标出
4. **单一 CVE 不算新闻，格局变化才算**——本课题盯的是"AI 冲击下攻防假设的改变"，CVE/事件只作证据
