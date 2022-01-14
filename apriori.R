library(arules)
data("Groceries")#读入Groceries数据集
summary(Groceries)#查看Groceries中的数据
dim(Groceries)#用dim函数提取项集数和item数

inspect(Groceries[1:5])#进一步查看信息
basketSize<-size(Groceries)#计算购物篮里商品数量
itemFreq<-itemFrequency(Groceries)#计算每种商品的支持度
itemCount<-(itemFreq/sum(itemFreq))*sum(basketSize)#计算每个item出现的次数
#按支持度itemFrequency排序，查看支持度的最大值
orderedItemFreq<-sort(itemFrequency(Groceries),decreasing=T)
orderedItemFreq[1:10]
orderedItemFreq
#itemFrequencyPlot 画频繁项的图
itemFrequencyPlot(Groceries,support=0.1)#按最小支持度查看
itemFrequencyPlot(Groceries,topN=10,horiz=T)#按照排序查看
itemFrequencyPlot(Groceries,horiz=T)#按照排序查看

#提取关联规则
groceryrules<-apriori(Groceries,parameter=list(support=0.006,confidence=0.25,minlen=2))
summary(groceryrules)
#按照提升度，对规则进行排序。
ordered_groceryrules<-sort(groceryrules,by="lift")
#inspect查看具体的规则
inspect(ordered_groceryrules)
#写出关联规则
write(ordered_groceryrules,file="(ordered_groceryrules.csv",sep=",",quote=TRUE,row.names=FALSE)
groceryrules_df<-as(ordered_groceryrules,"data.frame")
str(groceryrules_df)

library(RColorBrewer)
library(arulesViz)
plot(groceryrules,control=list(jitter=2,col=rev(brewer.pal(9,"Greens")[4:9])),shading="lift")
plot(groceryrules,measure="confidence",method="graph",control=list(type="items"),shading="lift")
plot(groceryrules,method="grouped",control=list(col=rev(brewer.pal(9,"Greens")[4:9])))



groceryrules.eclat<-eclat(groceries,parameter=list(support=0.05,minlen=2))
summary(groceryrules.eclat)
inspect(groceryrules.eclat)
groceryrules.eclat <- eclat(groceries, parameter = list(support=0.05, minlen=2))

summary(groceryrules.eclat)

inspect(groceryrules.eclat)
