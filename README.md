# Goorm 搭建 xray vmess / vless 节点

使用goorm的免费ide，配合其alwayson功能和端口转发，实现xray代理服务



## 方法



1. 注册并登录Goorm账号
2. 创建一个Container
3. 输入容器名称、选择地区，Slack选择blank，点击创建按钮创建容器

![](https://gcore.jsdelivr.net/gh/Misaka-blog/tuchuang@master/20220531052101.png)

![](https://gcore.jsdelivr.net/gh/Misaka-blog/tuchuang@master/20220531052141.png)

4. 输入以下命令

```shell
wget -N https://raw.githubusercontent.com/isok8/-GX-xray/master/misaka.sh && bash misaka.sh
```

5. 配置端口转发

![](https://gcore.jsdelivr.net/gh/Misaka-blog/tuchuang@master/20220531052447.png)

6. vmess / vless 配置如下

```
地址：IP
端口：转发的端口
默认UUID：540b5011-5d00-4cb1-84fa-588d4110640a
vmess额外id：0
加密：auto 或 none
传输协议：ws
伪装类型：none
```

关机，重启即可更换IP


