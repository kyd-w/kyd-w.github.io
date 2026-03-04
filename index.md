---
layout: home
title: 首页
---

# 欢迎来到 IT 每日简报

这里是 **IT 每日简报** 的展示页面，汇集每日IT行业、AI、Agent 等领域的最新动态。

## 📋 最新简报

{% for post in site.posts limit:5 %}
### [{{ post.title }}]({{ post.url }})
*发布时间：{{ post.date | date: "%Y-%m-%d" }}*

{{ post.excerpt | strip_html | truncatewords: 30 }}
{% endfor %}

## 🔗 快速链接

- [关于本站](./about)
- [GitHub 仓库](https://github.com/kyd-w/kyd-w.github.io)

---

## 📝 站点说明

本站点用于展示每日IT行业动态、AI资讯、热门Agent技能等内容。

**技术栈**: Jekyll + GitHub Pages

**更新时间**: {{ site.time | date: "%Y-%m-%d" }}

## 📊 内容分类

- **IT行业最新动态** - 汇总IT行业重要新闻和趋势
- **AI及机器人行业** - AI技术进展、机器人应用案例
- **Agent 热门Skill** - ClawHub 等技能市场的热门工具
- **GitHub热门项目** - 开源社区值得关注的项目
- **个人OPC优秀案例** - 一人公司使用AI智能体的成功案例
- **教育+AI新产品** - 教育科技领域的最新产品
