data
data$superorder
data[,c("superorder", "body.mass")]
data[1:5, 6]
data[,2]
data[-(1:20),]

data[4, "body.mass"] <- NA
is.na(data$body.mass)
data[is.na(data$body.mass), "habitat"]

mylioraji <- subset(data, data$family == "Rajidae"| 
                      data$ == "Myliobatidae")
mylioraji

write.csv(mylioraji, file = "output.csv")

subset(data, data$family %in% 
         c("Rajidae", "Myliobatidae"))

filter(data, brain.mass > mean(brain.mass))

subset(data, data$brain.mass > mean(data$brain.mass))


summarise(data, length(unique(species)))

summarise(group_by(data, tribe), length(unique(species)))

summarise(group_by(data, family), whatever = mean(brain.mass),
          n = n())

summarydata <- data %>%
  group_by(family) %>%
  summarise(mean = mean(brain.mass), 
            sd = sd(brain.mass),
            n = n())

summarydata %>% print(n = 22)


str(data)
glimpse(data)

tribe <- data %>%
  tbl_df %>%
  mutate(rel.mass = brain.mass/body.mass,
         log.body.mass = log(body.mass)) %>% 
  filter(tribe != "Chimaeras") 

plot(tribe$rel.mass ~ tribe$tribe)

ggplot(data,aes(x=body.mass,y=brain.mass,
                color = reproductive.mode))+
  geom_point() + geom_line()




data$rel.mass <- data$brain.mass/data$body.mass

data %>%
  filter(t)