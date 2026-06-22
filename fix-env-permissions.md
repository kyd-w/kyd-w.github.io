# 权限修复指令（需要你手动执行）

## 问题
环境变量文件仍然是 `root:root` 600 权限，智能体无法读取。

## 解决方案

请执行以下命令：

```bash
# 修改所有环境变量文件的权限
sudo chmod 644 /airuntime/.env*
sudo chown wq:wq /airuntime/.env* 2>/dev/null || echo "保持 root 属主也可以，只要权限是 644"
```

## 验证

执行后，运行以下命令验证：

```bash
ls -la /airuntime/.env*
```

应该看到类似：
```
-rw-r--r-- 1 root root 107 Mar 3日 17:21 /airuntime/.env
-rw-r--r-- 1 root root 240 Mar 3日 17:54 /airuntime/.env.feishu
-rw-r--r-- 1 root root 101 Mar 4日 10:57 /airuntime/.env.github
-rw-r--r-- 1 root root 416 Mar11日 21:46 /airuntime/.env.openai
-rw-r--r-- 1 root root 378 May 4日 15:22 /airuntime/.env.search
```

关键是权限要是 `644`（`-rw-r--r--`），这样任何用户都可以读取。

---

**执行完成后告诉我，我会继续测试！**
