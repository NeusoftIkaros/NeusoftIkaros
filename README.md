# NeusoftIkaros
The main repo for NeusoftIkaros.

NeusoftIkaros的主要仓库。

---

### 📂 相关仓库与发布页
- [前端仓库](https://github.com/NeusoftIkaros/ikaros-vue)
- [前端发行版](https://github.com/NeusoftIkaros/ikaros-vue/releases/tag/v1.x)
- [后端仓库](https://github.com/NeusoftIkaros/ikaros-springboot)
- [后端发行版](https://github.com/NeusoftIkaros/ikaros-springboot/releases)
- [Modelfile 仓库](https://github.com/NeusoftIkaros/ikaros-modelfile)

### 🚀 快速开始

#### 推荐环境要求
- MySQL 8.x
- JDK 17
- Node.js 20+
- npm 10+
- Maven 3.9+

说明: 
- 如果你使用 GitHub Release 中已经打包好的后端 `jar`，通常不需要再单独下载 Maven 依赖
- 如果你使用 GitHub Release 中已经打包好的前端 `dist`，通常不需要再执行 `npm install` 下载前端依赖
- 只有在你从源码启动或自行重新打包时，才需要下载对应依赖

#### 创建数据库
项目已提供 [neusoft_ikaros.sql](https://github.com/NeusoftIkaros/NeusoftIkaros/blob/main/neusoft_ikaros.sql)，下载后运行
```bash
mysql -u root -p < [sql文件路径]
```

#### 修改后端配置文件
下载 [application.properties.example](https://github.com/NeusoftIkaros/ikaros-springboot/blob/main/application.properties.example) 按本地的实际环境修改以下配置:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/neusoft_ikaros?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
spring.datasource.username=root
spring.datasource.password=123456
server.port=8080
```

然后改名为 `application.properties`

#### 运行后端
- 如果你使用 [.jar](https://github.com/NeusoftIkaros/ikaros-springboot/releases) 文件,直接执行以下命令

```bash
java -jar app.jar --spring.config.location=[application.properties文件路径]
```
- 如果你使用 [源码](https://github.com/NeusoftIkaros/ikaros-springboot/releases) ,执行以下操作:

将文件复制到 `ikaros-springboot\src\main\resources\` 覆盖原本存在的 ` application.properties` 文件,然后执行以下命令

```bash
mvn spring-boot:run
```
