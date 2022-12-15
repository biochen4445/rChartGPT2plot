# rChartGPT2plot
這是一個利用ChatGPT幫你用R畫圖的小工具

**參考來源為 https://github.com/isinaltinkaya/gptchatteR**

### 需要先取得 chatGPT　API　key
- 請先註冊帳號 https://openai.com/blog/chatgpt/ 
- 點擊API頁面登入   
![image](https://user-images.githubusercontent.com/22020125/207771835-6d646195-0103-4ea3-9178-d375b8e1c486.png)
- 到帳號(Personal)設定 點擊 View API KEYs    
![image](https://user-images.githubusercontent.com/22020125/207772232-77724d6e-8ca8-4302-9c80-248580b27b93.png)
- 產生API KEY   
![image](https://user-images.githubusercontent.com/22020125/207772362-c12eea47-f98f-4212-909b-ef1d094d2f48.png)
- 複製API KEY到app.R 

### 安裝環境
- 安裝devtools
    
install.packages(c("devtools", "openai")    
library(devtools)

- 從Github安裝套件   

install_github("biochen4445/gptchatteR")

### 執行app
- 打開app.R 
- run app
