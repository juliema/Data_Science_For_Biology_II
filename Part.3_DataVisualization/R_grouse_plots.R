############################################################
## Welcome to the R script; let's crush it
############################################################

## JPJ 22 iii 21

## Load in data

grouse_data <- read.delim("grouse_data.txt", header=FALSE, sep=" ")
	dim(grouse_data)
	head(grouse_data)
	
	## column 1 = individual id
	## column 2 = lek name
	## column 3 = latitude
	## column 4 = longitude
	## column 5 = lek complex name
	## column 6 = principal component 1
	## column 7 = principal component 2


## make new matrix for maps (lek, complex, lat, long)

unique_leks <- unique(grouse_data[,2])

map_mat <- matrix(0, length(unique_leks), 4)

for (i in 1:length(unique_leks))
	{
	sub_data <- subset(grouse_data, grouse_data[,2]==unique_leks[i])
	map_mat[i,1] <- unique_leks[i]
	map_mat[i,2] <- sub_data[1,5]
	map_mat[i,3] <- sub_data[1,3]
	map_mat[i,4] <- sub_data[1,4]
	}



## make a very basic map

## v0.1: basic
quartz(height=6, width=6)
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]))


## v0.2: add graphical parameter formatting using par
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]))


## v0.3: standardize x and y limits (need to be equal to one another)
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85))


## v0.4: add axis labels
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)")


## v0.5: make axis labels larger
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25)


## v0.6: rotate y axis labels
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1)


## v0.7: fill in points (white points are lame, gray are great)
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1, pch=21, bg="gray")


## v0.8: make points bigger
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1, pch=21, bg="gray", cex=2.5)


## v0.9: make points line widths thicker
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1, pch=21, bg="gray", cex=2.5, lwd=1.5)


## v0.10: make plot box line thicker
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1, pch=21, bg="gray", cex=2.5, lwd=1.5); box(lwd=2)



## make a map with colors and shape	

## v1.1: start with an empty plot (type=n), with all of the fun formatting from the basic plot
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)


## v1.2: add points with colors and shapes (colors match lek complex designations)
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="red", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="red", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="blue", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="blue", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="yellow", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="yellow", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="green", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="purple", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="purple", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="purple", cex=2.5, lwd=1.5)


## v1.3: let's use aesthetically pleasing, color blind friendly colors
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#FE6100", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#FE6100", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#648FFF", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#648FFF", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#FFB000", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#FFB000", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#785EF0", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#DC267F", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#DC267F", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#DC267F", cex=2.5, lwd=1.5)


## v1.4: that last palette wasn't that great, try again
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)


## v1.5: let's add a gray background since we have a really light color
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)


## v1.6: let's add a legend
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"))


## v1.7: make legend points larger
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2)


## v1.8: make legend points lines thicker
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5)


## v1.9: make legend box line thicker
quartz(height=6, width=6)
par(mar=c(5,5,1,1))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5, box.lwd=1.5)



## add pca next to map

## v2.1: use par(mfrow) to add another plot panel
quartz(height=6, width=12)
par(mar=c(5,5,1,1), mfrow=c(1,2))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5, box.lwd=1.5)


## v2.2: start with an empty pca plot
quartz(height=6, width=12)
par(mar=c(5,5,1,1), mfrow=c(1,2))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5, box.lwd=1.5)

plot(grouse_data[,6], grouse_data[,7], type="n", xlab="Principal component 1", ylab="Principal component 2", cex.lab=1.25, las=1); box(lwd=2)


## v2.3: add pca points (shapes and colors match map)
quartz(height=6, width=12)
par(mar=c(5,5,1,1), mfrow=c(1,2))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5, box.lwd=1.5)

plot(grouse_data[,6], grouse_data[,7], type="n", xlab="Principal component 1", ylab="Principal component 2", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(grouse_data[grouse_data[,2]=="CO_HC",6], grouse_data[grouse_data[,2]=="CO_HC",7], pch=21, bg="#a1dab4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="CO_QR",6], grouse_data[grouse_data[,2]=="CO_QR",7], pch=22, bg="#a1dab4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="KV_KB",6], grouse_data[grouse_data[,2]=="KV_KB",7], pch=21, bg="#253494", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="KV_LM",6], grouse_data[grouse_data[,2]=="KV_LM",7], pch=21, bg="#253494", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="NC_BP",6], grouse_data[grouse_data[,2]=="NC_BP",7], pch=21, bg="#ffffcc", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="NC_MM",6], grouse_data[grouse_data[,2]=="NC_MM",7], pch=21, bg="#ffffcc", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PE_PE",6], grouse_data[grouse_data[,2]=="PE_PE",7], pch=21, bg="#2c7fb8", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PV_DH",6], grouse_data[grouse_data[,2]=="PV_DH",7], pch=21, bg="#41b6c4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PV_GC",6], grouse_data[grouse_data[,2]=="PV_GC",7], pch=21, bg="#41b6c4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PV_PF",6], grouse_data[grouse_data[,2]=="PV_PF",7], pch=21, bg="#41b6c4", cex=1.5, lwd=1.25)


## v2.4: swap pcs 1 and 2
quartz(height=6, width=12)
par(mar=c(5,5,1,1), mfrow=c(1,2))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5, box.lwd=1.5)

plot(grouse_data[,7], grouse_data[,6], type="n", xlab="Principal component 2", ylab="Principal component 1", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(grouse_data[grouse_data[,2]=="CO_HC",7], grouse_data[grouse_data[,2]=="CO_HC",6], pch=21, bg="#a1dab4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="CO_QR",7], grouse_data[grouse_data[,2]=="CO_QR",6], pch=22, bg="#a1dab4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="KV_KB",7], grouse_data[grouse_data[,2]=="KV_KB",6], pch=21, bg="#253494", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="KV_LM",7], grouse_data[grouse_data[,2]=="KV_LM",6], pch=21, bg="#253494", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="NC_BP",7], grouse_data[grouse_data[,2]=="NC_BP",6], pch=21, bg="#ffffcc", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="NC_MM",7], grouse_data[grouse_data[,2]=="NC_MM",6], pch=21, bg="#ffffcc", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PE_PE",7], grouse_data[grouse_data[,2]=="PE_PE",6], pch=21, bg="#2c7fb8", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PV_DH",7], grouse_data[grouse_data[,2]=="PV_DH",6], pch=21, bg="#41b6c4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PV_GC",7], grouse_data[grouse_data[,2]=="PV_GC",6], pch=21, bg="#41b6c4", cex=1.5, lwd=1.25)
points(grouse_data[grouse_data[,2]=="PV_PF",7], grouse_data[grouse_data[,2]=="PV_PF",6], pch=21, bg="#41b6c4", cex=1.5, lwd=1.25)


## v2.5: flip the x and y axes on the pca
quartz(height=6, width=12)
par(mar=c(5,5,1,1), mfrow=c(1,2))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5, box.lwd=1.5)

plot(-1*grouse_data[,7], -1*grouse_data[,6], type="n", xlab="Principal component 2", ylab="Principal component 1", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(-1*grouse_data[grouse_data[,2]=="CO_HC",7], -1*grouse_data[grouse_data[,2]=="CO_HC",6], pch=21, bg="#a1dab4", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="CO_QR",7], -1*grouse_data[grouse_data[,2]=="CO_QR",6], pch=22, bg="#a1dab4", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="KV_KB",7], -1*grouse_data[grouse_data[,2]=="KV_KB",6], pch=21, bg="#253494", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="KV_LM",7], -1*grouse_data[grouse_data[,2]=="KV_LM",6], pch=22, bg="#253494", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="NC_BP",7], -1*grouse_data[grouse_data[,2]=="NC_BP",6], pch=21, bg="#ffffcc", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="NC_MM",7], -1*grouse_data[grouse_data[,2]=="NC_MM",6], pch=22, bg="#ffffcc", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="PE_PE",7], -1*grouse_data[grouse_data[,2]=="PE_PE",6], pch=21, bg="#2c7fb8", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="PV_DH",7], -1*grouse_data[grouse_data[,2]=="PV_DH",6], pch=21, bg="#41b6c4", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="PV_GC",7], -1*grouse_data[grouse_data[,2]=="PV_GC",6], pch=22, bg="#41b6c4", cex=1.5, lwd=1.25)
points(-1*grouse_data[grouse_data[,2]=="PV_PF",7], -1*grouse_data[grouse_data[,2]=="PV_PF",6], pch=23, bg="#41b6c4", cex=1.5, lwd=1.25)


## fireworks plot awesomeness

## v3.1: flip the x and y axes on the pca
quartz(height=6, width=12)
par(mar=c(5,5,1,1), mfrow=c(1,2))
plot(as.numeric(map_mat[,4]), as.numeric(map_mat[,3]), type="n", ylim=c(39.6, 40.4), xlim=c(-116.65, -115.85), xlab="Longitude (degrees)", ylab="Latitude (degrees)", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
points(as.numeric(map_mat[1,4]), as.numeric(map_mat[1,3]), pch=21, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[2,4]), as.numeric(map_mat[2,3]), pch=22, bg="#a1dab4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[3,4]), as.numeric(map_mat[3,3]), pch=21, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[4,4]), as.numeric(map_mat[4,3]), pch=22, bg="#253494", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[5,4]), as.numeric(map_mat[5,3]), pch=21, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[6,4]), as.numeric(map_mat[6,3]), pch=22, bg="#ffffcc", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[7,4]), as.numeric(map_mat[7,3]), pch=21, bg="#2c7fb8", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[8,4]), as.numeric(map_mat[8,3]), pch=21, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[9,4]), as.numeric(map_mat[9,3]), pch=22, bg="#41b6c4", cex=2.5, lwd=1.5)
points(as.numeric(map_mat[10,4]), as.numeric(map_mat[10,3]), pch=23, bg="#41b6c4", cex=2.5, lwd=1.5)
legend("bottomleft", legend=c("Modarelli Mine", "Big Pole", "Quartz Road", "Horse Creek", "Gable Canyon", "Pinefield", "Dome House", "Pony Express", "Kobeh Valley", "Lone Mountain"), pch=c(22,21,22,21,22,23,21,21,21,22), pt.bg=c("#ffffcc", "#ffffcc", "#a1dab4", "#a1dab4", "#41b6c4", "#41b6c4", "#41b6c4", "#2c7fb8", "#253494", "#253494"), pt.cex=2, pt.lwd=1.5, box.lwd=1.5)

firework_colors <- c("#a1dab4", "#a1dab4", "#253494", "#253494", "#ffffcc", "#ffffcc", "#2c7fb8", "#41b6c4", "#41b6c4", "#41b6c4")
firework_pchs <- c(21,22,21,22,21,22,21,21,21,22)
plot(-1*grouse_data[,7], -1*grouse_data[,6], type="n", xlab="Principal component 2", ylab="Principal component 1", cex.lab=1.25, las=1); box(lwd=2)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="light gray")
mean_long_vect <- vector()
mean_lat_vect <- vector()
for (i in 1:length(unique_leks))
	{
	sub_pca <- subset(grouse_data, grouse_data[,2]==unique_leks[i])
	mean_long_vect[i] <- -1 * mean(as.numeric(sub_pca[,7]))
	mean_lat_vect[i] <- -1 * mean(as.numeric(sub_pca[,6]))
	for (j in 1:dim(sub_pca)[1])
		{
		segments(mean_long_vect[i], mean_lat_vect[i], -1*sub_pca[,7], -1*sub_pca[,6], lwd=2, col=firework_colors[i])
		}
	}
for (i in 1: length(unique_leks))
	{
	points(mean_long_vect[i], mean_lat_vect[i], pch=firework_pchs[i], bg=firework_colors[i], cex=2.5, lwd=1.5)
	}






