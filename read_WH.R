# read_WH.R
# reads the archived residential water heater data downloaded from 
# https://cacertappliances.energy.ca.gov/Pages/Search/AdvancedSearch.aspx

source("setup.R")
source("setup_wd.R")

# clean up the data file 
system2("./cleanCECdir.sh", "../ResidentialWaterHeatersExport_05302023043307.csv")

# read the data file
DT_CECWHs <- data.table(read_tsv("CECdir.tsv"))

# save the data file
save(DT_CECWHs, file = paste0(wd_data,"/DT_CECWHs.Rdata"))

# remove temporary file
system2("rm", "CECdir.tsv")
