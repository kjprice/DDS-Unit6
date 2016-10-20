# Read the data into R
Bronx <- read.csv("../data/rollingsales_brooklyn_Bronx.csv")

#check the data
head (Bronx)
summary (Bronx)
str(Bronx)

#Changed sale price and square footage variables to numeric and not a factor for analyses
SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", Bronx$SALE.PRICE))
GROSS.SQUARE.FEET.N <- as.numeric(gsub("[^[:digit:]]","", Bronx$GROSS.SQUARE.FEET))
LAND.SQUARE.FEET.N <- as.numeric(gsub("[^[:digit:]]","", Bronx$LAND.SQUARE.FEET))

#Made all variable names lower case
names(Bronx) <- tolower(names(Bronx)) 

#Checked the data for outliers
boxplot(sale.price.n) 
boxplot(gross.square.feet.n)

# Data was heavily skewed so log transformed sale price and gross square feet
salepricelog <- log(sale.price.n) 
grosssqftlog <- log(gross.square.feet.n)  

#Checked the data again for outliers
boxplot (salepricelog)
boxplot (grosssqftlog)  

#Removed outliers from the log transformed sale price and boxplot 
salepricelog.outliersR <- salepricelog[salepricelog > 12 & salepricelog < 15] 
grosssqftlogoutliersR <- grosssqftlog [grosssqftlog > 7 & grosssqftlog < 8.8] 

#Ran histogram for the log transformed sale price and boxplot. 
hist (salepricelog.outliersR)
hist (grosssqftlogoutliersR) 

