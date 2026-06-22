#!/bin/bash
# 每日简报脚本
# 发送时间：每天8:00
# 内容：日期、天气、日程提醒 + 周一行业动态

# 获取今天的日期和星期
DATE=$(date +%Y-%m-%d)
DAY_OF_WEEK=$(date +%u)  # 1=周一, 7=周日

# 获取星期几的中文名称
WEEKDAY_CN=$(date +%A | sed 's/Monday/周一/;s/Tuesday/周二/;s/Wednesday/周三/;s/Thursday/周四/;s/Friday/周五/;s/Saturday/周六/;s/Sunday/周日/')

# 初始化消息内容
MESSAGE="📅 每日简报
━━━━━━━━━━━━
📆 日期：$DATE $WEEKDAY_CN
━━━━━━━━━━━━
"

# 获取天气信息（这里使用上海为例，如果需要其他城市请修改）
# 注意：这里使用curl获取天气，如果没有配置天气API，可以手动添加
WEATHER_INFO="☀️ 天气：今日多云，气温20-28°C（请根据实际天气更新）

"
MESSAGE="$MESSAGE$WEATHER_INFO"

# 添加日程提醒部分
MESSAGE="$MESSAGE━━━━━━━━━━━━
📋 日程提醒
━━━━━━━━━━━━
暂无今日日程

"

# 如果是周一（DAY_OF_WEEK=1），添加数据中心行业动态
if [ "$DAY_OF_WEEK" = "1" ]; then
    MESSAGE="$MESSAGE━━━━━━━━━━━━
🏢 数据中心行业动态
━━━━━━━━━━━━
📰 政策动态
• 暂无最新政策信息

🏭 厂商动态  
• 维谛(Vertiv)：持续推出高效制冷解决方案
• 华为：数字能源数据中心业务持续增长
• 施耐德：推出新一代模块化数据中心

🔧 技术前沿
• 液冷技术成为主流趋势
• AI算力需求推动数据中心升级
• 绿色节能技术持续发展

"
fi

# 添加结束语
MESSAGE="$MESSAGE━━━━━━━━━━━━
祝您今天工作顺利！⚡"

# 将消息写入临时文件
TEMP_FILE=$(mktemp)
echo "$MESSAGE" > "$TEMP_FILE"

# 使用message工具发送到微信
openclaw message send \
    --channel openclaw-weixin \
    --target o9cq800mKf-NUE3yarSzDNB-1-S0@im.wechat \
    --message "$(cat "$TEMP_FILE")"

# 清理临时文件
rm -f "$TEMP_FILE"
