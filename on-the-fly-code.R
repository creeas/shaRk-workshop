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



subset(data, data$family %in% 
         c("Rajidae", "Myliobatidae"))

filter(data, brain.mass > mean(brain.mass))

subset(data, data$brain.mass > mean(data$brain.mass))


summarise(data, length(unique(species)))

summarise(group_by(data, tribe), length(unique(species)))

summarise(group_by(data, family), whatever = mean(brain.mass),
          n = n())

# if we wanted to estimate the average brain mass as well as the standard deviation of the distribution of each family we can group by family and then summarize to obtain the desired metrics:

summarydata <- data %>%
  group_by(family) %>%
  summarise(mean = mean(brain.mass), 
            sd = sd(brain.mass),
            n = n())

# To see more rows we can use the `print` function:
summarydata %>% print(n = 22)


str(data)
glimpse(data)

# If we wanted to obtain relative brain mass as well as log body mass we can do that with 

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