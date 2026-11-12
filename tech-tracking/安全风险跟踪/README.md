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

| # | 维度 | 现状（2026-11-12） | 下次关注 |
|---|---|---|---|
| 1 | **供应链安全（立项样本所在）** | Go 生态 10-25/26 一日 14 公告：rclone selfupdate 签名校验绕过（CVE-2026-116189，供应链级）、klauspost/compress zstd 整数溢出 panic（CVE-2026-116591，CVSS~8.7）、go-jose 超大密钥 DoS/嵌套 JSON 栈溢出；均系"没人直接用但人人间接依赖"的底层库 | 修复版本落地率（v1.75.2 / v1.20.2 / v4.1.6+ 是否被下游及时吸收）；同类 selfupdate 签名机制是否被集中审计 |
| 2 | AI 增强攻击 | 趋势公认（AI 挖洞/伪造/钓鱼成本骤降），主流平台实证案例待搜集入档 | 大厂 SRC / 赏金平台对 AI 生成漏洞的处理口径；深度伪造落地重大案件 |
| 3 | AI 自身攻击面（agent/MCP/skills） | 散点已知：Meta Muse 读私信→苹果收紧 macOS FDA（载自自我进化课题 11-02 快照）；dots 出 system card；NVIDIA NemoClaw 主打安全增强 | MCP/skills 生态首个权限提升实案；agent 权限最小化标准是否出现 |
| 4 | 包生态投毒（slop poisoning 等） | AI 生成包名抢注/幻觉投毒（slop-squatting）已在 Python 生态出现（背景知识，具体 2026 实证待入档） | PyPI/npm/Go 官方通报是否出现 AI 投毒专项；包管理器的签名/信誉机制升级 |
| 5 | 沙箱与隔离 | microVM 路线活跃：tryboxi（Go 本地 microVM agent 沙箱，已认知归档）、gVisor 等——防御侧为 agent 运行时建隔离层 | microVM 是否成为 agent 运行时标配；云端沙箱与本地 microVM 的市场分界 |
| 6 | 防御侧 AI 化与治理 | CISA KEV 等既有机制照常运转；AI 辅助审计/运营工具化程度待考察 | 应急响应时长是否恶化（防御跟不上攻击的量化信号）；治理框架（agent 权限、AI 安全立法）落地 |

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

## 更新约定

1. 每次跟踪：新增 `YYYY-MM-DD.md` 快照 + 更新本 README（现状列、快照日志）
2. CVE 编号、修复版本、CVSS 必须标注来源快照日期；通稿口径标注"待验证"
3. 重大事件（在野利用、agent 生态投毒实案、防御体系失效实证）在快照开头用"🚨 变化"标出
4. **单一 CVE 不算新闻，格局变化才算**——本课题盯的是"AI 冲击下攻防假设的改变"，CVE/事件只作证据
