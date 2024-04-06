## 一、Demo效果

### 1、后台管理

#### 1.1、登录

![image-20240406211853401](C:\Users\uxiah\AppData\Roaming\Typora\typora-user-images\image-20240406211853401.png)

#### 1.2、工作台

![image-20240406211918944](https://s2.loli.net/2024/04/06/EiXPRIOMywN5D4C.png)

#### 1.3、数据统计

![image-20240406211946847](https://s2.loli.net/2024/04/06/OnoRXbtAWldi69P.png)

#### 1.4、订单管理

![image-20240406212007922](https://s2.loli.net/2024/04/06/InT3j4XSYtMgRe8.png)

#### 1.5、套餐管理

![image-20240406212022659](https://s2.loli.net/2024/04/06/l4TqQO61wzNmCJ5.png)

#### 1.6、菜品管理

![](https://s2.loli.net/2024/04/06/l4TqQO61wzNmCJ5.png)

#### 1.7、分类管理

![image-20240406212044698](https://s2.loli.net/2024/04/06/c3yqMgofzO1VSEb.png)

#### 1.8、员工管理

![image-20240406212056872](https://s2.loli.net/2024/04/06/w7iSY1lWmLovEeD.png)

### 2、用户端

#### 2.1、微信登录

![image-20240406212253540](https://s2.loli.net/2024/04/06/Yi6fe9RvybJDUsX.png)

![image-20240406212311389](https://s2.loli.net/2024/04/06/6sCwlN3MpbiWjaS.png)

#### 2.2、店铺菜品

![image-20240406212342578](https://s2.loli.net/2024/04/06/1kvZyU93IuMPAJh.png)

#### 2.3、点餐

![image-20240406212412077](https://s2.loli.net/2024/04/06/kqLn98BczDbVrK2.png)

![image-20240406212441702](https://s2.loli.net/2024/04/06/SXFgscVzrqbEDCx.png)

#### 2.4、购物车

![image-20240406212506666](https://s2.loli.net/2024/04/06/9D8YjqE1ON7zW5A.png)

#### 2.5、提交订单

![image-20240406212531690](https://s2.loli.net/2024/04/06/GRTx2uo3tyZDckd.png)

![image-20240406212543391](https://s2.loli.net/2024/04/06/lprVxj7FvzBSfU2.png)

#### 2.6、支付订单

![image-20240406212636612](https://s2.loli.net/2024/04/06/b3N4oUjcywuHhvm.png)

![image-20240406212652126](https://s2.loli.net/2024/04/06/hf35e2dBgrc8HXP.png)

#### 2.7、订单详情

![image-20240406212714965](https://s2.loli.net/2024/04/06/nP5Am8sBGalD1Jx.png)

#### 2.8、历史订单

![image-20240406212748379](https://s2.loli.net/2024/04/06/TRAGbQDIloaJfWm.png)

#### 2.9、地址管理

![image-20240406212837016](https://s2.loli.net/2024/04/06/sVobFwmPYBrGn2Z.png)

![image-20240406212848952](https://s2.loli.net/2024/04/06/6eaDHn2w7MYmpQu.png)

## 二、技术选型

### 1、前端技术

| 技术栈    | 重点关注     |
| --------- | ------------ |
| `Node.js` | 基本命令     |
| `Vue`     | 指令、组件化 |
| `Axios`   | 基本请求     |
| `ECharts` | 基本使用     |

### 2、后端技术

| 技术栈         | 版本        |
| -------------- | ----------- |
| `OpenJDK`      | `1.8.0_312` |
| `Maven`        | `3.6.3`     |
| `Spring Boot`  | `2.7.3`     |
| `Spring Cache` | `2.7.3`     |
| `Sprint Task`  | `2.7.3`     |
| `WebSocket`    | `2.7.3`     |
| `MyBatis`      | `2.2.0`     |
| `PageHelper`   | `1.3.0`     |
| `Aliyun OSS`   | `3.10.2`    |
| `Knife4j`      | `3.0.2`     |
| `JWT`          | `0.9.1`     |
| `POI`          | `3.16`      |
| `WechatPay`    | `0.4.8`     |

### 3、数据库技术

| 技术栈  | 版本       |
| ------- | ---------- |
| `MySQL` | `5.7.33`   |
| `Redis` | `5.0.14.1` |



## 三、基本命令

### 1、Yapi

#### 1.1、内网部署 Yapi

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

#### 1.2、启动 Yapi

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

#### 1.3、添加项目

- 苍穹外卖-管理端
- 苍穹外卖-用户端

![image-20240403210251749](https://s2.loli.net/2024/04/03/u7snwcqPEmazhBO.png)

#### 1.4、导入数据

分别进入项目的数据管理页面，导入项目接口资料中的 json 文件，注意选择 json 类型

![image-20240403210422370](https://s2.loli.net/2024/04/03/b9tdCNGjiaFATLp.png)

#### 1.5、最终效果

![image-20240403210848837](https://s2.loli.net/2024/04/03/FV32zcaCnL9uy1R.png)

![image-20240403210902880](https://s2.loli.net/2024/04/03/J98nTw3Gsc24oDX.png)



### 2、Cpolar(内网穿透)

```bash
D:
cd D:\Program\cpolar

# 指定authtoken
cpolar.exe authtoken ZWI2YzBiYWYtYjVmYi00NmMwLWJkNGQtMmI5NTk3ZTkyMDBk

# 获取临时域名
cpolar
```

