## Population genetics statistics (Fst)
## Thanks to Julia Norrell and Josh Banta for example data and code

install.packages("ape")
install.packages("mmod")
library(ape)
library(mmod)

# read in data
dat <- read.dna("data/nucleotide.phy")

# add populations (same order as taxa in matrix)
pops <- c("A", "A", "B", "B", "A", "A", "B", "A", "A", "A", "A", "A", "B", "B", "A", "A", "A", "B", "A", "B", "B", "A", "A", "B")

# convert to frequency format
dat_genind <- as.genind.DNAbin(x=dat, pop=pops)

# calculate Nei's Gst (an alternative to Fst)
Gst_Nei(dat_genind)

# calculate differentiation statistics (including Gst)
diff_stats(dat_genind)


