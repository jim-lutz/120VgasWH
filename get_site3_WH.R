# get_site3_WH.R
# try to find the pre-existing WH from site 3 in the CEC WH directory

source("setup.R")
source("setup_wd.R")

# info from site 3 label 
# see '../Site 3 Gas WH.jpg'
site03 <- data.table(
  mod_num  = "SG50T12AVG00",
  volume   = 50,
  input    = 40000,
  gas_type = "Natural",
  mfg_date = lubridate::my("12/2008"),
  mfr      = "Rheem Sales Company, Inc."
  )

# open the CEC WH directory
load(paste0(wd_data,"/DT_CECWHs.Rdata"))

str(DT_CECWHs)

# grep("Rheem",unique(DT_CECWHs$mfr), value = TRUE)
# [1] "Rheem Sales Company, Inc."

# just Rheem
DT_Rheem <- DT_CECWHs[mfr==site03$mfr]
nrow(DT_Rheem)
# [1] 6801

# what types of water heaters
unique(DT_Rheem$WH_type)
[1] "Instantaneous gas-fired" "Gas-fired storage"       "Electric storage"       
[4] "Grid-enabled"  

# just "Gas-fired storage"
DT_Rheem <- DT_Rheem[WH_type=="Gas-fired storage"]
nrow(DT_Rheem)
# [1] 3465

# what sizes?
sort(unique(DT_Rheem$volume))
#  [1] 28 29 37 38 39 40 46 47 48 50 55

# just 50 gallon
DT_Rheem <- DT_Rheem[volume==50]
nrow(DT_Rheem)
# [1] 64

# we've got a problem
unique(DT_Rheem$RE)
# [1] 94

unique(DT_Rheem$UEF)
# [1] 0.88

# These are values for "Electric storage", not "Gas-fired storage"

summary(DT_CECWHs[WH_type=="Gas-fired storage"]$RE)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 72.00   77.00   78.00   78.13   79.00   98.00 
# that looks better

summary(DT_CECWHs[WH_type=="Gas-fired storage" &
                  mfr=="Rheem Sales Company, Inc."  ]$RE)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 72.00   75.00   77.00   78.36   80.00   97.00 

DT_CECWHs[WH_type=="Gas-fired storage",
          list(
            maxRE=max(RE),
            minRE=min(RE),
            n=length(RE)),
          by=mfr]
#                                                 mfr maxRE minRE    n
#  1:                          A.O. Smith Corporation    82    73  395
#  2:               A.O. Smith Water Products Company    92    73 4108
#  3:                       HTP Comfort Solutions LLC    98    97    5
#  4:                       American Water Heater Co.    92    73 1238
#  5:                      Bradford White Corporation    82    73 3676
#  6:                           Giant Factories, Inc.    81    75  674
#  7:                                 Lochinvar, LLC.    82    73  103
#  8:                       Rheem Sales Company, Inc.    97    72 3465
#  9: A.O. Smith Corporation (American Water Heaters)    82    73  123
# 10:                  GE Appliances, a Haier company    77    74   56

