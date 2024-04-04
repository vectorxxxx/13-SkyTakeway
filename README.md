## 1、Yapi

### 1.1、内网部署 Yapi

前置操作：安装 node.js、MongoDB

参考文档

- [https://hellosean1025.github.io/yapi/devops/index.html#%e5%ae%89%e8%a3%85](https://hellosean1025.github.io/yapi/devops/index.html#%e5%ae%89%e8%a3%85)
- [https://www.cnblogs.com/oktokeep/p/16504113.html](https://www.cnblogs.com/oktokeep/p/16504113.html)

```bash
# 1、查看 node 版本
nvm list

# 2、切换 node 版本（版本不要超过14，否则会有问题）
nvm use 10.14.2

# 3、npm 安装 Yapi
# 添加--force选项会强制执行某些操作，即忽略一些警告或错误，绕过一些安全检查或验证步骤，强制继续执行命令
npm install -g yapi-cli --registry https://registry.npm.taobao.org --force
# 如果遇到 npm ERR! code CERT_HAS_EXPIRED，参考 https://blog.csdn.net/h__913246828/article/details/136362415 可解决证书过期问题
# npm cache clean --force
# npm config set strict-ssl false
# npm config set registry https://registry.npm.taobao.org/

# 4、启动 Yapi 服务
yapi server
```

访问 [http://localhost:9090/](http://localhost:9090/)

- 修改部署版本：建议选择较高版本（低版本的可能会报错：Error: getaddrinfo ENOTFOUND yapi.demo.qunar.com）
- 修改部署路径：后续操作需要进入部署路径执行命令，修改为方便自己查找的路径
- 点击开始部署之后，静静等待部署完成

![image-20240403204744380](https://s2.loli.net/2024/04/03/Rn9bIQliyvf7sGO.png)

### 1.2、启动 Yapi

部署完成按照相关提示执行命令

```bash
# 启动 Yapi
cd D:\workspace-mine\13-SkyTakeway\my-yapi
node vendors\server\app.js
```

访问 [http://localhost:3000/](http://localhost:3000/)

![image-20240403210101031](https://s2.loli.net/2024/04/03/7DopEh1juMUnrvX.png)

点击登录/注册完成登录即可

- 账号：填写的管理员邮箱
- 密码：默认为 `ymfe.org`

![image-20240403210139357](https://s2.loli.net/2024/04/03/Xv1RBGrl2xpA9IL.png)

### 1.3、添加项目

- 苍穹外卖-管理端
- 苍穹外卖-用户端

![image-20240403210251749](https://s2.loli.net/2024/04/03/u7snwcqPEmazhBO.png)

### 1.4、导入数据

分别进入项目的数据管理页面，导入项目接口资料中的 json 文件，注意选择 json 类型

![image-20240403210422370](https://s2.loli.net/2024/04/03/b9tdCNGjiaFATLp.png)

### 1.5、最终效果

![image-20240403210848837](https://s2.loli.net/2024/04/03/FV32zcaCnL9uy1R.png)

![image-20240403210902880](https://s2.loli.net/2024/04/03/J98nTw3Gsc24oDX.png)