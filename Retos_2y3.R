url = "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

library(rvest)
# Introducimos una dirección URL donde se encuentre una tabla

file <- read_html(url)    # Leemos el html
# Selecciona pedazos dentro del HTML para identificar la tabla

tables <- html_nodes(file, "table") 

tables

table1 <- html_table(tables, fill = TRUE)

table <- na.omit(as.data.frame(table1))

head(table)

FL2 <- gsub("[$),]", "",FL1)

head(FL2)

FL <- as.numeric(gsub("/mes","",FL2))

head(FL)
class(FL)

table$Sueldo <- FL

table$Sueldo

# Empresa que más paga y que menos paga

MP <- sort(FL, decreasing = T)[1]

mP <- sort(FL, decreasing = T)[20]

table[table$Sueldo == MP, ]

table[table$Sueldo == mP, ]

