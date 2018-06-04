## pegas

install.packages("ape")
install.packages("pegas")

library(ape)
library(pegas)

# load DNA sequence data as DNAbin
data(woodmouse)
# tutorial for reading data in: https://cran.r-project.org/web/packages/pegas/vignettes/ReadingFiles.pdf
#read.dna("FILE", format="fasta")

# chunk below modified from here: https://arundurvasula.wordpress.com/2016/02/24/haplotype-networks-in-r/
# convert to distance
d <- dist.dna(woodmouse)
# identify haplotypes
h <- haplotype(woodmouse)
# sort labels
h <- sort(h, what = "label")
# create haplotype network
net <- haploNet(h)
# reformat network to table that can be plotted
ind.hap<-with(
  stack(setNames(attr(h, "index"), rownames(h))),
  table(hap=ind, pop=rownames(woodmouse)[values])
)
# plot network
plot(net, size=attr(net, "freq"), scale.ratio=0.2, pie=ind.hap)
# plot legend
legend(-8, 0, colnames(ind.hap), col=rainbow(ncol(ind.hap)), pch=19, ncol=2)
