library(shiny)
library(tidyverse)
library(DT)

#bcl <- read.csv("https://raw.githubusercontent.com/owid/owid-datasets/master/datasets/Alcohol%20consumption%20in%20USA%20since%201850%20—%20NIAAA/Alcohol%20consumption%20in%20USA%20since%201850%20—%20NIAAA.csv")
bcl <- read.csv("./Alcohol consumption in USA since 1850 — NIAAA.csv")

ui <- fluidPage(
  titlePanel("Alcohol Consumption Statistics"),
  sidebarPanel(
    # select year range
    sliderInput("yearRange", "Select Year Range", 
                min = min(bcl$Year), max = max(bcl$Year), 
                value = c(min(bcl$Year), max(bcl$Year))),
    downloadButton("downloadData", "Download Selected Year Range Data")
  ),
  mainPanel(DT::dataTableOutput("dataTabletry"),
            DT::dataTableOutput("dataTable"),
            plotOutput("yearPlot"),
            ),
  
)
server <- function(input, output) {
  dataToDisplay <- reactiveVal(bcl)

  # display the dataset, and the user could sort the variables by clicking the heading of table
  output$dataTabletry <- DT::renderDataTable({
    dataToDisplay() %>%
      filter(Year >= input$yearRange[1] & Year <= input$yearRange[2])
  }, options = list(ordering = TRUE)) # Enable column-based ordering
  
  # displaying the total alcohol consumption of selected year range
  output$yearPlot <- renderPlot({
    filteredData <- dataToDisplay() %>% 
      filter(Year >= input$yearRange[1] & Year <= input$yearRange[2])
    ggplot(filteredData, aes(x = Year, y = All.beverages..NIAAA.)) + 
      geom_line() + 
      labs(title = "Total Alcohol Consumption Over Selected Years", x = "Year", y = "All Beverages")+
      theme(plot.title = element_text(size = 20))
  })
  
  # enabling download of selected range
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      filteredData <- dataToDisplay() %>%
        filter(Year >= input$yearRange[1] & Year <= input$yearRange[2])
      write.csv(filteredData, file, row.names = FALSE)
    }
  )
  
}
shinyApp(ui = ui, server = server)