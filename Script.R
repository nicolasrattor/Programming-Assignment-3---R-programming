

## Programming Assignment 3
# R Programming

# Nicolás Ratto


#### load / install packages ####

packages = c("tidyverse", "lubridate","ggplot2","data.table","ggpubr","kableExtra")

## Now load or install & load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)



#### download data ####

download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip", 
              "ProgAssignment3-data.zip", method = "libcurl")

# unzip de data
unzip(zipfile = "ProgAssignment3-data.zip", exdir = getwd())



#### Load data ####

hosp<-read.csv("hospital-data.csv")
str(hosp)

#### 1 Plot the 30-day mortality rates for heart attack ####

base <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(base)

base[, 11] <- as.numeric(base[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(base[, 11])


#### 2 Finding the best hospital in a state ####

str(base)

source("best.R")

best("TX", "heart attack")
## "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")
## "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart attack")
## "JOHNS HOPKINS HOSPITAL, THE"

best("MD", "pneumonia")
#"GREATER BALTIMORE MEDICAL CENTER"

best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state

best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome



#### 3 Ranking hospitals by outcome in a state  ####


























