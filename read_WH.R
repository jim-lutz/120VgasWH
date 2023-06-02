# read_WH.R
# reads the archived residential water heater data downloaded from 
# https://cacertappliances.energy.ca.gov/Pages/Search/AdvancedSearch.aspx

source("setup.R")
source("setup_wd.R")

# clean up the data file 
system2("./cleanCECdir.sh", "../ResidentialWaterHeatersExport_05302023043307.csv")

# read the data file
DT_CECWHs <- data.table(read_tsv("CECdir.tsv"))

# remove temporary file
system2("rm", "CECdir.tsv")

# clean up the names
# names(DT_CECWHs)
# see /data/CECWHs_varnames.ods
setnames(DT_CECWHs, old = 1:26, 
         new =c("mfr","brand","mod_num","reg","energy_source","minitank",
               "volume","other","input","heat_trap","ozone_insul","ozone_refrig",
               "mobile_home","WH_type","FHR","MaxGPM","RE","annual_elec",
               "annual_fuel","draw_pattern","UEF","UEF_std","pilot_light",
               "add_date","ref_num","mod_date"))

# save the data file
save(DT_CECWHs, file = paste0(wd_data,"/DT_CECWHs.Rdata"))

