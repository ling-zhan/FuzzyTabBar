# FuzzyTabBar

![avatar](/preview01.png)
![avatar](/preview02.png)
<br />
![avatar](/preview03.png)
![avatar](/preview04.png)

一個模糊背景樣式的 TabBar
  - 可定義選擇的顏色
  - 可依帶進的 Items 標題變更顯示樣式

### 版本要求
  -  Xcode 13
  -  iOS 15 以上

### 安裝
在 Xcode 中:
  - 到 **File > Swift Packages > Add Package Dependency**
  - 然後貼上 github 網址：https://github.com/ling-zhan/FuzzyTabBar
  - 接下來按 **Next > Branch: master > Next > Finish**
  - 成功的把套件匯進你的專案了
   
 ### 如何使用
  - 匯入 FuzzyTabBar
  - 使用 FuzzyTabBar 創建 TabBar

### 例子
```sh

import FuzzyTabBar

```

### 生成 TabBarItem
```sh
//  帶標題
let itemData:[TabBarItem]  = [
    TabBarItem(icon: "house.fill", foregroundColor: Color("TextColor"), title: "title1", tag: 0, isBadge: true),
    TabBarItem(icon: "house.fill", foregroundColor: Color("TextColor"), title: "title2", tag: 1, isBadge: false),
    TabBarItem(icon: "house.fill", foregroundColor: Color("TextColor"), title: "title3", tag: 2, isBadge: false),
]

// 沒帶標題
let itemData:[TabBarItem]  = [
    TabBarItem(icon: "house.fill", foregroundColor: Color("TextColor"), tag: 0, isBadge: true),
    TabBarItem(icon: "house.fill", foregroundColor: Color("TextColor"), tag: 1, isBadge: false),
    TabBarItem(icon: "house.fill", foregroundColor: Color("TextColor"), tag: 2, isBadge: false),
]

```

### 使用 TabBar
```sh

 // Tab bar 預設選擇顏色
 VStack {
    Spacer()
    FuzzyTabBar(action: { selectedTag in
        tabBarItems[selectedTag].isBadge = false
    }, tabbarItems: $tabBarItems)
 }.edgesIgnoringSafeArea(.bottom)
 
 ```
 
### 使用 TabBar
```sh
  // Tab bar 自定選擇顏色
 VStack {
    Spacer()
    FuzzyTabBar(action: { selectedTag in
        tabBarItems[selectedTag].isBadge = false
    }, tabbarItems: $tabBarItems, selectedBarColor: .blue)
 }.edgesIgnoringSafeArea(.bottom)
 
```

完整範例檔 [FuzzyTabBarDemo](https://github.com/ling-zhan/FuzzyTabBarDemo) 

 ### 授權
MIT

