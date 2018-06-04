## Population genetics statistics (Fst) and haplotype network
## Thanks to Julia Norrell and Josh Banta for example data and code

install.packages("ape")
install.packages("mmod")
install.packages("pegas")
library(ape)
library(mmod)
library(pegas)

# read in data
dat <- read.dna("data/plant.phy")

# show distribution of polymorphism in data
datMatrix <- as.matrix(dat)
snpposi.plot(datMatrix, codon=FALSE)

# convert to genind format
DNAbin2genind(dat)

# add populations (same order as taxa in matrix)
pops <- c("A", "A", "B", "B", "A", "A", "B", "A", "A", "A", "A", "A", "B", "B", "A", "A", "A", "B", "A", "B", "B", "A", "A", "B")

# convert to frequency format
dat_genind <- as.genind.DNAbin(x=dat, pop=pops)

# calculate Nei's Gst (an alternative to Fst)
Gst_Nei(dat_genind)

# calculate differentiation statistics (including Gst)
diff_stats(dat_genind)

# create and plot haplotype network
hap <- haplotype(dat)
net <- haploNet(hap)
plot(net, size = attr(net, "freq"), scale.ratio = 2, cex = 0.2)
