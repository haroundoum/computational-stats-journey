library(tidyverse)
set.seed(2026)

farms <- tibble(
  farm_id       = paste0("F", sprintf("%02d", 1:10)),
  district      = c("Bugesera","Bugesera","Kayonza","Kayonza","Huye",
                    "Huye","Musanze","Musanze","Gasabo","Gasabo"),
  crop          = c("Maize","Beans","Maize","Rice","Maize",
                    "Beans","Rice","Maize","Beans","Rice"),
  area_ha       = c(1.2, 0.8, 2.0, 1.5, 1.0, 1.3, 1.1, 2.2, 0.9, 1.6),
  yield_tons    = c(3.5, 1.4, 5.8, 4.2, NA, 3.9, 3.0, 6.1, NA, 4.4),
  fertilizer_kg = c(100, 80, 150, 120, 90, 110, NA, 160, 70, 130)
)
farms

#task1
glimpse(farms)
summary(farms)
colSums(is.na(farms)) 

#task2
farms %>% filter(area_ha>1) %>% arrange(desc(area_ha)) %>% select(farm_id,district,area_ha) 

#task3
farms %>% group_by(district) %>% summarise(avgyield = mean(yield_tons,na.rm = TRUE))

farms %>% group_by(crop) %>% summarise(avgyield = mean(yield_tons,na.rm=TRUE))

#task4 
farms %>% mutate(yield_per_ha = yield_tons/area_ha, size_class = case_when(area_ha > 1.5 ~ "Large", area_ha > 1 ~ "Medium", TRUE~"Small")) %>% select(farm_id,yield_per_ha,size_class)

#task5
farms %>% drop_na() %>% nrow()

farms %>% drop_na() %>% summarise(avgyield=mean(yield_tons), medyield=median(yield_tons))

farms %>% mutate(yield_tons = replace_na(yield_tons,mean(yield_tons,na.rm=TRUE))) %>% select(yield_tons)

price <- tibble(crop = c("Maize","Beans","Rice"), price_per_ton = c(280,450,520))
price

farms %>% left_join(price, by = "crop") %>% mutate(revenue = price_per_ton*yield_tons) %>% select(crop,price_per_ton,yield_tons,revenue)
