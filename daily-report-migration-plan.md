# 每日IT简报迁移方案

## 📋 项目背景

**当前状态**:
- 原有定时任务（通过 `/airuntime/cron/jobs.json`）已停止
- 需要迁移到 OpenClaw Cron 管理
- 脚本位置: `/airuntime/scripts/generate_report_zhipu.py`
- 生成位置: `/airuntime/workspace/kyd-w.github.io/_posts/`

**迁移目标**:
1. 使用 OpenClaw Cron 作为定时触发器
2. 保留现有脚本功能
3. 优化数据源和数据内容
4. 提升稳定性和可维护性

---

## 🎯 迁移方案（分阶段）

### 阶段一：基础迁移（当前优先）

#### 1. 创建 OpenClaw Cron 任务

**任务配置**:
```json
{
  "name": "daily-it-briefing",
  "schedule": "0 8 * * *",
  "timezone": "Asia/Shanghai",
  "description": "每日IT行业简报生成 - 包含6个章节的最新资讯",
  "enabled": true,
  "delivery": {
    "mode": "announce",
    "channel": "openclaw-weixin",
    "to": "o9cq800mKf-NUE3yarSzDNB-1-S0@im.wechat"
  },
  "task": "生成每日IT简报：包含6个章节 - IT行业最新动态、AI及机器人行业最新动态、Agent热门Skill、GitHub热门项目、个人OPC优秀案例、教育+AI行业新产品。搜索今日相关资讯，格式化为Markdown后发送到飞书。"
}
```

**创建命令**:
```bash
openclaw cron create \
  --name "daily-it-briefing" \
  --schedule "0 8 * * *" \
  --timezone "Asia/Shanghai" \
  --task "生成每日IT简报：包含6个章节 - IT行业最新动态、AI及机器人行业最新动态、Agent热门Skill、GitHub热门项目、个人OPC优秀案例、教育+AI行业新产品。搜索今日相关资讯，格式化为Markdown后发送到飞书。" \
  --channel "openclaw-weixin" \
  --to "o9cq800mKf-NUE3yarSzDNB-1-S0@im.wechat"
```

#### 2. 环境变量配置

**需要确保的环境变量**:
```bash
TAVILY_API_KEY=tvly-d...C...
ZHIPU_API_KEY=9dddbb...0...
GITHUB_USERNAME=kyd-w
GITHUB_REPO=kyd-w.github.io.git
FEISHU_APP_ID=cli_a90449064c78dcb2
FEISHU_APP_SECRET=2qvOKq...RXH4
FEISHU_WIKI_INDUSTRY_ACCUMULATION_NODE=EiPKwgr7FiSVqJkMl4bcjeTJnPb
FEISHU_WIKI_SPACE_ID=7612961287164726450
```

**配置方式**:
- 选项A: 设置为系统环境变量（`/etc/environment` 或用户 `.bashrc`）
- 选项B: 使用 OpenClaw Gateway 配置的 `env` 字段
- 选项C: 在脚本中显式加载 `/airuntime/.env*` 文件

#### 3. 测试运行

**手动测试**:
```bash
# 测试脚本是否能正常运行
python3 /airuntime/scripts/generate_report_zhipu.py
```

**通过 OpenClaw 测试**:
```bash
# 创建一次性测试任务
openclaw cron create \
  --name "test-it-briefing" \
  --schedule "manual" \
  --task "生成每日IT简报：包含6个章节 - IT行业最新动态、AI及机器人行业最新动态、Agent热门Skill、GitHub热门项目、个人OPC优秀案例、教育+AI行业新产品。搜索今日相关资讯，格式化为Markdown后发送到飞书。"
```

---

### 阶段二：数据源优化

#### 当前数据源问题:
1. **GitHub 热门项目章节**: 无数据（API 适配器废弃）
2. **搜索结果质量**: 部分内容相关性不高
3. **时效性**: 需要更好的时间过滤

#### 优化方案:

**1. 恢复 GitHub Trending 数据**
- 集成 `github_trending_adapter_v2.py`
- 更新主脚本以使用新适配器
- 考虑使用 GitHub API v3 替代网页抓取

**2. 优化搜索策略**
```python
# 为每个章节定制搜索关键词
search_queries = {
    "IT行业最新动态": [
        "IT行业 新闻 2026",
        "科技动态 最新",
        "技术趋势 AI"
    ],
    "AI及机器人行业最新动态": [
        "人工智能 最新",
        "机器人 行业",
        "AI 大模型 新闻"
    ],
    # ... 其他章节
}
```

**3. 增加数据源多样性**
- 接入更多搜索 API（Bing Search, SerpAPI）
- 添加 RSS 订阅源（36氪, 机器之心, TechCrunch）
- 考虑使用新闻聚合 API（NewsAPI, GNews）

**4. 内容质量过滤**
- 添加关键词黑名单（广告、低质量内容）
- 实现内容去重机制
- 添加内容相关性评分

---

### 阶段三：脚本优化

#### 当前脚本问题:
1. **代码重复**: 多个版本功能重叠
2. **配置分散**: 环境变量、硬编码路径混杂
3. **错误处理**: GitHub 失败后未降级处理
4. **日志记录**: 不够详细，难以调试

#### 优化方案:

**1. 统一配置管理**
```python
# config/report_config.json
{
  "search_services": ["tavily", "zhipu"],
  "chapters": [
    {
      "name": "IT行业最新动态",
      "count": 3,
      "queries": ["IT行业 新闻 2026", "科技动态 最新"],
      "sources": ["ithome.com", "36kr.com", "techcrunch.com"]
    },
    # ... 其他章节
  ],
  "output": {
    "directory": "/airuntime/workspace/kyd-w.github.io/_posts",
    "git_auto_commit": true,
    "feishu_send": true
  }
}
```

**2. 模块化重构**
```
/airuntime/scripts/
├── core/
│   ├── search_adapter.py      # 搜索适配器基类
│   ├── tavily_adapter.py       # Tavily 适配器
│   ├── zhipu_adapter.py        # 智谱适配器
│   └── github_adapter.py       # GitHub 适配器
├── chapters/
│   ├── it_trends.py            # IT行业动态
│   ├── ai_robotics.py          # AI及机器人
│   ├── agent_skills.py         # Agent Skills
│   ├── github_trending.py      # GitHub Trending
│   ├── opc_cases.py            # OPC案例
│   └── edtech_ai.py            # 教育AI
├── utils/
│   ├── config_loader.py        # 配置加载器
│   ├── markdown_formatter.py   # Markdown 格式化
│   ├── git_helper.py           # Git 操作
│   └── feishu_sender.py        # 飞书发送
└── generate_report.py          # 主入口（简化版）
```

**3. 增强错误处理**
```python
# 搜索失败降级策略
search_services = ["tavily", "zhipu", "bing"]

for service in search_services:
    try:
        results = search_with_service(service, query)
        if results:
            break
    except Exception as e:
        logger.warning(f"{service} 搜索失败: {e}, 尝试下一个服务")
else:
    logger.error(f"所有搜索服务均失败，章节 '{chapter_name}' 跳过")
```

**4. 详细日志记录**
```python
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('/airuntime/logs/report_generation.log'),
        logging.StreamHandler()
    ]
)
```

---

### 阶段四：功能增强

#### 1. 智能摘要生成
- 使用 LLM 为每条新闻生成 1-2 句摘要
- 提取关键信息和亮点
- 多语言翻译（英文 → 中文）

#### 2. 个性化推荐
- 基于历史数据学习用户偏好
- 调整章节权重和内容数量
- 支持用户自定义关键词

#### 3. 多渠道分发
- 微信公众号自动推送
- Telegram Bot 通知
- 邮件订阅（可选）

#### 4. 数据分析与可视化
- 热词趋势分析
- 资讯来源分布
- 章节受欢迎程度统计

---

## 📝 实施步骤

### Step 1: 创建 OpenClaw Cron 任务（立即执行）

```bash
# 创建每日8点运行的任务
openclaw cron create \
  --name "daily-it-briefing" \
  --schedule "0 8 * * *" \
  --timezone "Asia/Shanghai" \
  --task "生成每日IT简报：包含6个章节 - IT行业最新动态、AI及机器人行业最新动态、Agent热门Skill、GitHub热门项目、个人OPC优秀案例、教育+AI行业新产品。搜索今日相关资讯，格式化为Markdown后发送到飞书和微信。" \
  --delivery.to "o9cq800mKf-NUE3yarSzDNB-1-S0@im.wechat"
```

### Step 2: 验证环境变量（检查清单）

- [ ] TAVILY_API_KEY 已设置
- [ ] ZHIPU_API_KEY 已设置
- [ ] GITHUB_USERNAME 和 GITHUB_REPO 已设置
- [ ] 飞书相关环境变量已设置

### Step 3: 测试运行（手动触发）

```bash
# 等待 Cron 自动触发，或手动测试脚本
python3 /airuntime/scripts/generate_report_zhipu.py
```

### Step 4: 监控首次运行

- 检查是否生成了 Markdown 文件
- 验证飞书消息是否发送成功
- 确认 Git 提交和推送是否成功

### Step 5: 逐步优化（后续迭代）

1. 恢复 GitHub Trending 章节
2. 优化搜索关键词和数据源
3. 重构脚本结构
4. 增加新功能

---

## 🔧 故障排查

### 常见问题

**1. Cron 任务未触发**
```bash
# 检查任务状态
openclaw cron list
openclaw cron status daily-it-briefing

# 查看日志
tail -f ~/.openclaw/logs/gateway.log
```

**2. 脚本执行失败**
```bash
# 手动运行脚本查看错误
python3 /airuntime/scripts/generate_report_zhipu.py

# 检查环境变量
env | grep -E "TAVILY|ZHIPU|GITHUB|FEISHU"
```

**3. 飞书发送失败**
- 检查 FEISHU_APP_ID 和 FEISHU_APP_SECRET
- 验证 Chat ID 是否正确
- 查看 API 错误日志

**4. Git 推送失败**
```bash
# 检查 Git 配置
cd /airuntime/workspace/kyd-w.github.io
git remote -v
git status
```

---

## 📊 成功标准

### 最小可行产品（MVP）
- ✅ 每日 08:00 自动触发
- ✅ 成功生成 Markdown 文件
- ✅ 发送到微信
- ✅ Git 自动提交并推送

### 优化后目标
- ✅ 6 个章节均有数据
- ✅ 内容相关性高
- ✅ 搜索稳定可靠
- ✅ 代码结构清晰
- ✅ 日志完整详细

---

## 🎯 下一步行动

1. **立即执行**: 创建 OpenClaw Cron 任务
2. **验证环境**: 确认所有环境变量正确
3. **首次测试**: 手动触发一次完整流程
4. **监控运行**: 观察首次自动运行情况
5. **规划优化**: 根据运行情况制定优化计划

---

**创建时间**: 2026-05-25
**最后更新**: 2026-05-25
**负责人**: Claw (OpenClaw AI Assistant)
