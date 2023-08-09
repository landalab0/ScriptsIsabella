library(tidyverse)
library(magrittr)
# Leer archivos -----------------------------------------------------------####
files <- dir(path = "Isabella/05.TonyAlgas/data/04.KofamScan/", 
             pattern = "*.txt")
final_files <- paste0("Isabella/05.TonyAlgas/data/04.KofamScan/", 
                      files)
# Tabla Kofam -------------------------------------------------------------####
table_Kofam <- final_files %>%
  map_dfr(read_table2, col_names = F) %>%
  filter(str_detect(X1, '\\*')) %>%
  select(X2, X3) %>%
  rename(Bin_name = X2) %>%
  rename(KO = X3) %>%
  separate(Bin_name, c("Bin_name", "Scaffold_name"), 
           sep = "[_|-][s|S]caffold") %>%
  mutate(Scaffold_name = paste0("scaffold", Scaffold_name),
         Scaffold_name) %>%
  unite("Scaffold_name", c("Bin_name", "Scaffold_name"), remove = FALSE) %>%
  group_by(Bin_name) %>%
  distinct() %>%
  count(KO) %>%
  rename(Abundance = n) %>%
  ungroup()
# Vectores de hidrocarburos ------------------------------------------------####
ruta<-c("", "")

table_Kofam %>%
  filter(KO %in% ruta4) %>%
  ggplot(aes(x = KO, y = Bin_name, size = Abundance,
             color=KO)) +
  geom_point(alpha = 0.5)
  

