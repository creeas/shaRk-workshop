#workshop code
#load in the dataset
brain <- read.csv("Workshop.data.csv", header = T)

#plot all the data
plot(brain)

#base plots
plot(log10(brain$brain.mass)~log10(brain$body.mass), pch=21, bg=as.factor(brain$reproductive.mode))
plot(log10(brain$brain.mass)~log10(brain$body.mass), pch=21, bg=as.factor(brain$habitat))

#basic models
mod <- glm(log10(Brain.mass.wolf)~log10(body.mass):habitat.new, data = brain)
summary(mod)