library(cluster)
data <- read.csv('C:\\Users\\Yikway\\Desktop\\new.csv')
x <-data[,c(8)]#第8列的数据是经度
y <-data[,c(7)]#第7列的数据是纬度
a <- data[,c(8,7)]
plot(x,y)#画出经纬度房源示意图
res <- kmeans(a,centers=3)#k=3
plot(a,col=res$cluster)#结果以不同颜色的标记不同的分类类别
