# 个人健康管理系统UniApp小程序技术报告

## 一、项目概述

本项目是个人健康管理系统的移动端应用，基于UniApp + Vue3开发，支持微信小程序、H5等多端运行。为用户提供健康数据记录、饮食管理、运动追踪、AI健康分析等功能。

## 二、技术架构

### 2.1 核心技术栈

| 技术组件 | 版本 | 用途 |
|---------|------|------|
| UniApp | - | 跨平台框架 |
| Vue | 3.x | 前端框架 |
| Pinia | - | 状态管理 |
| uni-ui | - | UI组件库 |
| SCSS | - | CSS预处理器 |

### 2.2 支持平台

| 平台 | 支持状态 | 备注 |
|-----|---------|------|
| 微信小程序 | ✅ | 主要平台 |
| H5 | ✅ | 支持腾讯地图 |
| App（Android） | ✅ | 支持相机、定位等权限 |
| App（iOS） | ✅ | - |
| 支付宝小程序 | ✅ | - |
| 百度小程序 | ✅ | - |
| 字节小程序 | ✅ | - |

### 2.3 系统架构图

```
┌─────────────────────────────────────────────────────────────┐
│                      多端运行环境                            │
│    ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│    │ 微信小程序 │  │    H5    │  │ Android  │  │   iOS    │  │
│    └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     UniApp 应用层                            │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │    Pages    │  │ Components  │  │       Store         │  │
│  │   页面视图   │  │   公共组件   │  │      状态管理        │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │   Utils     │  │   Assets    │  │     uni_modules     │  │
│  │   工具函数   │  │   静态资源   │  │      扩展插件        │  │
│  └─────────────┘  └─────────────┘  └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                   Spring Boot 后端API                        │
└─────────────────────────────────────────────────────────────┘
```

## 三、项目结构

```
HealthControl.uniapp/
├── pages/                      # 页面目录
│   └── Front/                     # 前台页面（32个）
│       ├── Index.vue                 # 首页
│       ├── Login.vue                 # 登录
│       ├── Register.vue              # 注册
│       ├── UserCenter.vue            # 个人中心
│       ├── HealthIndicatorList.vue   # 健康指标列表
│       ├── DietRecordList.vue        # 饮食记录
│       ├── SportRecordList.vue       # 运动记录
│       ├── AiAnalyse.vue             # AI健康分析
│       └── ...
├── components/                 # 公共组件
│   ├── footer-bar/                # 底部导航栏
│   ├── upload-images/             # 图片上传
│   ├── upload-video/              # 视频上传
│   ├── upload-files/              # 文件上传
│   ├── rich-text-edit/            # 富文本编辑
│   ├── select-address/            # 地址选择
│   └── sigle-select/              # 单选组件
├── store/                      # 状态管理
│   └── index.js
├── utils/                      # 工具函数
│   ├── http.js                    # HTTP请求封装
│   └── cache.js                   # 缓存工具
├── assets/                     # 静态资源
├── uni_modules/                # uni-app扩展模块
├── App.vue                     # 根组件
├── main.js                     # 入口文件
├── pages.json                  # 页面配置
├── manifest.json               # 应用配置
└── uni.scss                    # 全局样式变量
```

## 四、页面功能模块

### 4.1 页面清单（32个）

| 页面 | 路径 | 功能描述 |
|-----|------|---------|
| Index | /pages/Front/Index | 首页，健康概览 |
| Login | /pages/Front/Login | 用户登录 |
| Register | /pages/Front/Register | 用户注册 |
| ForgetPassword | /pages/Front/ForgetPassword | 找回密码 |
| UserCenter | /pages/Front/UserCenter | 个人中心 |
| UserInfoEdit | /pages/Front/UserInfoEdit | 编辑个人信息 |
| PasswordEdit | /pages/Front/PasswordEdit | 修改密码 |
| WeChatBind | /pages/Front/WeChatBind | 微信绑定 |
| HealthIndicatorList | /pages/Front/HealthIndicatorList | 我的健康指标 |
| HealthIndicatorTypeList | /pages/Front/HealthIndicatorTypeList | 指标分类列表 |
| CommHealthIndicatorTypeList | /pages/Front/CommHealthIndicatorTypeList | 公共指标列表 |
| HealthIndicatorForm | /pages/Front/HealthIndicatorForm | 添加/编辑指标 |
| HealthIndicatorRecordList | /pages/Front/HealthIndicatorRecordList | 指标记录列表 |
| BatchRecordForm | /pages/Front/BatchRecordForm | 批量记录指标 |
| DietRecordList | /pages/Front/DietRecordList | 饮食记录列表 |
| FoodList | /pages/Front/FoodList | 食物列表 |
| SportRecordList | /pages/Front/SportRecordList | 运动记录列表 |
| SportList | /pages/Front/SportList | 运动项目列表 |
| HealthArticleList | /pages/Front/HealthArticleList | 健康知识列表 |
| HealthArticleDetail | /pages/Front/HealthArticleDetail | 知识详情 |
| MyHealthArticleList | /pages/Front/MyHealthArticleList | 我的文章 |
| HealthArticleForm | /pages/Front/HealthArticleForm | 发布文章 |
| RecipeList | /pages/Front/RecipeList | 食谱列表 |
| RecipeDetail | /pages/Front/RecipeDetail | 食谱详情 |
| MyRecipeList | /pages/Front/MyRecipeList | 我的食谱 |
| RecipeForm | /pages/Front/RecipeForm | 发布食谱 |
| CollectRecordList | /pages/Front/CollectRecordList | 我的收藏 |
| LikeRecordList | /pages/Front/LikeRecordList | 我的点赞 |
| HealthView | /pages/Front/HealthView | 健康视图 |
| AiAnalyse | /pages/Front/AiAnalyse | AI健康分析 |
| HealthNoticeList | /pages/Front/HealthNoticeList | 健康提醒列表 |
| HealthNoticeForm | /pages/Front/HealthNoticeForm | 添加提醒 |

### 4.2 底部导航栏

```javascript
FooterBarList: [
  { url: "/pages/Front/Index", label: "首 页", icon: HomeIcon },
  { url: "/pages/Front/HealthIndicatorList", label: "健康指标", icon: HealthIndicatorIcon },
  { url: "/pages/Front/UserCenter", label: "个人中心", icon: UserIcon },
]
```

## 五、核心技术实现

### 5.1 状态管理（Pinia）

```javascript
export const useCommonStore = defineStore("common", {
  state: () => ({
    Token: GetLoginToken(),
    UserInfo: null,
    RoleType: undefined,
    HasUserInfo: false,
    FooterBarList: [...],
  }),
  getters: {
    UserId: (state) => state.UserInfo?.Id,
  },
  actions: {
    async Login(UserInfo) {
      const res = await Post("/User/SignIn", UserInfo);
      if (res.Success) {
        this.Token = res.Data;
        SetLoginToken(res.Data);
      }
      return res;
    },
    async GetInfo() { /* 获取用户信息 */ },
    async Logout() {
      RemoveLoginToken();
      uni.reLaunch({ url: "/pages/Front/Login" });
      this.resetState();
    },
    CheckIsLogin() {
      if (!this.Token) {
        uni.reLaunch({ url: "/pages/Front/Login" });
        return false;
      }
      return true;
    },
  },
});
```

### 5.2 HTTP请求封装

```javascript
// 基础请求方法
export async function Post(url, data) {
  const token = GetLoginToken();
  const header = token ? { Authorization: `Bearer ${token}` } : {};
  
  return new Promise((resolve, reject) => {
    uni.request({
      url: baseUrl + url,
      data: data,
      method: "POST",
      header: header,
      success: (res) => {
        if (res.statusCode === 200) {
          resolve(res.data);
        } else {
          reject(res);
        }
      },
      fail: reject,
    });
  });
}

// 图片上传
export function Upload(filePath) {
  return new Promise((resolve) => {
    uni.uploadFile({
      url: baseUrl + "/File/BatchUpload",
      filePath: filePath,
      name: "file",
      success: (res) => resolve(JSON.parse(res.data)),
    });
  });
}
```

### 5.3 全局样式变量

```scss
page {
  /* 健康主题色 */
  --primary-color: #10b981;
  --primary-light: #34d399;
  --primary-dark: #065f46;
  
  /* 状态颜色 */
  --success-color: #10b981;
  --warning-color: #f59e0b;
  --error-color: #ef4444;
  
  /* 文本颜色 */
  --text-color: #374151;
  --text-color-light: #6b7280;
  
  /* 字体大小 */
  --font-size-sm: 24upx;
  --font-size-base: 28upx;
  --font-size-lg: 36upx;
  
  /* 间距 */
  --spacing-sm: 20upx;
  --spacing-base: 30upx;
  --spacing-lg: 50upx;
  
  /* 圆角 */
  --border-radius-base: 8upx;
  --border-radius-lg: 16upx;
}
```

## 六、公共组件

| 组件 | 目录 | 功能描述 |
|-----|------|---------|
| footer-bar | /components/footer-bar | 底部导航栏组件 |
| upload-images | /components/upload-images | 图片上传组件 |
| upload-video | /components/upload-video | 视频上传组件 |
| upload-files | /components/upload-files | 文件上传组件 |
| rich-text-edit | /components/rich-text-edit | 富文本编辑器 |
| select-address | /components/select-address | 地址选择器 |
| sigle-select | /components/sigle-select | 单选选择器 |

## 七、首页功能设计

### 7.1 页面结构

```
┌─────────────────────────────────────┐
│           顶部导航栏                 │
├─────────────────────────────────────┤
│           欢迎横幅                   │
│     "您好，欢迎回来！"               │
├─────────────────────────────────────┤
│        今日健康概览                  │
│  ┌─────┐  ┌─────┐  ┌─────┐  ┌─────┐│
│  │体温  │  │血压  │  │血糖  │  │体重  ││
│  │36.5℃│  │120  │  │5.2  │  │65kg ││
│  └─────┘  └─────┘  └─────┘  └─────┘│
├─────────────────────────────────────┤
│          快捷功能                    │
│  📊健康记录  📈健康视图  🤖AI分析    │
│  🍎饮食记录  🏃运动记录  ⏰健康提醒  │
│  📖健康知识  🥗健康食谱              │
├─────────────────────────────────────┤
│          健康资讯                    │
│  - 科学饮食搭配...                   │
│  - 有氧运动的健康益处...             │
├─────────────────────────────────────┤
│           底部导航栏                 │
│    首页    健康指标    个人中心      │
└─────────────────────────────────────┘
```

### 7.2 核心功能

- 今日健康数据概览（支持Swiper分页）
- 异常指标高亮提示
- 8个快捷功能入口
- 健康资讯推荐（按浏览量排序）

## 八、微信小程序配置

### 8.1 manifest.json配置

```json
{
  "mp-weixin": {
    "appid": "wx16309bbce9569a02",
    "setting": {
      "urlCheck": false
    },
    "permission": {
      "scope.userLocation": {
        "desc": "你的位置信息将用于小程序位置接口的效果展示"
      }
    },
    "requiredPrivateInfos": ["getLocation", "chooseLocation"]
  },
  "vueVersion": "3"
}
```

### 8.2 H5地图配置

```json
{
  "h5": {
    "sdkConfigs": {
      "maps": {
        "qqmap": {
          "key": "R33BZ-DISK4-4J7UB-D3JHM-GQA3E-V6BBF"
        }
      }
    }
  }
}
```

## 九、Android权限配置

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
<uses-permission android:name="android.permission.READ_PHONE_STATE"/>
<uses-permission android:name="android.permission.WRITE_SETTINGS"/>
<uses-permission android:name="android.permission.FLASHLIGHT"/>
<uses-permission android:name="android.permission.VIBRATE"/>
```

## 十、开发与部署

### 10.1 开发环境

```bash
# 使用HBuilderX开发
# 或使用CLI

# 运行到微信小程序
npm run dev:mp-weixin

# 运行到H5
npm run dev:h5

# 运行到App
npm run dev:app
```

### 10.2 构建发布

```bash
# 构建微信小程序
npm run build:mp-weixin

# 构建H5
npm run build:h5

# 构建App
npm run build:app
```

### 10.3 环境变量

```bash
# .env
VITE_API_BASE_URL=http://localhost:7245
```

## 十一、项目特点

1. 基于UniApp，一套代码多端运行
2. Vue3 Composition API，代码简洁
3. 健康主题UI设计，绿色清新
4. 完善的CSS变量系统，易于定制
5. 丰富的工具类样式，开发高效
6. 支持微信登录绑定
7. AI智能健康分析功能
8. 响应式布局，适配多种屏幕

---

文档版本：v1.0  
编写日期：2026年1月23日
