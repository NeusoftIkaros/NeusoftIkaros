# NeusoftIkaros
The main repo for NeusoftIkaros.

NeusoftIkaros的主要仓库。

During the internship, a knowledge base system titled “Neusoft AI Assistant” was developed using a front-end and back-end separation architecture. The system is built with Spring Boot and Vue.js, and uses Element Plus as the UI framework.

在实习期间以“东软AI助手”为主题开发的知识库，采用前后端分离架构实现，基于 SpringBoot 与 Vue.js，采用 Element Plus 作为 UI 框架。

The system integrates a local large language model (qwen3:4b) through Ollama, enabling local AI-powered question answering capabilities. It supports user registration and login, session management, and adjustable LLM response tone switching.

通过 ollama 接入本地大模型 qwen3:4b，支持登录注册、会话管理、大模型语气切换及文件导出。

---

#### 登录页
<p align="center">
  <img src="login.png" width="600"/>
</p>

#### 聊天页
<p align="center">
  <img src="chat.png" width="600"/>
</p>

---

### 📂 相关仓库与发布页
- [前端Repo](https://github.com/NeusoftIkaros/ikaros-vue)
- [前端Releases](https://github.com/NeusoftIkaros/ikaros-vue/releases/tag/v1.x)
- [后端Repo](https://github.com/NeusoftIkaros/ikaros-springboot)
- [后端Releases](https://github.com/NeusoftIkaros/ikaros-springboot/releases)
- [Modelfile Repo](https://github.com/NeusoftIkaros/ikaros-modelfile)

### 🚀 快速开始

#### 推荐环境要求
- MySQL 8.x
- JDK 17
- Node.js 20+
- npm 10+
- Maven 3.9+
- ollama 0.21.0+

说明: 
- 如果你使用 GitHub Release 中已经打包好的后端 `jar`，通常不需要再单独下载 Maven 依赖
- 只有在你从源码启动或自行重新打包时，才需要下载对应依赖

#### 创建数据库
项目已提供 [neusoft_ikaros.sql](https://github.com/NeusoftIkaros/NeusoftIkaros/blob/main/neusoft_ikaros.sql)，下载后运行
```bash
mysql -u root -p < [sql文件路径]
```

#### 约束及运行LLM
通过ollama下载 `qwen3:4b` 模型

```bash
ollama pull qwen3:4b
```

下载 [Modelfile](https://github.com/NeusoftIkaros/ikaros-modelfile/blob/main/Modelfile) 后使用以下命令约束模型

```bash
ollama create neusoft-ikaros -f [Modelfile文件路径]
```

然后运行 ollama 虚拟服务

```bash
ollama serve
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
- 如果你使用 [.jar](https://github.com/NeusoftIkaros/ikaros-springboot/releases) 文件，直接在文件存放处执行以下命令

```bash
java -jar app.jar --spring.config.location=[application.properties文件路径]
```
- 如果你使用 [源码](https://github.com/NeusoftIkaros/ikaros-springboot/releases)，执行以下操作:

将文件复制到 `ikaros-springboot\src\main\resources\` 覆盖原本存在的 ` application.properties` 文件,然后在项目根目录处执行以下命令

```bash
mvn spring-boot:run
```

#### 运行前端
- 如果你使用 [dist](https://github.com/NeusoftIkaros/ikaros-vue/releases/tag/v1.x) 包，直接在解压后的根目录处执行以下命令

```bash
npm install -g serve
serve dist
```

- 如果你使用 [源码](https://github.com/NeusoftIkaros/ikaros-vue)，直接在项目根目录处执行以下命令

```bash
npm run dev
```

#### 使用项目
- 如果你通过 `serve` 来使用 dist 包，那么打开浏览器，访问 `http://localhost:3000`
- 如果你通过 `npm run dev` 命令来访问源码，那么打开浏览器，访问 `http://localhost:5173`

### 🔌 接口规范
参见本 repo 下的 [API_REFERENCE.md](https://github.com/NeusoftIkaros/NeusoftIkaros/blob/main/API_REFERENCE.md) 

