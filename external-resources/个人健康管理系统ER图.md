# 个人健康管理系统ER图（实体关系图）

本文档展示系统数据库的实体关系模型，用于毕业设计论文的数据库设计章节。

---

## 一、系统总体ER图

```
┌─────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                        个人健康管理系统ER图                                          │
├─────────────────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                                     │
│                                         ┌─────────────┐                                             │
│                                         │             │                                             │
│                                         │    用户     │                                             │
│                                         │  (AppUser)  │                                             │
│                                         │             │                                             │
│                                         └──────┬──────┘                                             │
│                                                │                                                    │
│                 ┌──────────────┬───────────────┼───────────────┬──────────────┐                    │
│                 │              │               │               │              │                    │
│                 │ 1:N          │ 1:N           │ 1:N           │ 1:N          │ 1:N                │
│                 ▼              ▼               ▼               ▼              ▼                    │
│          ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐               │
│          │  健康指标  │  │  饮食记录  │  │  运动记录  │  │  健康知识  │  │  健康食谱  │               │
│          │  记录      │  │           │  │           │  │  (发布)   │  │  (发布)   │               │
│          └─────┬─────┘  └─────┬─────┘  └─────┬─────┘  └─────┬─────┘  └───────────┘               │
│                │              │              │              │                                      │
│                │ N:1          │ N:1          │ N:1          │ N:1                                  │
│                ▼              ▼              ▼              ▼                                      │
│          ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐                               │
│          │  健康指标  │  │   食物    │  │   运动    │  │ 知识分类  │                               │
│          └─────┬─────┘  └─────┬─────┘  └─────┬─────┘  └───────────┘                               │
│                │              │              │                                                     │
│                │ N:1          │ N:1          │ 1:N                                                 │
│                ▼              ▼              ▼                                                     │
│          ┌───────────┐  ┌───────────┐  ┌───────────┐                                              │
│          │ 指标分类  │  │ 食物分类  │  │ 运动单位  │                                              │
│          └───────────┘  └─────┬─────┘  └───────────┘                                              │
│                               │                                                                    │
│                               │ 1:N                                                                │
│                               ▼                                                                    │
│                         ┌───────────┐                                                              │
│                         │ 食物单位  │                                                              │
│                         └───────────┘                                                              │
│                                                                                                     │
│   ┌─────────────────────────────────────────────────────────────────────────────────────────────┐  │
│   │                                      用户互动关系                                            │  │
│   ├─────────────────────────────────────────────────────────────────────────────────────────────┤  │
│   │                                                                                             │  │
│   │      ┌─────────────┐              ┌─────────────┐              ┌─────────────┐             │  │
│   │      │             │              │             │              │             │             │  │
│   │      │  收藏记录   │              │  点赞记录   │              │  消息通知   │             │  │
│   │      │             │              │             │              │             │             │  │
│   │      └──────┬──────┘              └──────┬──────┘              └──────┬──────┘             │  │
│   │             │                            │                            │                    │  │
│   │             │ N:1                        │ N:1                        │ N:1                │  │
│   │             ▼                            ▼                            ▼                    │  │
│   │      ┌─────────────┐              ┌─────────────┐              ┌─────────────┐             │  │
│   │      │    用户     │              │    用户     │              │    用户     │             │  │
│   │      └─────────────┘              └─────────────┘              └─────────────┘             │  │
│   │                                                                                             │  │
│   └─────────────────────────────────────────────────────────────────────────────────────────────┘  │
│                                                                                                     │
└─────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 二、核心实体ER图（详细版）

### 2.1 用户模块ER图

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              用户模块ER图                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│                          ┌─────────────────────┐                            │
│                          │      AppUser        │                            │
│                          │       用户表        │                            │
│                          ├─────────────────────┤                            │
│                          │ PK  Id              │                            │
│                          │     UserName        │                            │
│                          │     Password        │                            │
│                          │     Email           │                            │
│                          │     Name            │                            │
│                          │     PhoneNumber     │                            │
│                          │     Birth           │                            │
│                          │     Gender          │                            │
│                          │     ImageUrls       │                            │
│                          │     RoleType        │                            │
│                          │     OpenId          │                            │
│                          │     CreationTime    │                            │
│                          └──────────┬──────────┘                            │
│                                     │                                       │
│           ┌─────────────────────────┼─────────────────────────┐             │
│           │                         │                         │             │
│           │ 1:N                     │ 1:N                     │ 1:N         │
│           ▼                         ▼                         ▼             │
│  ┌─────────────────┐      ┌─────────────────┐      ┌─────────────────┐     │
│  │ MessageNotice   │      │ HealthNotice    │      │ CollectRecord   │     │
│  │   消息通知表     │      │   健康提醒表    │      │   收藏记录表     │     │
│  ├─────────────────┤      ├─────────────────┤      ├─────────────────┤     │
│  │ PK  Id          │      │ PK  Id          │      │ PK  Id          │     │
│  │ FK  UserId      │      │ FK  BelongUserId│      │ FK  CollectUser │     │
│  │     Content     │      │     Title       │      │     Id          │     │
│  │     IsRead      │      │     Content     │      │     CollectType │     │
│  │     CreationTime│      │     NoticeTime  │      │     RelativeId  │     │
│  └─────────────────┘      │     RepeatType  │      │     CreationTime│     │
│                           │     CreationTime│      └─────────────────┘     │
│                           └─────────────────┘                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 2.2 健康指标模块ER图

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            健康指标模块ER图                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────┐                           ┌─────────────────┐          │
│  │HealthIndicator │                           │HealthIndicator │          │
│  │     Type       │                           │     指标表      │          │
│  │   指标分类表    │                           ├─────────────────┤          │
│  ├─────────────────┤         N:1              │ PK  Id          │          │
│  │ PK  Id          │◄────────────────────────│ FK  HealthIndica│          │
│  │     Name        │                           │     torTypeId   │          │
│  │     Sort        │                           │ FK  BelongUserId│          │
│  │     CreationTime│                           │     Name        │          │
│  └─────────────────┘                           │     Content     │          │
│                                                │     Cover       │          │
│                                                │     IsComm      │          │
│  ┌─────────────────┐                           │     Threshold   │          │
│  │    AppUser      │         N:1              │     CreationTime│          │
│  │     用户表      │◄────────────────────────└────────┬────────┘          │
│  └─────────────────┘                                   │                    │
│                                                        │ 1:N                │
│                                                        ▼                    │
│                                           ┌─────────────────────┐           │
│                                           │HealthIndicatorRecord│           │
│                                           │     指标记录表       │           │
│  ┌─────────────────┐                      ├─────────────────────┤           │
│  │    AppUser      │        N:1           │ PK  Id              │           │
│  │     用户表      │◄────────────────────│ FK  HealthIndicator │           │
│  └─────────────────┘                      │     Id              │           │
│                                           │ FK  RecordUserId    │           │
│                                           │     RecordValue     │           │
│                                           │     RecordTime      │           │
│                                           │     IsAbnormity     │           │
│                                           │     CreationTime    │           │
│                                           └─────────────────────┘           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 2.3 饮食管理模块ER图

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            饮食管理模块ER图                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────┐                                                        │
│  │    FoodType     │                                                        │
│  │   食物分类表    │                                                        │
│  ├─────────────────┤                                                        │
│  │ PK  Id          │                                                        │
│  │     Name        │                                                        │
│  │     Sort        │                                                        │
│  │     CreationTime│                                                        │
│  └────────┬────────┘                                                        │
│           │                                                                 │
│           │ 1:N                                                             │
│           ▼                                                                 │
│  ┌─────────────────┐                           ┌─────────────────┐          │
│  │      Food       │                           │    FoodUnit     │          │
│  │     食物表      │          1:N              │   食物单位表    │          │
│  ├─────────────────┤─────────────────────────►├─────────────────┤          │
│  │ PK  Id          │                           │ PK  Id          │          │
│  │ FK  FoodTypeId  │                           │ FK  FoodId      │          │
│  │     Name        │                           │     UnitName    │          │
│  │     Cover       │                           │     UnitValue   │          │
│  │     Calories    │                           │     CreationTime│          │
│  │     Protein     │                           └────────┬────────┘          │
│  │     Carbohydra  │                                    │                   │
│  │     tes         │                                    │                   │
│  │     Fat         │                                    │                   │
│  │     CreationTime│                                    │                   │
│  └────────┬────────┘                                    │                   │
│           │                                             │                   │
│           │ 1:N                                         │ 1:N               │
│           │                                             │                   │
│           │         ┌─────────────────────┐             │                   │
│           │         │     DietRecord      │             │                   │
│           │         │     饮食记录表      │             │                   │
│           │         ├─────────────────────┤             │                   │
│           └────────►│ PK  Id              │◄────────────┘                   │
│                     │ FK  FoodId          │                                 │
│                     │ FK  FoodUnitId      │                                 │
│  ┌─────────────────┐│ FK  RecordUserId    │                                 │
│  │    AppUser      ││     RecordValue     │                                 │
│  │     用户表      ││     RecordTime      │                                 │
│  └────────┬────────┘│     CreationTime    │                                 │
│           │         └─────────────────────┘                                 │
│           │ 1:N              ▲                                              │
│           └──────────────────┘                                              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 2.4 运动管理模块ER图

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            运动管理模块ER图                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────┐                           ┌─────────────────┐          │
│  │      Sport      │                           │    SportUnit    │          │
│  │     运动表      │          1:N              │   运动单位表    │          │
│  ├─────────────────┤─────────────────────────►├─────────────────┤          │
│  │ PK  Id          │                           │ PK  Id          │          │
│  │     Name        │                           │ FK  SportId     │          │
│  │     Cover       │                           │     UnitName    │          │
│  │     CreationTime│                           │     UnitValue   │          │
│  └────────┬────────┘                           │     CreationTime│          │
│           │                                    └────────┬────────┘          │
│           │                                             │                   │
│           │ 1:N                                         │ 1:N               │
│           │                                             │                   │
│           │         ┌─────────────────────┐             │                   │
│           │         │    SportRecord      │             │                   │
│           │         │    运动记录表       │             │                   │
│           │         ├─────────────────────┤             │                   │
│           └────────►│ PK  Id              │◄────────────┘                   │
│                     │ FK  SportId         │                                 │
│                     │ FK  SportUnitId     │                                 │
│  ┌─────────────────┐│ FK  RecordUserId    │                                 │
│  │    AppUser      ││     RecordValue     │                                 │
│  │     用户表      ││     RecordTime      │                                 │
│  └────────┬────────┘│     CreationTime    │                                 │
│           │         └─────────────────────┘                                 │
│           │ 1:N              ▲                                              │
│           └──────────────────┘                                              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 2.5 内容管理模块ER图

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            内容管理模块ER图                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────┐                           ┌─────────────────┐          │
│  │HealthArticle   │                           │HealthArticle   │          │
│  │     Type       │                           │   健康知识表    │          │
│  │  知识分类表    │                           ├─────────────────┤          │
│  ├─────────────────┤         N:1              │ PK  Id          │          │
│  │ PK  Id          │◄────────────────────────│ FK  HealthArticle│          │
│  │     Name        │                           │     TypeId      │          │
│  │     Sort        │                           │ FK  PublishUser │          │
│  │     CreationTime│                           │     Id          │          │
│  └─────────────────┘                           │ FK  AuditUserId │          │
│                                                │     Title       │          │
│                                                │     Cover       │          │
│  ┌─────────────────┐                           │     Content     │          │
│  │    AppUser      │         N:1              │     ViewCount   │          │
│  │   用户(发布者)  │◄────────────────────────│     AuditStatus │          │
│  └─────────────────┘                           │     AuditTime   │          │
│                                                │     AuditReply  │          │
│  ┌─────────────────┐                           │     CreationTime│          │
│  │    AppUser      │         N:1              └─────────────────┘          │
│  │   用户(审核者)  │◄────────────────────────────────┘                     │
│  └─────────────────┘                                                        │
│                                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                             │
│  ┌─────────────────┐                           ┌─────────────────┐          │
│  │    AppUser      │                           │     Recipe      │          │
│  │   用户(发布者)  │          N:1              │    食谱表       │          │
│  └────────┬────────┘◄────────────────────────├─────────────────┤          │
│           │                                    │ PK  Id          │          │
│           │                                    │ FK  PublishUser │          │
│           │                                    │     Id          │          │
│           │                                    │ FK  AuditUserId │          │
│           │                                    │     Title       │          │
│           │                                    │     Cover       │          │
│           │                                    │     Content     │          │
│           │                                    │     ViewCount   │          │
│           │                                    │     AuditStatus │          │
│           │                                    │     AuditTime   │          │
│           │                                    │     AuditReply  │          │
│           │                                    │     CreationTime│          │
│           │                                    └─────────────────┘          │
│           │                                             ▲                   │
│           │                                             │ N:1               │
│  ┌────────┴────────┐                                    │                   │
│  │    AppUser      │────────────────────────────────────┘                   │
│  │   用户(审核者)  │                                                        │
│  └─────────────────┘                                                        │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 2.6 互动记录模块ER图

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            互动记录模块ER图                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│                          ┌─────────────────────┐                            │
│                          │      AppUser        │                            │
│                          │       用户表        │                            │
│                          └──────────┬──────────┘                            │
│                                     │                                       │
│                    ┌────────────────┼────────────────┐                      │
│                    │                │                │                      │
│                    │ 1:N            │ 1:N            │ 1:N                  │
│                    ▼                ▼                ▼                      │
│           ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐      │
│           │  CollectRecord  │ │   LikeRecord    │ │ MessageNotice   │      │
│           │    收藏记录表   │ │   点赞记录表    │ │   消息通知表    │      │
│           ├─────────────────┤ ├─────────────────┤ ├─────────────────┤      │
│           │ PK  Id          │ │ PK  Id          │ │ PK  Id          │      │
│           │ FK  CollectUser │ │ FK  LikeUserId  │ │ FK  UserId      │      │
│           │     Id          │ │     LikeType    │ │     Content     │      │
│           │     CollectType │ │     RelativeId  │ │     IsRead      │      │
│           │     RelativeId  │ │     CreationTime│ │     CreationTime│      │
│           │     CreationTime│ └─────────────────┘ └─────────────────┘      │
│           └─────────────────┘                                               │
│                    │                                                        │
│                    │ 关联资源                                               │
│                    ▼                                                        │
│           ┌─────────────────────────────────────────────────────┐          │
│           │              可收藏/点赞的资源                       │          │
│           ├─────────────────────────────────────────────────────┤          │
│           │  · HealthArticle (健康知识)  CollectType='健康知识' │          │
│           │  · Recipe (食谱)             CollectType='食谱'     │          │
│           └─────────────────────────────────────────────────────┘          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 三、完整实体属性表

### 3.1 用户表 (AppUser)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 用户主键 |
| UserName | VARCHAR(20) | | 账号 |
| Password | VARCHAR(60) | | 密码(MD5) |
| Email | VARCHAR(128) | | 邮箱 |
| Name | VARCHAR(128) | | 名称 |
| PhoneNumber | VARCHAR(20) | | 手机号码 |
| Birth | DATETIME | | 出生年月 |
| Gender | VARCHAR(10) | | 性别 |
| ImageUrls | VARCHAR(128) | | 头像 |
| RoleType | INT | | 角色(1管理员/2用户) |
| OpenId | VARCHAR(128) | | 微信OpenId |
| CreationTime | DATETIME | | 创建时间 |

### 3.2 健康指标分类表 (HealthIndicatorType)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 分类主键 |
| Name | VARCHAR(128) | | 分类名称 |
| Sort | INT | | 显示顺序 |
| CreationTime | DATETIME | | 创建时间 |

### 3.3 健康指标表 (HealthIndicator)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 指标主键 |
| Name | VARCHAR(128) | | 指标名称 |
| BelongUserId | INT | FK | 所属用户 |
| HealthIndicatorTypeId | INT | FK | 指标分类 |
| Content | LONGTEXT | | 描述内容 |
| Cover | VARCHAR(128) | | 封面图 |
| IsComm | TINYINT(1) | | 是否公用 |
| Threshold | VARCHAR(128) | | 阈值范围 |
| CreationTime | DATETIME | | 创建时间 |

### 3.4 健康指标记录表 (HealthIndicatorRecord)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 记录主键 |
| HealthIndicatorId | INT | FK | 健康指标 |
| RecordUserId | INT | FK | 记录用户 |
| RecordValue | DOUBLE | | 记录值 |
| RecordTime | DATETIME | | 记录时间 |
| IsAbnormity | VARCHAR(10) | | 是否异常(Y/N) |
| CreationTime | DATETIME | | 创建时间 |

### 3.5 食物分类表 (FoodType)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 分类主键 |
| Name | VARCHAR(128) | | 分类名称 |
| Sort | INT | | 显示顺序 |
| CreationTime | DATETIME | | 创建时间 |

### 3.6 食物表 (Food)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 食物主键 |
| Name | VARCHAR(128) | | 食物名称 |
| FoodTypeId | INT | FK | 食物分类 |
| Cover | VARCHAR(128) | | 封面图 |
| Calories | DOUBLE | | 热量(kcal/100g) |
| Protein | DOUBLE | | 蛋白质(g/100g) |
| Carbohydrates | DOUBLE | | 碳水化合物(g/100g) |
| Fat | DOUBLE | | 脂肪(g/100g) |
| CreationTime | DATETIME | | 创建时间 |

### 3.7 食物单位表 (FoodUnit)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 单位主键 |
| FoodId | INT | FK | 所属食物 |
| UnitName | VARCHAR(128) | | 单位名称 |
| UnitValue | INT | | 单位值(克) |
| CreationTime | DATETIME | | 创建时间 |

### 3.8 饮食记录表 (DietRecord)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 记录主键 |
| FoodId | INT | FK | 食物 |
| FoodUnitId | INT | FK | 食物单位 |
| RecordUserId | INT | FK | 记录用户 |
| RecordValue | INT | | 数量 |
| RecordTime | DATETIME | | 记录时间 |
| CreationTime | DATETIME | | 创建时间 |

### 3.9 运动表 (Sport)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 运动主键 |
| Name | VARCHAR(128) | | 运动名称 |
| Cover | VARCHAR(128) | | 封面图 |
| CreationTime | DATETIME | | 创建时间 |

### 3.10 运动单位表 (SportUnit)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 单位主键 |
| SportId | INT | FK | 所属运动 |
| UnitName | VARCHAR(128) | | 单位名称 |
| UnitValue | DOUBLE | | 热量值(kcal) |
| CreationTime | DATETIME | | 创建时间 |

### 3.11 运动记录表 (SportRecord)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 记录主键 |
| SportId | INT | FK | 运动项目 |
| SportUnitId | INT | FK | 运动单位 |
| RecordUserId | INT | FK | 记录用户 |
| RecordValue | INT | | 运动量 |
| RecordTime | DATETIME | | 记录时间 |
| CreationTime | DATETIME | | 创建时间 |

### 3.12 健康知识分类表 (HealthArticleType)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 分类主键 |
| Name | VARCHAR(128) | | 分类名称 |
| Sort | INT | | 显示顺序 |
| CreationTime | DATETIME | | 创建时间 |

### 3.13 健康知识表 (HealthArticle)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 文章主键 |
| Title | VARCHAR(128) | | 标题 |
| HealthArticleTypeId | INT | FK | 分类 |
| PublishUserId | INT | FK | 发布人 |
| AuditUserId | INT | FK | 审核人 |
| Cover | VARCHAR(128) | | 封面图 |
| Content | LONGTEXT | | 内容 |
| ViewCount | INT | | 浏览量 |
| AuditStatus | INT | | 审核状态(1待审/2通过/3拒绝) |
| AuditTime | DATETIME | | 审核时间 |
| AuditReply | VARCHAR(255) | | 审核回复 |
| CreationTime | DATETIME | | 创建时间 |

### 3.14 食谱表 (Recipe)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 食谱主键 |
| Title | VARCHAR(128) | | 标题 |
| PublishUserId | INT | FK | 发布人 |
| AuditUserId | INT | FK | 审核人 |
| Cover | VARCHAR(128) | | 封面图 |
| Content | LONGTEXT | | 内容 |
| ViewCount | INT | | 浏览量 |
| AuditStatus | INT | | 审核状态 |
| AuditTime | DATETIME | | 审核时间 |
| AuditReply | VARCHAR(255) | | 审核回复 |
| CreationTime | DATETIME | | 创建时间 |

### 3.15 收藏记录表 (CollectRecord)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 收藏主键 |
| CollectUserId | INT | FK | 收藏用户 |
| CollectType | VARCHAR(128) | | 收藏类型 |
| RelativeId | INT | | 关联资源Id |
| CreationTime | DATETIME | | 创建时间 |

### 3.16 点赞记录表 (LikeRecord)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 点赞主键 |
| LikeUserId | INT | FK | 点赞用户 |
| LikeType | VARCHAR(128) | | 点赞类型 |
| RelativeId | INT | | 关联资源Id |
| CreationTime | DATETIME | | 创建时间 |

### 3.17 健康提醒表 (HealthNotice)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 提醒主键 |
| BelongUserId | INT | FK | 所属用户 |
| Title | VARCHAR(128) | | 提醒标题 |
| Content | LONGTEXT | | 提醒内容 |
| NoticeTime | DATETIME | | 提醒时间 |
| RepeatType | VARCHAR(50) | | 重复类型 |
| CreationTime | DATETIME | | 创建时间 |

### 3.18 消息通知表 (MessageNotice)

| 字段名 | 数据类型 | 约束 | 说明 |
|-------|---------|------|------|
| Id | INT | PK, AUTO_INCREMENT | 消息主键 |
| UserId | INT | FK | 用户 |
| Content | LONGTEXT | | 消息内容 |
| IsRead | TINYINT(1) | | 是否已读 |
| CreationTime | DATETIME | | 创建时间 |

---

## 四、实体关系汇总表

| 实体1 | 关系 | 实体2 | 说明 |
|------|------|------|------|
| AppUser | 1:N | HealthIndicator | 用户拥有多个健康指标 |
| AppUser | 1:N | HealthIndicatorRecord | 用户有多条指标记录 |
| AppUser | 1:N | DietRecord | 用户有多条饮食记录 |
| AppUser | 1:N | SportRecord | 用户有多条运动记录 |
| AppUser | 1:N | HealthArticle | 用户发布多篇文章 |
| AppUser | 1:N | Recipe | 用户发布多个食谱 |
| AppUser | 1:N | CollectRecord | 用户有多条收藏 |
| AppUser | 1:N | LikeRecord | 用户有多条点赞 |
| AppUser | 1:N | HealthNotice | 用户有多个提醒 |
| AppUser | 1:N | MessageNotice | 用户有多条消息 |
| HealthIndicatorType | 1:N | HealthIndicator | 分类包含多个指标 |
| HealthIndicator | 1:N | HealthIndicatorRecord | 指标有多条记录 |
| FoodType | 1:N | Food | 分类包含多种食物 |
| Food | 1:N | FoodUnit | 食物有多个单位 |
| Food | 1:N | DietRecord | 食物被多次记录 |
| FoodUnit | 1:N | DietRecord | 单位被多次使用 |
| Sport | 1:N | SportUnit | 运动有多个单位 |
| Sport | 1:N | SportRecord | 运动被多次记录 |
| SportUnit | 1:N | SportRecord | 单位被多次使用 |
| HealthArticleType | 1:N | HealthArticle | 分类包含多篇文章 |

---

文档版本：v1.0  
编写日期：2026年1月23日
