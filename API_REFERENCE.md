# Neusoft Ikaros 接口规范

注: 本文档由 CodeX 自动生成

## 1. 基本信息

- 后端项目：`ikaros-springboot`
- 默认端口：`8080`
- 基础地址：`http://localhost:8080`

## 2. 通用返回说明

### 2.1 操作类接口常见返回

```json
{
  "code": 200,
  "msg": "操作成功"
}
```

### 2.2 参数校验失败返回

由全局异常处理器返回：

```json
{
  "code": 400,
  "msg": "具体校验失败信息"
}
```

### 2.3 当前实现注意

- `/chat/send` 直接返回纯文本，不是 JSON
- `/chat/history`、`/chat/search`、`/session/list`、`/session/search` 直接返回实体数组
- `/chat/export` 返回文本文件下载
- 登录接口当前未加参数校验注解
- 聊天服务调用本地 Ollama 失败时，通常表现为 HTTP 500

## 3. 用户接口

接口前缀：`/user`

### 3.1 用户注册

- 方法：`POST`
- 路径：`/user/register`
- Content-Type：`application/json`

请求体：

```json
{
  "username": "string",
  "password": "string"
}
```

字段说明：

- `username`：必填，长度 `6-12`
- `password`：必填，长度至少 `6`

成功响应：

```json
{
  "code": 200,
  "msg": "注册成功"
}
```

失败响应：

```json
{
  "code": 400,
  "msg": "账号已存在"
}
```

校验失败示例：

```json
{
  "code": 400,
  "msg": "用户名长度必须为6-12位"
}
```

### 3.2 用户登录

- 方法：`POST`
- 路径：`/user/login`
- Content-Type：`application/json`

请求体：

```json
{
  "username": "string",
  "password": "string"
}
```

字段说明：

- `username`：当前未加校验注解
- `password`：当前未加校验注解

成功响应：

```json
{
  "code": 200,
  "msg": "登录成功",
  "userId": 1
}
```

失败响应：

```json
{
  "code": 400,
  "msg": "账号或密码错误"
}
```

### 3.3 修改密码

- 方法：`POST`
- 路径：`/user/password/update`
- Content-Type：`application/json`

请求体：

```json
{
  "userId": 1,
  "oldPassword": "string",
  "newPassword": "string"
}
```

字段说明：

- `userId`：必填
- `oldPassword`：必填
- `newPassword`：必填，长度至少 `6`

成功响应：

```json
{
  "code": 200,
  "msg": "密码修改成功"
}
```

失败响应：

```json
{
  "code": 400,
  "msg": "旧密码错误或新旧密码相同"
}
```

校验失败示例：

```json
{
  "code": 400,
  "msg": "新密码长度不能少于6位"
}
```

## 4. 聊天接口

接口前缀：`/chat`

### 4.1 发送消息

- 方法：`GET`
- 路径：`/chat/send`

查询参数：

- `userId`：`Long`，必填
- `sessionId`：`String`，必填
- `question`：`String`，必填
- `mode`：`String`，必填

示例：

```http
GET /chat/send?userId=1&sessionId=s001&question=什么是SpringBoot&mode=concise
```

响应类型：

- `text/plain`

业务说明：

- 若 `sessionId` 对应会话不存在，会自动创建会话
- 新会话标题默认使用本次 `question`
- 若会话已存在，会更新 `chat_session.last_time`
- `mode` 为 `detailed` 时，发送给模型的前缀为 `[Mode: Detailed]`
- 其他值统一按 `[Mode: Concise]` 处理
- 当前最多携带最近 `10` 轮问答作为上下文
- 每次提问后会写入一条 `qa_record`

成功响应示例：

```text
Spring Boot 是一个用于快速构建 Spring 应用的开发框架。
```

失败说明：

- 本地 Ollama 服务不可用或模型调用失败时，通常返回 HTTP 500

### 4.2 查询会话历史

- 方法：`GET`
- 路径：`/chat/history`

查询参数：

- `userId`：`Long`，必填
- `sessionId`：`String`，必填

成功响应：

```json
[
  {
    "id": 1,
    "userId": 1,
    "sessionId": "s001",
    "question": "什么是SpringBoot",
    "answer": "Spring Boot 是……",
    "mode": "concise",
    "createTime": "2026-04-20T10:00:00"
  }
]
```

返回说明：

- 按 `created_at` 升序返回

### 4.3 搜索聊天内容

- 方法：`GET`
- 路径：`/chat/search`

查询参数：

- `userId`：`Long`，必填
- `keyword`：`String`，必填

成功响应：

```json
[
  {
    "id": 3,
    "userId": 1,
    "sessionId": "s001",
    "question": "Spring MVC 和 Spring Boot 区别",
    "answer": "二者关系是……",
    "mode": "detailed",
    "createTime": "2026-04-20T10:20:00"
  }
]
```

返回说明：

- 搜索范围：`question` 或 `answer`
- 按 `created_at` 倒序返回

### 4.4 删除单条消息

- 方法：`DELETE`
- 路径：`/chat/message/{id}`

路径参数：

- `id`：问答记录主键 ID

成功响应：

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

说明：

- 当前实现直接按主键删除
- 未校验记录是否存在
- 未校验该记录是否属于当前用户

### 4.5 导出会话记录

- 方法：`GET`
- 路径：`/chat/export`

查询参数：

- `userId`：`Long`，必填
- `sessionId`：`String`，必填

响应说明：

- Content-Type：`text/plain;charset=UTF-8`
- Content-Disposition：`attachment; filename=chat_{sessionId}.txt`

文件内容示例：

```text
Q: 什么是SpringBoot
A: Spring Boot 是……

Q: 它的优点是什么
A: 主要优点包括……
```

## 5. 会话接口

接口前缀：`/session`

### 5.1 获取会话列表

- 方法：`GET`
- 路径：`/session/list`

查询参数：

- `userId`：`Long`，必填

成功响应：

```json
[
  {
    "id": 1,
    "sessionId": "s001",
    "userId": 1,
    "title": "什么是SpringBoot",
    "lastTime": "2026-04-20T10:20:00",
    "createdAt": "2026-04-20T10:00:00"
  }
]
```

返回说明：

- 按 `last_time` 倒序返回

### 5.2 搜索会话

- 方法：`GET`
- 路径：`/session/search`

查询参数：

- `userId`：`Long`，必填
- `keyword`：`String`，必填

成功响应：

```json
[
  {
    "id": 1,
    "sessionId": "s001",
    "userId": 1,
    "title": "什么是SpringBoot",
    "lastTime": "2026-04-20T10:20:00",
    "createdAt": "2026-04-20T10:00:00"
  }
]
```

返回说明：

- 搜索范围：`title`
- 按 `last_time` 倒序返回

### 5.3 删除会话

- 方法：`DELETE`
- 路径：`/session/{sessionId}`

路径参数：

- `sessionId`：会话 ID

查询参数：

- `userId`：`Long`，必填

示例：

```http
DELETE /session/s001?userId=1
```

成功响应：

```json
{
  "code": 200,
  "msg": "删除成功"
}
```

说明：

- 会同时删除 `chat_session` 和 `qa_record` 中当前 `userId + sessionId` 对应的数据
- 当前已按 `userId + sessionId` 控制删除范围
- 但仍未接入真正登录态鉴权

前端当前表现：

- 会话新建按钮文案为 `新建会话`
- 右侧聊天区顶部显示当前会话标题
- 删除会话和删除单条问答均使用统一的居中确认弹窗

## 6. 数据实体摘要

### 6.1 UserInfo

```json
{
  "id": 1,
  "username": "string",
  "passwordHash": "md5_string",
  "createdAt": "2026-04-20T10:00:00",
  "updatedAt": "2026-04-20T10:00:00"
}
```

### 6.2 QaRecord

```json
{
  "id": 1,
  "userId": 1,
  "sessionId": "s001",
  "question": "string",
  "answer": "string",
  "mode": "concise",
  "createTime": "2026-04-20T10:00:00"
}
```

### 6.3 ChatSession

```json
{
  "id": 1,
  "sessionId": "s001",
  "userId": 1,
  "title": "string",
  "lastTime": "2026-04-20T10:20:00",
  "createdAt": "2026-04-20T10:00:00"
}
```

## 7. 当前数据库对应关系

当前 SQL 初始化脚本与代码核对结论：

- `user_info` 对应 `UserInfo`
- `qa_record` 对应 `QaRecord`
- `chat_session` 对应 `ChatSession`
- `qa_record` 当前使用 `created_at` 作为问答时间字段

## 8. 风险提示

- `/chat/message/{id}` 仍存在越权删除风险
- 登录接口未做参数校验
- 密码使用 MD5 存储，安全性较弱
- 聊天发送接口使用 `GET` 提交问题，不利于长文本和日志安全
- 当前返回结构未统一，前端需要按接口分别处理
