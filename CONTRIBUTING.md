# Neusoft Ikaros 开发协作规范 V1.3

## 1. 文档定位

本规范用于约束 `NeusoftIkaros` 仓库的开发、联调、文档维护和提交流程。

- 生效版本：`1.3`
- 适用范围：`ikaros-springboot`、`ikaros-vue`、`neusoft_ikaros.sql`、根目录说明文档
- 约束原则：以当前仓库中的真实代码和脚本为准，文档必须跟着实现同步更新

## 2. 当前仓库结构

项目当前采用前后端分离结构：

- `ikaros-springboot`：Spring Boot 后端
- `ikaros-vue`：Vue 3 前端
- `ikaros-vue/icon`：当前前端图标与头像静态资源目录
- `neusoft_ikaros.sql`：数据库初始化脚本
- `接口规范.md`：接口说明文档

当前前端源码主要文件：

- `ikaros-vue/src/App.vue`
- `ikaros-vue/src/components/AuthPage.vue`
- `ikaros-vue/src/components/ChatPage.vue`
- `ikaros-vue/src/main.js`

提交代码时，不把 `dist`、IDE 配置、截图、临时产物当成功能实现的一部分进行描述。

## 3. 技术栈基线

### 3.1 后端

- Java `17`
- Spring Boot `3.2.5`
- MyBatis-Plus `3.5.7`
- MySQL
- Lombok
- Jakarta Validation

### 3.2 前端

- Vue `3.5.x`
- Vite `7.x`
- Element Plus `2.13.x`
- Axios
- Node.js `^20.19.0 || >=22.12.0`

### 3.3 AI 相关

- 本地 Ollama 服务
- 当前模型名：`neusoft-ikaros`
- 当前调用地址：`http://localhost:11434/api/chat`
- 当前请求方式：后端通过 HTTP `POST` 调用 Ollama，前端通过 HTTP `GET /chat/send` 调用后端聊天接口

## 4. 命名与分层规范

### 4.1 后端包结构

后端基础包统一使用：

- `com.neusoft.ikaros`

现有分层目录包括：

- `controller`：接口入口
- `service`：业务接口
- `service.impl`：业务实现
- `mapper`：数据访问层
- `entity`：数据库实体映射
- `dto`：请求参数对象
- `config`：配置
- `exception`：全局异常处理

新增代码必须进入现有分层，避免把业务逻辑直接堆在 `controller` 中。

### 4.2 命名规则

- Java 类名：`PascalCase`
- Java 方法名、字段名：`camelCase`
- 数据库表名、字段名：`snake_case`
- Vue 组件文件：`PascalCase`
- 文档命名：语义明确，禁止使用 `temp.md`、`new.md` 之类临时命名

## 5. 后端开发规范

### 5.1 Controller 约束

- 现有接口按 `/user`、`/chat`、`/session` 分组
- 参数校验优先通过 DTO + `@Valid` / `@Validated` 完成
- Controller 只负责路由、参数接收和结果返回
- 模型调用、数据库写入、会话维护逻辑必须放在 `service` 层或明确的持久化层中

### 5.2 Service 约束

- 聊天主流程目前集中在 `QaServiceImpl`
- Ollama 调用集中在 `OllamaServiceImpl`
- 修改会话创建、历史拼接、问答入库逻辑时，必须同步检查接口文档和 SQL 脚本

### 5.3 Mapper 约束

- 简单 CRUD 优先使用 MyBatis-Plus
- 自定义 SQL 必须与实体和表字段保持一致
- 涉及删除、搜索、导出等用户数据操作时，优先考虑 `user_id` 归属范围

### 5.4 DTO 与实体约束

- 请求参数优先使用 DTO，不直接暴露实体作入参
- 实体类只表达持久化结构
- 当前实体与表的主要对应关系：
- `UserInfo.username -> user_info.username`
- `UserInfo.passwordHash -> user_info.password_hash`
- `QaRecord.createTime -> qa_record.created_at`
- `ChatSession.lastTime -> chat_session.last_time`
- `ChatSession.createdAt -> chat_session.created_at`

### 5.5 异常处理

- 参数校验异常统一走全局异常处理器
- 聊天模型调用失败时，当前实现通常表现为 HTTP 500
- 对外错误信息要可读，但不能直接暴露数据库、路径、堆栈等内部细节

## 6. 前端开发规范

### 6.1 当前结构

前端当前不是空壳目录结构，而是已经拆分为登录页和聊天页组件：

- `App.vue`：根组件，负责登录态切换
- `components/AuthPage.vue`：登录 / 注册页
- `components/ChatPage.vue`：聊天主页面
- `icon/`：Logo、模式图标、思考图标、用户头像等静态资源

当前聊天页已包含这些关键交互：

- 左侧会话列表与搜索
- 顶部会话标题展示
- 示例问题快捷提问
- 简明 / 详细模式切换
- 统一的居中删除确认弹窗

后续如果继续拆目录，必须基于实际代码规模，不要先建大量空目录。

### 6.2 前端代码约束

- 当前接口请求直接写在组件中，后续如继续扩展，建议逐步收敛到请求层
- 页面状态必须显式处理成功、加载、失败三种分支
- 接口或返回结构变化时，必须同步更新 `接口规范.md`
- 聊天页涉及头像、建议问题、消息列表、会话标题、删除确认、导出功能时，优先保持已有样式和交互一致性

## 7. 数据库规范

当前初始化脚本中的核心表：

- `user_info`
- `qa_record`
- `chat_session`

### 7.1 当前表结构与代码对应结论

检查结果如下：

- `user_info` 与 `UserInfo` 实体对应
- `chat_session` 与 `ChatSession` 实体对应
- `qa_record` 与 `QaRecord` 实体基本对应
- 原脚本中的 `qa_record.query_time` 字段当前代码未使用，已从初始化脚本中移除，统一以 `created_at` 表达问答时间

### 7.2 数据库变更要求

- 修改表结构时，必须同步更新 `neusoft_ikaros.sql`
- 表字段命名统一使用 `snake_case`
- 时间字段优先使用稳定语义，如 `created_at`、`updated_at`
- 会话和问答记录表必须保留 `user_id` 作为用户归属字段

## 8. 接口协作规范

- 当前后端接口总数为 `11` 个
- 详细定义见根目录 `接口规范.md`
- 新增、删除、修改接口时，必须在同一轮变更里同步更新文档
- 不允许只改后端实现而不通知前端返回结构变化

当前特别注意：

- `/chat/send` 返回纯文本，不是 JSON
- `/chat/history`、`/chat/search`、`/session/list`、`/session/search` 返回实体数组
- `/chat/export` 返回文本文件流
- `/chat/message/{id}` 当前删除逻辑未校验用户归属

## 9. 安全与风险规范

- 禁止提交新的明文密码、生产环境账号和敏感地址
- 当前项目密码仍使用 MD5 存储，只允许在说明文档中如实描述，不应继续扩大使用范围
- 删除、搜索、导出等接口应优先补齐用户归属校验
- 当前项目未接入 Token / Session 鉴权，`userId` 主要由前端传入，仅适合课程项目或本地演示环境

## 10. 提交与变更要求

- 提交前至少确认受影响模块可正常编译或启动
- 变更说明必须写清楚改了什么、为什么改、是否影响接口或数据库
- 不混入无关格式化、构建产物、IDE 文件
- 文档变更若影响开发或答辩口径，优先与代码一并提交

推荐提交信息风格：

- `feat: 新增会话搜索接口`
- `fix: 修正聊天记录删除范围`
- `docs: 更新接口规范和数据库说明`
- `refactor: 调整聊天服务分层`

## 11. 联调与运行基线

### 11.1 后端

- 默认端口：`8080`
- 数据库：`localhost:3307/neusoft_ikaros`

### 11.2 前端

常用命令：

```bash
npm run dev
npm run build
```

### 11.3 AI 服务

联调前需确认：

- Ollama 已启动
- 本地模型 `neusoft-ikaros` 可用
- 后端可访问 `http://localhost:11434/api/chat`

## 12. 文档维护规则

- 本文件版本号每次修订必须同步更新
- 当仓库结构、接口数量、核心依赖、数据库结构发生变化时，本文件必须在同一轮变更中更新
- 若文档与代码冲突，以当前代码为准，并应立即修正文档

---

维护说明：

- 版本：`1.3`
- 
