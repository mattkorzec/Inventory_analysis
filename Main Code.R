##########################################################################################
# Setting up R.
##########################################################################################

# Clear all data
rm(list=ls())

# Load packages
library(tidyverse)
library(lubridate)
library(readxl)
library(xlsx)

# Set file path to desktop
setwd("C:/Users/mkorzec/Downloads")

##########################################################################################
# Cleaning up and combining the sales data.
##########################################################################################

list_of_files <- list.files(pattern = "^4-16")

data7 <- list_of_files %>%
  setNames(nm = c("fl121", "fl123", "il071", "il082", "il088", "in048", "mo046")) %>%
  map_df(read_xlsx, .id = "Dealership") %>%
  select('AON or VIN', 'MY', 'Model', 'Color', 'MSRP', 'Dealer Cost', 'Finance Type',
         'Transaction Date', 'SRC', 'Dealership') %>%
  replace_na(list(SRC = 'Okay')) %>%
  filter(SRC == 'Okay') %>%
  select(-(SRC)) %>%
  rename(Year = MY, VIN = 'AON or VIN') %>%
  separate(Color, into = c("Exterior", "Interior", "Seat"), sep = " / ") %>%
  mutate(Dealership = toupper(Dealership))

# Change codes into names
data7$Model[data7$Model == '17412F45'] = "Accent LE"
data7$Model[data7$Model == '28402F45'] = "Sonata SE"
data7$Model[data7$Model == '284H2F4P'] = "Sonata SE"
data7$Model[data7$Model == '284J2F4P'] = "Sonata SEL"
data7$Model[data7$Model == '284K2F4P'] = "Sonata Sport"
data7$Model[data7$Model == '284L2F4P'] = "Sonata Limited"
data7$Model[data7$Model == '284M2F45'] = "Sonata Limited 2.0T"
data7$Model[data7$Model == '48412F45'] = "Elantra SE"
data7$Model[data7$Model == '48422F45'] = "Elantra Value Edition"
data7$Model[data7$Model == '48442F45'] = "Elantra SEL"
data7$Model[data7$Model == '48462F45'] = "Elantra Limited"
data7$Model[data7$Model == '64402A45'] = "Santa_FE SE 2.4 AWD"
data7$Model[data7$Model == '64402F4S'] = "Santa_FE SE 2.4 FWD"
data7$Model[data7$Model == '64422A45'] = "Santa_FE SEL 2.4 AWD"
data7$Model[data7$Model == '64422F4S'] = "Santa_FE SEL 2.4 FWD"
data7$Model[data7$Model == '64472A45'] = "Santa_FE Ultimate 2.4 AWD"
data7$Model[data7$Model == '64482A45'] = "Santa_FE Limited 2.0T AWD"
data7$Model[data7$Model == '84412A45'] = "Tucson SE AWD"
data7$Model[data7$Model == '84412F45'] = "Tucson SE FWD"
data7$Model[data7$Model == '844A2F45'] = "Tucson VALUE FWD"
data7$Model[data7$Model == '844B2F45'] = "Tucson SEL FWD"
data7$Model[data7$Model == '844B2F4S'] = "Tucson SEL FWD"
data7$Model[data7$Model == '844D2A45'] = "Tucson Sport FWD"
data7$Model[data7$Model == '844G2A45'] = "Tucson Limited AWD"
data7$Model[data7$Model == '844H2A45'] = "Tucson Unlimited AWD"
data7$Model[data7$Model == 'D2542F45'] = "Elantra GT SPORT A/T"
data7$Model[data7$Model == 'F1353F45'] = "Veloster N"
data7$Model[data7$Model == 'Q0422F45'] = "Kona SEL FWD"
data7$Model[data7$Model == 'Q0452A45'] = "Kona Limited AWD"
data7$Model[data7$Model == '64492A45'] = "Santa_FE Ultimate 2.0T AWD"
data7$Model[data7$Model == '64462F45'] = "Santa_FE Limited 2.4 FWD"
data7$Model[data7$Model == '28472F45'] = "Sonata Limited"
data7$Model[data7$Model == '844B2A45'] = "Tucson SEL AWD"
data7$Model[data7$Model == 'J0412F65'] = "Santa_FE XL SE FWD"
data7$Model[data7$Model == 'J0482A65'] = "Santa_FE LTD ULT AWD"
data7$Model[data7$Model == 'N0502F4S'] = "IONIQ_Hybrid Blue"
data7$Model[data7$Model == 'N0522F4S'] = "IONIQ_Hybrid SEL"
data7$Model[data7$Model == 'N0542F4S'] = "IONIQ_Hybrid Limited"
data7$Model[data7$Model == 'G1402F45'] = "Sonata Hybrid SE"
data7$Model[data7$Model == 'B2402A65'] = "G80 AWD 3.8"
data7$Model[data7$Model == 'F1322F45'] = "Veloster 2.0 Premium"
data7$Model[data7$Model == '17442F45'] = "Accent SEL"
data7$Model[data7$Model == '64442F45'] = "Santa_FE SEL PLUS 2.4 FWD"
data7$Model[data7$Model == '64442A45'] = "Santa_FE SEL PLUS 2.4 AWD"
data7$Model[data7$Model == '64492A45'] = "Santa_FE Ultimate 2.0T AWD"
data7$Model[data7$Model == '64482F45'] = "Santa_FE Limited 2.0T FWD"
data7$Model[data7$Model == '64472F45'] = "Santa_FE Ultimate 2.4 FWD"
data7$Model[data7$Model == '64462A45'] = "Santa_FE Limited 2.4 AWD"
data7$Model[data7$Model == '47442F45'] = "Elantra SEL"
data7$Model[data7$Model == '47422F45'] = "Elantra Value Edition"
data7$Model[data7$Model == '284G2F45'] = "Sonata Limited 2.0T"
data7$Model[data7$Model == '64492F45'] = "Santa_FE Ultimate 2.0T FWD"
data7$Model[data7$Model == '284B2F45'] = "Sonata SEL"
data7$Model[data7$Model == '284E2F45'] = "Sonata Sport"
data7$Model[data7$Model == '284F2F45'] = "Sonata Limited"
data7$Model[data7$Model == '844E2A45'] = "Tucson VALUE AWD"
data7$Model[data7$Model == '844C2F45'] = "Tucson SEL PLUS FWD"
data7$Model[data7$Model == 'Q0402F45'] = "Kona SE FWD"
data7$Model[data7$Model == 'Q0432F45'] = "Kona SEL FWD - Contrast Roof"
data7$Model[data7$Model == '844E2F45'] = "Tucson VALUE FWD"
data7$Model[data7$Model == '48413F45'] = "Elantra M/T"
data7$Model[data7$Model == '844H2F4S'] = "Tucson Ultimate FWD"
data7$Model[data7$Model == '844D2F4S'] = "Tucson Sport FWD"
data7$Model[data7$Model == '844A2A45'] = "Tucson Value AWD"
data7$Model[data7$Model == 'Q0422A45'] = "Kona SEL AWD"
data7$Model[data7$Model == 'Q0472A45'] = "Kona Ultimate AWD"
data7$Model[data7$Model == 'J0412A65'] = "Santa_FE XL SE AWD"
data7$Model[data7$Model == 'J0482F65'] = "Santa_FE XL LTD ULT FWD"
data7$Model[data7$Model == 'J0422A65'] = "Santa_FE SE ULT AWD"
data7$Model[data7$Model == 'P0542F4P'] = "IONIQ_Hybrid Plug-In Limited"
data7$Model[data7$Model == 'G1432F45'] = "Sonata Hybrid Limited"
data7$Model[data7$Model == 'D2522F45'] = "Elantra GT A/T"
data7$Model[data7$Model == 'F1302F45'] = "Veloster 2.0"
data7$Model[data7$Model == 'F1362F45'] = "Veloster Turbo"
data7$Model[data7$Model == 'Q0452F45'] = "Kona Limited FWD"
data7$Model[data7$Model == 'Q0472F45'] = "Kona Ultimate FWD"
data7$Model[data7$Model == '63462F45'] = "Santa_FE Sport 2.0T ULT FWD"
data7$Model[data7$Model == '28432F45'] = "Sonata Sport 2.0T"
data7$Model[data7$Model == '284C2F45'] = "Sonata Sport"
data7$Model[data7$Model == '284F2F4P'] = "Sonata Limited"
data7$Model[data7$Model == '284D2F45'] = "Sonata SEL"
data7$Model[data7$Model == '844G2F45'] = "Tucson Limited FWD"
data7$Model[data7$Model == 'J0422F65'] = "Santa_FE SE ULT FWD"
data7$Model[data7$Model == '48472F45'] = "Elantra Sport"
data7$Model[data7$Model == 'B2432R65'] = "G80 RWD 3.3T Sport"
data7$Model[data7$Model == 'F1303F45'] = "Veloster 2.0 M/T"
data7$Model[data7$Model == 'F1343F45'] = "Veloster R-SPEC"
data7$Model[data7$Model == 'F1383F45'] = "Veloster Turbo Ultimate M/T"
data7$Model[data7$Model == 'F1382F45'] = "Veloster Turbo Ultimate"
data7$Model[data7$Model == '28492F45'] = "Sonata ECO"
data7$Model[data7$Model == '844F2A45'] = "Tucson Night AWD"
data7$Model[data7$Model == '844G2F4S'] = "Tucson Limited FWD"
data7$Model[data7$Model == 'B2402R65'] = "G80 RWD 3.8"
data7$Model[data7$Model == '17462F45'] = "Accent Limited"
data7$Model[data7$Model == '284D2F4P'] = "Sonata SEL SULEV"
data7$Model[data7$Model == '844F2F4S'] = "Tucson Night FWD"
data7$Model[data7$Model == '48432F45'] = "Elantra ECO"
data7$Model[data7$Model == '17413F45'] = "Accent SE M/T"
data7$Model[data7$Model == 'Q0402A45'] = 'Kona SE AWD'
data7$Model[data7$Model == '47412F45'] = 'Elantra SE'
data7$Model[data7$Model == '28452F45'] = 'Sonata Limited 2.0T'
data7$Model[data7$Model == 'B2452R85'] = 'G80 RWD 5.0 Ultimate'
data7$Model[data7$Model == 'Q0492A45'] = 'Kona Iron Man Edition AWD'


# Change Exterior Names
data7$Exterior[data7$Exterior == 'U4G'] = "GRAY"
data7$Exterior[data7$Exterior == 'R4R'] = "RED"
data7$Exterior[data7$Exterior == 'W4Y'] = "BEIGE"
data7$Exterior[data7$Exterior == '4SS'] = "SILVER"
data7$Exterior[data7$Exterior == 'ABP'] = "BLACK"
data7$Exterior[data7$Exterior == 'B2R'] = "BLUE"
data7$Exterior[data7$Exterior == 'S3B'] = "BLACK"
data7$Exterior[data7$Exterior == 'WW8'] = "WHITE"
data7$Exterior[data7$Exterior == 'Y2B'] = "BROWN"
data7$Exterior[data7$Exterior == 'ST2'] = "BLUE"
data7$Exterior[data7$Exterior == 'R2F'] = "RAINFOREST"
data7$Exterior[data7$Exterior == 'S2C'] = "GRAY"
data7$Exterior[data7$Exterior == 'PR3'] = "RED"
data7$Exterior[data7$Exterior == 'YR2'] = "ORANGE"
data7$Exterior[data7$Exterior == '2C'] = "GRAY"
data7$Exterior[data7$Exterior == 'Y8'] = "SILVER"
data7$Exterior[data7$Exterior == 'S3'] = "BLACK"
data7$Exterior[data7$Exterior == 'VU'] = "BLUE"
data7$Exterior[data7$Exterior == 'W8'] = "WHITE"
data7$Exterior[data7$Exterior == 'PR'] = "RED"
data7$Exterior[data7$Exterior == 'US'] = "BLUE"
data7$Exterior[data7$Exterior == 'NKA'] = "BLACK"
data7$Exterior[data7$Exterior == 'PDW'] = "WHITE"
data7$Exterior[data7$Exterior == 'M8N'] = "BROWN"
data7$Exterior[data7$Exterior == 'T8T'] = "SILVER"
data7$Exterior[data7$Exterior == 'TW3'] = "WHITE"
data7$Exterior[data7$Exterior == 'R5R'] = "RED"
data7$Exterior[data7$Exterior == 'Z5G'] = "GRAY"
data7$Exterior[data7$Exterior == 'XB3'] = "BLUE"
data7$Exterior[data7$Exterior == 'MZH'] = "BLACK"
data7$Exterior[data7$Exterior == 'Z3U'] = "BLUE"
data7$Exterior[data7$Exterior == 'P6W'] = "WHITE"
data7$Exterior[data7$Exterior == 'YG7'] = "GRAY"
data7$Exterior[data7$Exterior == 'YAC'] = "WHITE"
data7$Exterior[data7$Exterior == 'RB5'] = "BLACK"
data7$Exterior[data7$Exterior == 'P2S'] = "IRON FROST"
data7$Exterior[data7$Exterior == 'M8S'] = "SILVER"
data7$Exterior[data7$Exterior == 'YT3'] = "GRAY"
data7$Exterior[data7$Exterior == 'N9V'] = "SILVER"
data7$Exterior[data7$Exterior == 'N5M'] = "GRAY"
data7$Exterior[data7$Exterior == 'Y8S'] = "SILVER"
data7$Exterior[data7$Exterior == 'R2U'] = "BLUE"
data7$Exterior[data7$Exterior == 'R5U'] = "BLUE"
data7$Exterior[data7$Exterior == 'Y2R'] = "RED"
data7$Exterior[data7$Exterior == 'SS7'] = "SILVER"
data7$Exterior[data7$Exterior == 'SS1'] = "SILVER"
data7$Exterior[data7$Exterior == 'Y21'] = "RED"
data7$Exterior[data7$Exterior == 'W9Y'] = "LIME"
data7$Exterior[data7$Exterior == 'T8S'] = "SILVER"
data7$Exterior[data7$Exterior == 'WAW'] = "WHITE"
data7$Exterior[data7$Exterior == 'YP5'] = "BLUE"
data7$Exterior[data7$Exterior == 'UYS'] = "GRAY"
data7$Exterior[data7$Exterior == 'WC9'] = "WHITE"
data7$Exterior[data7$Exterior == 'NU9'] = "BLUE"
data7$Exterior[data7$Exterior == 'U9G'] = "GRAY"
data7$Exterior[data7$Exterior == 'SWP'] = "WHITE"
data7$Exterior[data7$Exterior == 'TA9'] = "ORANGE"
data7$Exterior[data7$Exterior == 'MFR'] = "RED"
data7$Exterior[data7$Exterior == 'TU9'] = "BLUE"
data7$Exterior[data7$Exterior == 'T5K'] = "BLACK"
data7$Exterior[data7$Exterior == 'YW6'] = "WHITE"
data7$Exterior[data7$Exterior == 'YB6'] = "BLACK"
data7$Exterior[data7$Exterior == 'W9U'] = "GRAY"
data7$Exterior[data7$Exterior == 'N4B'] = "BLUE"
data7$Exterior[data7$Exterior == 'YN9'] = "BROWN"
data7$Exterior[data7$Exterior == 'PR2'] = "RED"
data7$Exterior[data7$Exterior == 'MJB'] = "BLACK"
data7$Exterior[data7$Exterior == 'WT'] = "BEIGE"
data7$Exterior[data7$Exterior == 'Y6S'] = "SILVER"
data7$Exterior[data7$Exterior == 'RTR'] = "GRAY"
data7$Exterior[data7$Exterior == 'V9R'] = "RED"
data7$Exterior[data7$Exterior == 'SFB'] = "BLUE"


# Change Interior Names
data7$Interior[data7$Interior == 'TRY'] = "BLACK"
data7$Interior[data7$Interior == 'XUG'] = "BEIGE"
data7$Interior[data7$Interior == 'YPJ'] = "GRAY"
data7$Interior[data7$Interior == 'NN1'] = "BLACK"
data7$Interior[data7$Interior == 'UUE'] = "BEIGE"
data7$Interior[data7$Interior == 'C1'] = "BLACK"
data7$Interior[data7$Interior == 'P1'] = "GRAY"
data7$Interior[data7$Interior == 'CT'] = "BLACK"
data7$Interior[data7$Interior == 'GG'] = "GRAY"
data7$Interior[data7$Interior == 'BB'] = "BEIGE"
data7$Interior[data7$Interior == 'TGG'] = "GRAY"
data7$Interior[data7$Interior == 'YAK'] = "BEIGE"
data7$Interior[data7$Interior == 'LGY'] = "BLACK"
data7$Interior[data7$Interior == 'X1'] = "BEIGE"
data7$Interior[data7$Interior == 'NNB'] = "BLACK"
data7$Interior[data7$Interior == 'VYN'] = "BEIGE"
data7$Interior[data7$Interior == 'RYN'] = "BLACK"
data7$Interior[data7$Interior == 'VFG'] = "GRAY"
data7$Interior[data7$Interior == 'YGE'] = "BEIGE"
data7$Interior[data7$Interior == 'T9Y'] = "BLACK"
data7$Interior[data7$Interior == 'RRY'] = "BLACK"
data7$Interior[data7$Interior == 'PK'] = "GRAY"
data7$Interior[data7$Interior == 'TR1'] = "BLACK"
data7$Interior[data7$Interior == 'PPB'] = "BEIGE"
data7$Interior[data7$Interior == 'PGG'] = "GRAY"
data7$Interior[data7$Interior == 'SG2'] = "BLACK"
data7$Interior[data7$Interior == 'RJS'] = "GRAY"
data7$Interior[data7$Interior == 'XA'] = "BEIGE"
data7$Interior[data7$Interior == 'PKG'] = "GRAY"

# Change seat names
data7$Seat[data7$Seat == 'BLACK W/ LIME'] = "BLACK"

final <- data7 %>% separate(Model, into = c("Model", "Trim"), sep = " ", extra = "merge") 

# Export the new data into an Excel
final <- as.data.frame(final)

write.xlsx(final, file = "2019_Hyundai_Sales_Report.xlsx", 
           sheetName = "Raw Data", 
           row.names = FALSE, 
           append = FALSE)

##########################################################################################
# Cleaning and setting up the inventory data.
##########################################################################################

# Read Excel Workbook file
fl123 <- read_xlsx("fl123-inventory.xlsx")
fl121 <- read_xlsx("fl121-inventory.xlsx")
il071 <- read_xlsx("il071-inventory.xlsx")
il082 <- read_xlsx("il082-inventory.xlsx")
il088 <- read_xlsx("il088-inventory.xlsx")
in048 <- read_xlsx("in048-inventory.xlsx")
mo046 <- read_xlsx("mo046-inventory.xlsx")

# Add dealership columns
fl123$Dealership <- 'FL123'
fl121$Dealership <- 'FL121'
il071$Dealership <- 'IL071'
il082$Dealership <- 'IL082'
il088$Dealership <- 'IL088'
in048$Dealership <- 'IN048'
mo046$Dealership <- 'MO046'

# Combine all inventories
inv <- rbind(fl121, fl123, il071, il082, il088, in048, mo046)

c <- inv %>%
  filter(str_detect(Series, "^20")) %>%
  mutate_if(is.character, str_replace_all, pattern = 'SANTA FE', replacement = 'SANTA_FE') %>%
  mutate_if(is.character, str_replace_all, pattern = 'IONIQ HYBRID', replacement = 'IONIQ_HYBRID') %>%
  select('Series', 'Avg Mth Sales', 'Dealer Stock', 'D/S', 'ETA in 30 Days', 'ETA in 60 Days', 'ETA in 60+ Days',
         'Total Avail', 'Dealership') %>%
  separate(Series, into = c("Year", "Code", "Model", "Trim"), sep = " ", extra = "merge") %>%
  select(-(Code)) %>%
  rename(Average = 'Avg Mth Sales', Total = 'Total Avail') %>%
  mutate(Average = as.numeric(Average), Total = as.numeric(Total)) %>%
  mutate(Expected_Sales = (Average*3)) %>%
  mutate(Recommended = (Expected_Sales - Total)) %>%
  mutate(Recommended = ceiling(Recommended)) %>%
  rename('Days In Stock' = 'D/S', '30 Days' = 'ETA in 30 Days', '60 Days' = 'ETA in 60 Days', 
         'Over 60 Days' = 'ETA in 60+ Days',
         'Expected Sales (3 Months)' = Expected_Sales, 'Recommended Order' = Recommended) %>%
  mutate(Warning = case_when(Year > 2018 & Total == 0 ~ 'None In Stock or Transit', 
                             Year < 2019 ~ 'Older Model',
                             TRUE ~ ""))

new <- as.data.frame(c)

write.xlsx(new, file = "2019_Hyundai_Sales_Report.xlsx", 
           sheetName = "Inventory", 
           row.names = FALSE, 
           append = TRUE)

##########################################################################################
# Preparing DDS and MDS data from vAuto
##########################################################################################

# Clear all data
rm(list=ls())

# Read all data
il071 <- read_xlsx("vauto_il071.xlsx")
il082 <- read_xlsx("vauto_il082.xlsx")
il088 <- read_xlsx("vauto_il088.xlsx")
in048 <- read_xlsx("vauto_in048.xlsx")
mo046 <- read_xlsx("vauto_mo046.xlsx")
fl123 <- read_xlsx("vauto_fl123.xlsx")

# add Dealership Columns
fl121 <- fl121 %>% add_column(Dealership = 'FL121')
fl123 <- fl123 %>% add_column(Dealership = 'FL123')
il071 <- il071 %>% add_column(Dealership = 'IL071')
il082 <- il082 %>% add_column(Dealership = 'IL082')
il088 <- il088 %>% add_column(Dealership = 'IL088')
in048 <- in048 %>% add_column(Dealership = 'IN048')
mo046 <- mo046 %>% add_column(Dealership = 'MO046')

# bind all dealership inventories together
vauto <- rbind(fl123, il071, il082, il088, in048, mo046)

# Clean up the data
x <- vauto %>%
  separate(Description, into = c("Type", "Model", "Trim"), sep = " > ", extra = "drop") %>%
  select(-c(`Pricing Rules`, Action, `Min Stock`, `Target Day Supply`)) %>%
  rename(Year = 'Model Year', Active = '# Active', Sold = '# Sold', DDS = 'Dlr Day Supply',
         MDS = 'Mkt Day Supply') %>%
  filter(is.na(Trim)) %>%
  filter(Type != '---') %>%
  filter(!is.na(Model)) %>%
  select(-(Trim)) %>%
  filter(Type == 'SUV' | Type == 'Car')

# Export to Excel
x <- as.data.frame(x)

write.xlsx(x, file = "2019_Hyundai_Sales_Report.xlsx", 
           sheetName = "vAuto", 
           row.names = FALSE, 
           append = TRUE)

##########################################################################################
# Summarizing the profits.
##########################################################################################

# Clear all data
rm(list=ls())

# Read Excel Workbook file
in048 <- read_xls("DailyLogSheetFull.xls", sheet = "F&I Daily Log Sheet", skip = 3)
fl123 <- read_xls("DailyLogSheetFull.xls", sheet = "F&I Daily Log Sheet (3)", skip = 3)
il071 <- read_xls("DailyLogSheetFull.xls", sheet = "F&I Daily Log Sheet (4)", skip = 3)
mo046 <- read_xls("DailyLogSheetFull.xls", sheet = "F&I Daily Log Sheet (5)", skip = 3)
il088 <- read_xls("DailyLogSheetFull.xls", sheet = "F&I Daily Log Sheet (6)", skip = 3)
il082 <- read_xls("DailyLogSheetFull.xls", sheet = "F&I Daily Log Sheet (7)", skip = 3)
fl121 <- read_xls("DailyLogSheetFull.xls", sheet = "F&I Daily Log Sheet (8)", skip = 3)

# Add dealership columns
fl123$Dealership <- 'FL123'
fl123 <- fl123[,-20]

fl121$Dealership <- 'FL121'
fl121 <- fl121[,-20]

il071$Dealership <- 'IL071'
il071 <- il071[,-20]

il082$Dealership <- 'IL082'
il082 <- il082[,-20]

il088$Dealership <- 'IL088'
il088 <- il088[,-20]

in048$Dealership <- 'IN048'
in048 <- in048[,-20]

mo046$Dealership <- 'MO046'
mo046 <- mo046[,-20]

data <- rbind(fl121, fl123, il071, il082, il088, in048, mo046)

data <- data[, c(1,15,25,26,27,28,31)]

data2 <- data %>%
  mutate_if(is.character, str_replace_all, pattern = 'SANTA FE', replacement = 'SANTA_FE') %>%
  separate(VEHICLE, into = c("VEHICLE", "YEAR"), sep = (-4)) %>%
  separate(VEHICLE, into = c("Make", "Model"), sep = " ", extra = "merge") %>%
  filter(Make == "HYUNDAI" | Make == "GENESIS") %>%
  mutate_if(is.character, str_replace_all, pattern = 'GENESIS G80', replacement = 'G80') %>%
  mutate_if(is.character, str_replace_all, pattern = 'GENESIS G90', replacement = 'G90') %>%
  mutate_if(is.character, str_replace_all, pattern = 'IONIC', replacement = 'IONIQ') %>%
  separate(Model, into = 'Model', sep = " ", extra = "drop") %>%
  filter(Model != ".G80")

data2 <- as.data.frame(data2)

write.xlsx(data2, file = "2019_Hyundai_Sales_Report.xlsx", 
           sheetName = "Raw Profits", 
           row.names = FALSE, 
           append = TRUE)