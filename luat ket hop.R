install.packages("arules")
require(arules)
data("Groceries")
Groceries
itemFrequency(Groceries[,1])
itemFrequency(Groceries[,1:6])
itemFrequencyPlot(Groceries, support=0.2)
itemFrequencyPlot(Groceries, support=0.1)
itemFrequencyPlot(Groceries, topN = 5)
rules <- apriori(Groceries, parameter = list(supp = 0.007, conf = 0.25 , minlen = 2))
summary(rules)
inspect(rules[1:2])
inspect(sort(rules, by="lift")[1:4])
install.packages("arulesViz")
library(arulesViz)
data("Groceries")
summary(Groceries)
plot(rules)
head(quality(rules))
plot(rules, 
     measure = c("support", "lift"),
     shading = "confidence")
plot(rules, 
     shading = "order",
     control = list(main="Two-key plot"))
sel <- plot(rules, 
            measure = c("support", "lift"),
            shading = "confidence",
            interactive = TRUE)
plot(rules, methods="graph", control=list(type="item"))
