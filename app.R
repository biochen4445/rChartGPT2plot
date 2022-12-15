#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


#install.packages(c("devtools", "openai"))
#library(devtools)
#install_github("biochen4445/gptchatteR")

### Quickstart ###

library(shiny)
library(gptchatteR)

#輸入API key
chatter.auth("your ChatGPT API Key")

#呼叫功能
chatter.create()

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("海豚哥"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            textInput( "index1",label = "輸入問題(例如: plot of rt and group using ggplot with df") ,
            actionButton("goButton", "發問"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
          textOutput("question"),
          textOutput("answer"),
          plotOutput("plot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  observeEvent(
    input$goButton,{
      index2 <- as.character(input$index1)
      
      #顯示問題
      output$question <- renderText({
        paste("你的問題是:",index2)
      })
      
      #產生答案
      output$answer <- renderPrint({
        chatter.chat(index2)
      })
      
     #產生圖檔
     output$plot <- renderPlot({
       # 建立資料集
       library(tidyverse)
       rt <- rnorm(1000, mean=700, sd=100)
       df <- tibble(RT = rt, group = rep(c("low", "high"), each=500))
       
       # 把資料集餵入ChatGPT
       chatter.feed("I have a dataframe df")
       
       # 取得返回值並畫圖
       cp <- chatter.plot(index2)
       
       # 顯示圖
       cp$plot
       
      })
  })
}

# 執行Shiny程式
shinyApp(ui = ui, server = server)
