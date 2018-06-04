## Population genetics: calculating percent sequence divergence

install.packages("ape")
install.packages("haplotypes")
library(ape)
library(haplotypes)

# convert DNA sequence format
dat <- read.dna("data/plant.phy")
write.dna(dat, file="nucleotideSeq.phy", format="sequential")

strsplit()
sum(seq1 != seq2)/length(seq1)*100

f <- system.file("example.fas", package="haplotypes")
