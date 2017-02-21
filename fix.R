# function to fix uploaded file extension.
# since uploaded file will be temp stored to some location
# with file stored as "0", we need to rename the file extension
#
# 2 input: dataframe of file input i.e input$file1
# 2 output: change file extension, newpath as the directory path to the temp stored file


fixUploadedFilesNames <- function(x) {
  if (is.null(x)) {
    return()
  }
  
  oldNames = x$datapath
  newNames = file.path(dirname(x$datapath),
                       x$name)
  file.rename(from = oldNames, to = newNames)
  newpath <<- newNames 
  

}