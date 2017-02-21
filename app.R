# image recognition 
# using watson API- visual recognition (added) 


library(shinydashboard)
library(shiny)
library(cognizer)
source("fix.R") # function for directory fix credit Dean Attali


# Define UI for application that draws a histogram
ui <-  navbarPage(title = "Image Recognition App (with Watson) v0.3", 
                  
          tabPanel("Home",
                fluidRow(
                   column(width=4,
                          fileInput('file1', '',accept = c('.jpg','.jpeg','.png')),
                          imageOutput('outputImage')
                          ),
                   column(width=8,verbatimTextOutput("answer"), 
                          box(status = 'warning', solidHeader = T, 
                          helpText("Upload an image and Watson will interpret the results above :)" ,br(), "Inspired by Yuki Katoh's tensorflow App")))
                        
                   
                        )
                    ) # end of tabpanel 1 
                           ) # end of nav
                
                 
                 
    


server <- function(input, output) {
   
  
  
 image <- reactive({
   SERVICE_API_KEY_image = "Your-Own-API-Key"
   outfile <- input$file1
   fixUploadedFilesNames(outfile) # fix the file extension 
   # however, we need the directory to the image file that is temp stored for later use, so...
   newpath <- newpath # from function, we need to use for later 
   outputimage.answer <- image_classify(newpath, SERVICE_API_KEY_image)
 
  list = c(newpath = newpath, outputimage.answer = outputimage.answer )
 })

 
  
  output$answer <- renderPrint({
    if (is.null(input$file1)) {
      return()} else {
        str(image()$outputimage.answer)}
        })
 

  


  output$outputImage <- renderImage({
  
    if (is.null(input$file1)){
      return(NULL) 
    } else{
      outfile <- image()$newpath
      contentType <- input$file1$type
      #Uploaded file otherwise
    }
    
    list(src = outfile ,
         contentType=contentType,
         width=300)
  }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)

