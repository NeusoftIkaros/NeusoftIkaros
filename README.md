# NeusoftIkaros
The main repo for NeusoftIkaros.

NeusoftIkaros的主代码仓库。

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

**说明: **
- 如果你使用 GitHub Release 中已经打包好的后端 `jar`，通常不需要再单独下载 Maven 依赖
- 如果你使用 GitHub Release 中已经打包好的前端 `dist`，通常不需要再执行 `npm install` 下载前端依赖
- 只有在你从源码启动或自行重新打包时，才需要下载对应依赖

#### 创建数据库
项目已提供 [neusoft_ikaros.sql](https://github.com/NeusoftIkaros/NeusoftIkaros/blob/main/neusoft_ikaros.sql)，下载后运行
```sql
mysql -u root -p < [sql文件路径]
```
