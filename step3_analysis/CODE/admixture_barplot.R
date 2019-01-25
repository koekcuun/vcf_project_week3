setwd("~/vcf_project_week3/step3_analysis/RESULTS/")

#plot all the k value barplots
redknots=read.table("redknots.1.Q")
png("barplot_redknots1")
barplot(t(as.matrix(redknots)), col=rainbow(2),
          xlab="Individual #", ylab="Ancestry", border=NA)
dev.off()

redknots=read.table("redknots.2.Q")
png("barplot_redknots2")
barplot(t(as.matrix(redknots)), col=rainbow(2),
        xlab="Individual #", ylab="Ancestry", border=NA)
dev.off()

redknots=read.table("redknots.3.Q")
png("barplot_redknots3")
barplot(t(as.matrix(redknots)), col=rainbow(3),
        xlab="Individual #", ylab="Ancestry", border=NA)
dev.off()

redknots=read.table("redknots.4.Q")
png("barplot_redknots4")
barplot(t(as.matrix(redknots)), col=rainbow(4),
        xlab="Individual #", ylab="Ancestry", border=NA)
dev.off()

redknots=read.table("redknots.5.Q")
png("barplot_redknots5")
barplot(t(as.matrix(redknots)), col=rainbow(5),
        xlab="Individual #", ylab="Ancestry", border=NA)
dev.off()