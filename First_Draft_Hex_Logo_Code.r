
# setting the plotting area
par(mar=c(0,0,0,0))
plot(NULL, xlim=c(-1,1), ylim=c(-1,1))

#drawing the border
x<-c(1, .5, 0, -.5, -1, -.5, 0, .5)
y<-c(0, 1,1,1,0,-1,-1,-1)
polygon(x,y, lwd=3, border="#002855")

# fill color
polygon(x=x*.95, y=y*.95, col="#F2A900", border="white")

#plotting the scatterplot and regression line
set.seed(3)
x.var<-c(rnorm(20, 0, .2), -1, 1)
y.var<-x.var+rnorm(22, 0, .25)
points(x.var, y.var, col="white", pch=16)
segments(x0=-.656, y0=-.656, x1=.656, y1=.656, lwd=4, col="white")

#plotting the prediction intervals
fit<-lm(y.var~x.var)
pred.1 <- predict(fit,interval="prediction", newdata=data.frame(seq(-1, 1, length=32)))
lower.b<-pred.1[,2][order(x.var)]
upper.b<-pred.1[,3][order(x.var)]
lines(x.var[order(x.var)], lower.b, lty=2, lwd=4, col="white")
lines(x.var[order(x.var)], upper.b, lty=2, lwd=4 , col="white")

#replotting the border
polygon(x,y, lwd=3, border="#002855", col=NULL)

#text
text(x=0, y=.5, "Smith College", col=	"#002855", cex=2, font=2)
text(x=0, y=0, "SDS", col="#002855", cex=10)
text(x=0, y=-.5, "2017-2018", col="#002855", cex=2)