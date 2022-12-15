#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#install.packages(c("devtools", "openai"))

#library(devtools)

#install_github("biochen4445/gptchatteR")

### Quickstart ###

library(gptchatteR)

chatter.auth("your ChatGPT API Key")

chatter.create()


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("iHi æµ·è?šå“¥"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            textInput( "index1",label = "??é??") ,
            actionButton("goButton", "??å??"),
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
      
      output$question <- renderText({
        paste("ä½ ç?„å?é?Œæ˜¯:",index2)
      })
      
      output$answer <- renderPrint({
        chatter.chat(index2)
      })
      
     output$plot <- renderPlot({
       # Create a test data frame
       library(tidyverse)
       rt <- rnorm(1000, mean=700, sd=100) # Generate RT data
       df <- tibble(RT = rt, group = rep(c("low", "high"), each=500))
       
       # Feed the data frame information to the chat session
       chatter.feed("I have a dataframe df")
       
       # Use the chatter.plot function to create a histogram
       cp <- chatter.plot(index2)
       
       # View the plot
       cp$plot
       
      })
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
