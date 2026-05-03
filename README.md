# NeusoftIkaros
> [!NOTE]
> The main repo for NeusoftIkaros.
>
> NeusoftIkaros 的主要仓库。

> [!NOTE]
> During the internship, a knowledge base system titled “Neusoft AI Assistant” was developed using a front-end and back-end separation architecture. The system is built with Spring Boot and Vue.js, and uses Element Plus as the UI framework.
>
> 在实习期间以“东软AI助手”为主题开发的知识库，采用**前后端分离架构**实现，基于 SpringBoot 与 Vue.js，采用 Element Plus 作为 UI 框架。

> [!NOTE]
> The system integrates a local large language model (qwen3:4b) through Ollama, enabling local AI-powered question answering capabilities. It supports user registration and login, session management, and adjustable LLM response tone switching.
>
> 通过 ollama 接入本地大模型 qwen3:4b，支持**登录注册、会话管理、大模型语气切换**及**文件导出**。

> [!TIP]
> This project is provided as-is and is not actively maintained
>
> Only critical bugs affecting runtime stability will be addressed
>
> Feature requests and non-critical issues are not guaranteed to be responded to
>
> 本项目仅按初始状态提供，**不保证持续维护**
>
> 仅在出现影响运行的严重问题时进行修复
>
> 功能建议与一般性问题**可能不会被处理**

![Spring Boot](https://img.shields.io/badge/SpringBoot-3.4.x-6DB33F?style=flat-square&logo=springboot&logoColor=white)
![Java](https://img.shields.io/badge/Java-17-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![Vue.js](https://img.shields.io/badge/Vue.js-3.x-42B883?style=flat-square&logo=vuedotjs&logoColor=white)
![Vite](https://img.shields.io/badge/Vite-8.x-B73BFE?style=flat-square&logo=vite&logoColor=white)
![Element Plus](https://img.shields.io/badge/Element%20Plus-2.13.x-409EFF?style=flat-square&logo=vuedotjs&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-20-339933?style=flat-square&logo=nodedotjs&logoColor=white)
![Ollama](https://img.shields.io/badge/Ollama-0.21.x-000000?style=flat-square&logo=ollama&logoColor=white)
![Qwen3](https://img.shields.io/badge/Qwen3-4B-6741D9?style=flat-square&logo=data:image/svg+xml;base64, PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjI0IiBoZWlnaHQ9IjI0IiBmaWxsPSJ3aGl0ZSI+PHBhdGggZD0iTTEyLjYgMS4zNGMuMzkuNjkuNzggMS4zOCAxLjE3IDIuMDcuMDMuMDUuMDkuMDkuMTYuMDloNS41NWMuMTcgMCAuMzIuMTEuNDUuMzNsMS40NSAyLjU3Yy4xOS4zNC4yNC40OC4wMi44NC0uMjYuNDMtLjUxLjg2LS43NiAxLjNsLS4zNy42NmMtLjExLjItLjIyLjI4LS4wNC41MWwyLjY1IDQuNjRjLjE3LjMuMTEuNDktLjA0Ljc3LS40NC43OS0uODggMS41Ni0xLjM0IDIuMzQtLjE2LjI3LS4zNS4zOC0uNjguMzctLjc4LS4wMi0xLjU1LS4wMS0yLjMzLjAyYS4xLjEgMCAwIDAtLjA4LjA1Yy0uODkgMS41OC0xLjc5IDMuMTYtMi43MSA0Ljc0LS4xNy4yOS0uMzguMzYtLjczLjM2LTEgLjAwMy0yIC4wMDQtMy4wMi4wMDJhLjU0LjU0IDAgMCAxLS40Ny0uMjdsLTEuMzQtMi4zMmEuMDkuMDkgMCAwIDAtLjA4LS4wNUg0Ljk4Yy0uMjkuMDMtLjU1IDAtLjgxLS4wOWwtMS42LTIuNzdhLjU0LjU0IDAgMCAxIDAtLjU0bDEuMjEtMi4xMmEuMi4yIDAgMCAwIDAtLjJjLS42My0xLjA5LTEuMjUtMi4xOC0xLjg4LTMuMjdsLS43OS0xLjRjLS4xNi0uMzEtLjE3LS41LjEtLjk3LjQ3LS44MS45My0xLjYzIDEuMzktMi40NC4xMy0uMjMuMy0uMzMuNTgtLjMzLjg2IDAgMS43MyAwIDIuNTkgMGEuMTIuMTIgMCAwIDAgLjExLS4wNmwyLjgxLTQuOWEuNDkuNDkgMCAwIDEgLjQyLS4yNWMuNTIgMCAxLjA1IDAgMS41OC0uMDFMMTEuNyAxYy4zNCAwIC43Mi4wMy45LjM0em0tMy40My40YS4wNi4wNiAwIDAgMC0uMDUuMDNMNi4yNSA2Ljc5YS4xNi4xNiAwIDAgMS0uMTQuMDhIMy4yNWMtLjA2IDAtLjA3LjAzLS4wNC4wN2w1LjgxIDEwLjE2Yy4wMy4wNCAwIC4wNi0uMDMuMDZsLTIuOC4wMmEuMjIuMjIgMCAwIDAtLjIuMTJsLTEuMzIgMi4zYy0uMDQuMDgtLjAyLjEyLjA3LjEybDUuNzIuMDFjLjA1IDAgLjA4LjAyLjEuMDZsMS40IDIuNDVjLjA1LjA4LjA5LjA4LjE0IDBsNS4wMS04Ljc2Ljc4LTEuMzhhLjA2LjA2IDAgMCAxIC4xIDBsMS40MiAyLjUzYS4xMi4xMiAwIDAgMCAuMTEuMDZsMi43Ni0uMDJhLjA0LjA0IDAgMCAwIC4wMy0uMDIuMDQuMDQgMCAwIDAgMC0uMDRsLTIuOS01LjA5YS4xMS4xMSAwIDAgMSAwLS4xMWwuMjktLjUxIDEuMTItMS45OGMuMDItLjA0LjAxLS4wNi0uMDQtLjA2SDkuMmMtLjA2IDAtLjA3LS4wMy0uMDQtLjA4bDEuNDMtMi41YS4xMS4xMSAwIDAgMCAwLS4xMUw5LjIzIDEuNzdhLjA2LjA2IDAgMCAwLS4wNi0uMDN6bTYuMjkgOC4wMmMuMDUgMCAuMDYuMDIuMDMuMDZsLS44MyAxLjQ3LTIuNjEgNC41OGEuMDYuMDYgMCAwIDEtLjEgMEw4LjUgOS44NGMtLjAyLS4wMy0uMDEtLjA1LjAzLS4wNWwuMjItLjAxIDYuNzItLjAxeiIvPjwvc3ZnPg== &logoColor=white) 
![MySQL](https://img.shields.io/badge/MySQL-8.x-4479A1?style=flat-square&logo=mysql&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-3.9.x-C71A36?style=flat-square&logo=apachemaven&logoColor=white)
![npm](https://img.shields.io/badge/npm-10-CB3837?style=flat-square&logo=npm&logoColor=white)

---

## 🖼️ 示例截图(Demo Screenshots)

<p align="center">
  <img src="login.jpg" width="600"/>
  <br/>
  登录页
</p>
<br/>
<p align="center">
  <img src="chat.jpg" width="600"/>
  <br/>
  聊天页
</p>

---

## 🔗 相关仓库(Related Repositories)
[![FRepo](https://img.shields.io/badge/前端-Repo-4FC08D?logo=vuedotjs&style=flat-square&logoColor=white)](https://github.com/NeusoftIkaros/ikaros-vue)
[![FRelease](https://img.shields.io/badge/前端-Releases-4FC08D?logo=vuedotjs&style=flat-square&logoColor=white)](https://github.com/NeusoftIkaros/ikaros-vue/releases)
[![BRepo](https://img.shields.io/badge/后端-Repo-6DB33F?logo=springboot&style=flat-square&logoColor=white)](https://github.com/NeusoftIkaros/ikaros-springboot)
[![BRelease](https://img.shields.io/badge/后端-Releases-6DB33F?logo=springboot&style=flat-square&logoColor=white)](https://github.com/NeusoftIkaros/ikaros-springboot/releases)
[![Modelfile](https://img.shields.io/badge/Modelfile-Repo-000000?logo=ollama&style=flat-square&logoColor=white)](https://github.com/NeusoftIkaros/ikaros-modelfile)

## 🚀 快速开始(Quick Start)
**0. 在开始之前，可以新建一个文件夹**

```bash
mkdir NeusoftIkaros
cd NeusoftIkaros
```
**1. 下载对应 Releases( [前端](https://github.com/NeusoftIkaros/ikaros-vue/releases) | [后端](https://github.com/NeusoftIkaros/ikaros-springboot/releases) )并解压**

**2. 导入 SQL**

```bash
curl -L -o neusoft_ikaros.sql https://raw.githubusercontent.com/NeusoftIkaros/NeusoftIkaros/main/neusoft_ikaros.sql
mysql -u root -p < neusoft_ikaros.sql
```
**3. 安装 ollama 并运行虚拟服务器**

```bash
curl -fsSL https://ollama.com/install.sh | sh
curl -L -o Modelfile https://raw.githubusercontent.com/NeusoftIkaros/ikaros-modelfile/main/Modelfile
ollama pull qwen3:4b
ollama create neusoft-ikaros -f Modelfile
ollama serve
```
**4. 启动后端**

```bash
curl -L -o application.properties.example https://raw.githubusercontent.com/NeusoftIkaros/ikaros-springboot/main/application.properties.example
```
>[!WARNING]
> 根据本地的实际环境修改配置，重命名文件为 `application.properties`
>
> 并确保**该文件与** `.jar` **文件处于同一目录**后再继续运行
```bash
java -jar ikaros-springboot-0.0.1-SNAPSHOT.jar --spring.config.location=application.properties
```
**5. 启动前端**

在解压后的根目录处
```bash
npm install -g serve
serve dist
```
**6. 访问项目**

打开浏览器，访问 `http://localhost:3000`

## ⚙️ 部署指南(Deployment Guide)

### 推荐环境要求
- MySQL 8.x
- JDK 17
- Node.js 20+
- npm 10+
- Maven 3.9+
- ollama 0.21.0+

> [!TIP]
> 如果你使用 GitHub Release 中已经打包好的后端 `.jar`，通常不需要再单独下载 Maven 依赖
> 
> **只有在你从源码启动或自行重新打包时，才需要下载对应依赖**

### 创建数据库
本项目已提供 [SQL
脚本](https://github.com/NeusoftIkaros/NeusoftIkaros/blob/main/neusoft_ikaros.sql)，下载后运行
```bash
mysql -u root -p < [sql文件路径]
```

### 约束及运行LLM
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


### 修改后端配置文件
下载 [application.properties.example](https://github.com/NeusoftIkaros/ikaros-springboot/blob/main/application.properties.example) 并按本地的实际环境修改以下配置:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/neusoft_ikaros?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
spring.datasource.username=root
spring.datasource.password=123456
server.port=8080
```

然后改名为 `application.properties`

### 运行后端
- 如果你使用 [.jar](https://github.com/NeusoftIkaros/ikaros-springboot/releases) 文件，直接在**文件存放处**执行以下命令

```bash
java -jar ikaros-springboot-0.0.1-SNAPSHOT.jar --spring.config.location=[application.properties文件路径]
```
- 如果你使用 [源码](https://github.com/NeusoftIkaros/ikaros-springboot/releases)，执行以下操作:

将文件复制到 `ikaros-springboot\src\main\resources\` 覆盖原本存在的 `application.properties` 文件,然后在**项目根目录处**执行以下命令

```bash
mvn spring-boot:run
```

> [!IMPORTANT]
> 依照开发者使用环境，`.jar` 中封装的数据库端口号为 `3307`，所以**请务必使用** `application.properties` **文件重新配置数据库端口号**
> 
> 默认的 `application.properties` 中数据库用户为 `admin`，密码为 `123456`

### 运行前端
- 如果你使用 [dist](https://github.com/NeusoftIkaros/ikaros-vue/releases/tag/v1.x) 包，直接在**解压后的根目录处**执行以下命令

```bash
npm install -g serve
serve dist
```

- 如果你使用 [源码](https://github.com/NeusoftIkaros/ikaros-vue)，直接在**项目根目录处**执行以下命令

```bash
npm run dev
```

### 使用项目
- 如果你通过 `serve` 来使用 dist 包，那么打开浏览器，访问 `http://localhost:3000`
- 如果你通过 `npm run dev` 命令来直接运行源码，那么打开浏览器，访问 `http://localhost:5173`

## 🔌 接口规范(API Specification)
*参见本 repo 下的 [API_REFERENCE.md](https://github.com/NeusoftIkaros/NeusoftIkaros/blob/main/API_REFERENCE.md)*

## ⚠️ 免责声明

> [!CAUTION]
> **本项目为独立的学习与个人开发项目。**
>
> **本项目中所提到的东软（或Neusoft）与现实中的东软集团股份有限公司（官方英文注册名：Neusoft Corporation）及其任何子公司、关联公司、海外分支机构、研究机构、教育机构或其他相关组织均无关，该项目与上述所列机构无任何隶属、授权或官方关联关系。**

