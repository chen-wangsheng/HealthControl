基于对项目的探索，这是一个健康管理系统的Spring Boot 3.3.1项目，使用Java 17开发。

项目概述                                                                                                              
项目名称: HealthControl.springboot                                                                                      技术栈:
- Spring Boot 3.3.1
- Java 17
- MyBatis-Plus (ORM框架)
- MySQL 5.7+
- Lombok
- JWT认证
- Apache POI (Excel处理)

主要功能模块

从控制器分析，项目包含以下核心功能模块：

1. 用户管理 (AppUserController)

- 用户账号注册、登录、登出
- 用户信息管理（增删改查）
- 密码管理（找回、修改、重置）
- 用户数据导出

2. 健康知识管理 (HealthArticleController)

- 健康文章的分页查询
- 单个健康文章查询
- 健康文章的创建、编辑
- 健康文章的删除（单个和批量）

3. 运动参考管理 (SportController)

- 运动参考的分页查询
- 单个运动参考查询
- 运动参考的创建、编辑
- 运动参考的删除（单个和批量）

4. 其他功能模块（从文件结构推断）

- 饮食记录管理 (DietRecordController)
- 食物管理 (FoodController, FoodTypeController, FoodUnitController)
- 健康指标管理 (HealthIndicatorController)
- 运动记录管理 (SportRecordController)
- 收藏记录管理 (CollectRecordController)
- 健康通知管理 (HealthNoticeController)
- 消息通知管理 (MessageNoticeController)
- 点赞记录管理 (LikeRecordController)

项目特点

1. RESTful API设计: 使用标准的RESTful风格接口
2. 分层架构: 采用Controller-Service-Mapper的典型三层架构
3. 分页查询: 所有列表接口都支持分页
4. 数据导出: 支持Excel格式数据导出
5. JWT认证: 使用JWT进行用户认证
6. 文件上传: 支持大文件上传（最大10024MB）
7. 邮件功能: 集成QQ邮箱服务

配置信息

- 服务器: 运行在localhost:8080
- 数据库: MySQL 8.0+, 数据库名称gather_light
- 邮件服务: QQ邮箱 (chen_wangsheng@qq.com)
- 文件上传限制: 最大请求10GB，最大文件10GB

项目结构

src/main/java/com/example/web/
├── controller/      # 控制器层
├── dto/            # 数据传输对象
├── entity/         # 实体类
├── mapper/         # MyBatis Mapper接口
├── service/        # 服务层
└── tools/          # 工具类

这是一个完整的健康管理平台后端系统，提供了用户管理、健康知识、运动参考、饮食记录等多个健康相关的管理功能。