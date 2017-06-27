
Repository Analysis
===================

Knowledge Management | Project Paper
====================================

Authors
-------

-   [70415245 | Lisa Rosenberg](https://github.com/lisa-rosenberg)
-   [70428153 | Dmitrij Drandarov](https://github.com/dmitrij-drandarov)

Introduction
------------

Setup
-----

Analysis
--------

### Basic Information

-   A → Added
-   C → Copied
-   D → Deleted
-   M → Modified
-   R → Renamed
-   T → Have their type (mode) changed
-   U → Unmerged
-   X → Unknown
-   B → Have had their pairing Broken

Changes in Repository by Modification Kind
------------------------------------------

``` cypher
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
RETURN change.modificationKind AS ModificationKind, count(change.modificationKind) AS ChangeCount
  ORDER BY ChangeCount DESC
```

``` r
# # Load data
csv <- read.table(file.path("../../result/dukecon/Change-Count.csv"), sep=",", header=TRUE)

# # Setup plot
slices <- c(csv$ChangeCount)
percentage <- round(slices/sum(slices)*100)
labels <- csv$ModificationKind
labels <- paste(labels, " (", slices, " | ", percentage, "%)", sep="")
colors <- brewer.pal(max(as.numeric(csv$ModificationKind)), palette)

# # Display plot
pie(slices, labels=labels, col=colors, main="Change Count by Modification Kind")
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-3-1.png)

Change Count by Author
----------------------

``` cypher
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
RETURN author.name AS Author, change.modificationKind AS ModificationKind
    ORDER BY ModificationKind, Author
```

``` r
# # Load data
csv <- read.table(file.path("../../result/dukecon/wip/Change-Count-by-Author.csv"), sep=",", header=TRUE)

# # Filter data
percentage <- nrow(csv)/100
table <- table(csv$Author, csv$ModificationKind)
subset <- table[table(csv$Author)>percentage,]

# # Setup plot
colors <- brewer.pal(max(as.numeric(csv$ModificationKind)), palette)

# # Display plot
mosaicplot(subset, col=colors, las=3, ylab="ModificationKind", main="Change Count by Authors", cex.axis=0.8, mar=c(0,0,0,0), pop=FALSE)
```

    ## Warning: In mosaicplot.default(subset, col = colors, las = 3, ylab = "ModificationKind", 
    ##     main = "Change Count by Authors", cex.axis = 0.8, mar = c(0, 
    ##         0, 0, 0), pop = FALSE) :
    ##  extra argument 'pop' will be disregarded

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-5-1.png)

Change Count by Time
--------------------

### Change Count by Month

``` cypher
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
RETURN split(commit.date,'-')[0]+'-'+split(commit.date,'-')[1] AS CommitDate, change.modificationKind AS ModificationKind, count(change) AS ChangeCount
  ORDER BY ModificationKind, CommitDate, ChangeCount DESC
```

``` r
# # Load data
csv <- read.table(file.path("../../result/dukecon/wip/Change-Count-by-Date-Month.csv"), sep=",", header=TRUE)

# # Filter data
subset1 <- aggregate(ChangeCount ~ CommitDate, csv, sum)

# # Transform data
numModificationKind <- as.numeric(csv$ModificationKind) 
xrange <- range(as.yearmon(subset1$CommitDate))
yrange <- range(subset1$ChangeCount)

# # Setup plot
plot(xrange, yrange, type="n", xlab="", ylab="ChangeCount", main="Change Count by Date (Month)", cex.axis=0.8, mar=c(0,3.8,1.5,0), xaxt='n')
axis(side=1, las=2, labels=c(as.yearmon(csv$CommitDate)), at=c(as.yearmon(csv$CommitDate)))
abline(v=(c(as.yearmon(csv$CommitDate))), col="grey", lty="dotted")
colors <- brewer.pal(max(as.numeric(csv$ModificationKind)), palette)
plotchar <- seq(18, 18 + max(numModificationKind), 1)

# # Display plot
lines(as.yearmon(subset1$CommitDate), subset1$ChangeCount, type="h", lwd=10, col="gray27")
for (i in 1:max(numModificationKind)) { 
  x <- subset(csv, numModificationKind==i)
  lines(as.yearmon(x$CommitDate), x$ChangeCount, type="l", lwd=2, col=colors[i], pch=plotchar[i])
}

# # Display legend
legend(xrange[1], yrange[2], unique(csv$ModificationKind), cex=0.8, col=colors, lty=1, title="ModKind")
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-7-1.png)

### Change Count by Author and Month

``` cypher
MATCH  (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
RETURN author.name AS Author, split(commit.date,'-')[0]+'-'+split(commit.date,'-')[1] AS CommitDate, change.modificationKind AS ModificationKind, count(change) AS ChangeCount
  ORDER BY CommitDate, ChangeCount DESC, ModificationKind
```

``` r
# # Load data
csv <- read.table(file.path("../../result/dukecon/wip/Change-Count-by-Author-by-Date-Month.csv"), sep=",", header=TRUE)

# # Filter data
subset1 <- subset(csv, Author == "Falk Sippach", select = -c(ModificationKind))
subset1 <- aggregate(ChangeCount ~ CommitDate, subset1, sum)
subset2 <- subset(csv, Author == "Falk Sippach")

# # Transform data
numModificationKind <- as.numeric(subset2$ModificationKind)
xrange <- range(as.yearmon(subset1$CommitDate))
yrange <- range(subset1$ChangeCount)

# # Setup plot
plot(xrange, yrange, type="n", xlab="", ylab="ChangeCount", main="Change Count by Falk Sippach by Date (Month)", cex.axis=0.8, mar=c(0,3.8,1.5,0), xaxt='n')
axis(side=1, las=2, labels=c(as.yearmon(subset1$CommitDate)), at=c(as.yearmon(subset1$CommitDate)))
abline(v=(c(as.yearmon(subset1$CommitDate))), col="grey", lty="dotted")
colors <- brewer.pal(max(as.numeric(csv$ModificationKind)), palette)
plotchar <- seq(18, 18 + max(numModificationKind), 1)

# # Display plot
lines(as.yearmon(subset1$CommitDate), subset1$ChangeCount, type="h", lwd=10, col="gray27")
for (i in 1:max(numModificationKind)) { 
  x <- subset(subset2, numModificationKind==i)
  lines(as.yearmon(x$CommitDate), x$ChangeCount, type="l", lwd=2, col=colors[i], pch=plotchar[i])
}

# # Display legend
legend(xrange[1], yrange[2], c("A", "C", "D", "M", "R"), cex=0.8, col=colors, lty=1, title="ModKind")
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-9-1.png)

Change Count by File Type
-------------------------

### Change Count by File Type

``` cypher
MATCH (change:Change)-[MODIFIES]->(file:File)
WITH split(file.relativePath, '.')[1] AS FileType, change
  WHERE FileType <> 'null' AND NOT(FileType CONTAINS '/')
RETURN FileType, count(change) AS ChangeCount
  ORDER BY ChangeCount DESC, FileType
```

``` r
# # Load data
csv <- read.table(file.path("../../result/dukecon/wip/Change-Count-by-File-Type.csv"), sep=",", header=TRUE)

# # Setup plot
colorCount <- max(as.numeric(csv$FileType))
ymax <- round_any(max(csv$ChangeCount)*120/100, 10, f=ceiling)

# # Display plot
ggplot(csv, aes(x=reorder(FileType, ChangeCount), y=ChangeCount)) +
  geom_bar(stat="identity", fill=getPalette(colorCount)) + coord_flip() +
  geom_text(aes(label=ChangeCount), vjust=0.5, hjust=-0.5, size=3) +
  theme(axis.title=element_text(size=7.5,face="bold"), title=element_text(size=7.5,face="bold")) +
  scale_y_continuous(limits=c(0, 1050), expand=c(0, 0)) +
  labs(x="FileType", title="Ownership by File ordered by ChangeCount")
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-11-1.png)

### Change Count by File Type and Author

``` cypher
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
WITH change.modificationKind AS ModificationKind, author.name AS Author, split(file.relativePath, '.')[1] AS FileType
  WHERE NOT(FileType CONTAINS '/')
RETURN Author, FileType
  ORDER BY Author, FileType
```

``` r
# # Load data
csv <- read.table(file.path("../../result/dukecon/wip/Change-Count-by-File-Type-by-Author.csv"), sep=",", header=TRUE)

# # Filter data
subset1 <- subset(csv, Author=="Falk Sippach")
subset2 <- subset(csv, Author=="Alexander Schwartz")

# # Transform data
ymax1 <- round_any(max(table(subset1$FileType))*120/100, 10, f=ceiling)
ymax2 <- round_any(max(table(subset2$FileType))*120/100, 10, f=ceiling)

# # Setup plot
colorCount1 <- max(as.numeric(droplevels.factor(subset1[2>0]$FileType)))
colorCount2 <- max(as.numeric(droplevels.factor(subset2[2>0]$FileType)))

# # Display plot
plot1 <- ggplot(subset1, aes(x=factor(FileType))) +
  geom_bar(fill=getPalette(colorCount1)) +
  geom_text(stat='count', aes(label=..count..), hjust=-0.5, size=2, angle=90) +
  scale_y_continuous(limits=c(0, ymax1), expand=c(0, 0)) +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0.30), axis.title=element_text(size=7.5,face="bold"), title=element_text(size=7.5,face="bold")) +
  labs(x="", y="ChangeCount", title="Change Count by Falk Sippach")

plot2 <- ggplot(subset2, aes(x=factor(FileType))) +
  geom_bar(fill=getPalette(colorCount2)) +
  geom_text(stat='count', aes(label=..count..), hjust=-0.5, size=2, angle=90) +
  scale_y_continuous(limits=c(0, ymax2), expand=c(0, 0)) +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0.30), axis.title=element_text(size=7.5,face="bold"), title=element_text(size=7.5,face="bold")) +
  labs(x="", y="ChangeCount", title="Change Count by Alexander Schwartz")

grid.arrange(plot1, plot2, nrow=2)
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-13-1.png)

Ownership of Repository
-----------------------

### Ownership of Repository by File Type

``` cypher
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
WITH change.modificationKind AS ModificationKind, author.name AS Author, split(file.relativePath, '.')[1] AS FileType
RETURN Author, count(ModificationKind), ModificationKind, FileType
  ORDER BY ModificationKind, count(ModificationKind) DESC, Author
```

``` r
# # Load data
csv <- read.table(file.path("../../result/dukecon/wip/Change-Count-by-File-Type-by-Author.csv"), sep=",", header=TRUE)
  
# # Filter data
subset1 <- subset(csv, Author=="Falk Sippach")
subset2 <- subset(csv, Author=="Alexander Schwartz")

# # Transform data
proportion1 <- round(table(subset1$FileType)/table(csv$FileType)*100, digits=2)
proportion2 <- round(table(subset2$FileType)/table(csv$FileType)*100, digits=2)

# # Setup plot
colorCount <- max(as.numeric(csv$FileType))

# # Display plot
plot1 <- ggplot(data.frame(proportion1), aes(x=Var1, y=Freq)) +
  geom_bar(stat="identity", fill=getPalette(colorCount)) +
  geom_text(aes(label=paste(Freq, "%")), hjust=-0.25, size=2, angle=90) +
  scale_y_continuous(limits=c(0,100), expand=c(0, 0)) +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0.30), axis.title=element_text(size=7.5,face="bold"), title=element_text(size=7.5,face="bold")) +
  labs(x="", y="ChangeCount in %", title="Ownership of Repository by Falk Sippach")

plot2 <- ggplot(data.frame(proportion2), aes(x=Var1, y=Freq)) +
  geom_bar(stat="identity", fill=getPalette(colorCount)) +
  geom_text(aes(label=paste(Freq, "%")), hjust=-0.25, size=2, angle=90) +
  scale_y_continuous(limits=c(0,100), expand=c(0, 0)) +
  theme(axis.text.x=element_text(angle=90, hjust=1, vjust=0.30), axis.title=element_text(size=7.5,face="bold"), title=element_text(size=7.5,face="bold")) +
  labs(x="", y="ChangeCount in %", title="Ownership of Repository by Alexander Schwartz")

grid.arrange(plot1, plot2, nrow=2)
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-15-1.png)

### Ownership of Repository by Package

``` cypher
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS]->(change:Change)-[MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS]->(change:Change)-[MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION ...
```

``` r
# # Load data
data <- read.table(file.path("../../result/dukecon/starred/Change-Count-by-Author-by-Package.csv"), sep=",", header=TRUE)

# # Filter data
# Get only packages with more than 1% changes of the repository
maxFiles <- 25 # number of most changed files
temp <- aggregate(ChangeCount ~ Path, data, sum) # sum up ChangeCount of every Author
temp <- temp[with(temp, order(-ChangeCount)),] # sort (descending)
temp <- temp[temp$ChangeCount >= temp$ChangeCount[order(temp$ChangeCount, decreasing=TRUE)][maxFiles],] # select top maxFiles
data <- subset(data, Path %in% temp$Path)

# # Transform data
# Add percentage of changes within packages
data$Pct <- round(data$ChangeCount/with(data, ave(ChangeCount, list(Path), FUN = sum))*100, digits=2)

# # TODO section
# Select authors that changed the most in each package #
maxChanged <- with(data, tapply(ChangeCount, Path, which.max))
splitPath <- split(data, data$Path)
data <- na.omit(do.call(rbind, lapply(1:length(splitPath), function(i) splitPath[[i]][maxChanged[i],])))
data <- data[order(match(data[,3],temp[,1])),] # Sort data$FilePath by temp$Path to get sorting by most relevant files
# Add character count of FilePath to data
data$Char <- nchar(as.character(data$Path))

# # Display plot
ggplot(data, aes(x=reorder(Path, Pct), y=Pct, fill=Author)) +
  aes(stringr::str_wrap(data$Path, wrapAtChar), data$Char) +
  scale_fill_brewer(palette=palette) +
  geom_bar(stat="identity") +
  geom_text(aes(label=paste(Author, "-", Pct, "%")), hjust=-0.05, size=3.75) +
  coord_flip() +
  scale_y_continuous(limits=c(0,100), expand=c(0, 0)) +
  theme(legend.position="none", axis.text.x=element_text(angle=90, hjust=1, vjust=0.30, size=10), axis.title=element_text(size=7.5,face="bold"), title=element_text(size=10,face="bold")) +
  labs(x="", y="ChangeCount in %", title="Ownership of Packages")
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-17-1.png)

### Ownership of Repository by File

``` cypher
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS]->(change:Change)-[MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION
MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS]->(change:Change)-[MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION ...
```

``` r
# # Load data
data <- read.table(file.path("../../result/dukecon/starred/Change-Count-by-Author-by-File.csv"), sep=",", header=TRUE)

# # Filter data
# Select the most changed files in the repository
temp <- aggregate(ChangeCount ~ FilePath, data, sum) # sum up ChangeCount of every Author
temp <- temp[with(temp, order(-ChangeCount)),] # sort (descending)
temp <- temp[temp$ChangeCount >= temp$ChangeCount[order(temp$ChangeCount, decreasing=TRUE)][maxFiles],] # select top maxFiles
data <- subset(data, FilePath %in% temp$FilePath) # subset data based on temp

# # Transform data
# Add percentage of changes within packages
data$Pct <- round(data$ChangeCount/with(data, ave(ChangeCount, list(FilePath), FUN = sum))*100, digits=2)

# # TODO section
# Select authors that changed the most
maxChanged <- with(data, tapply(ChangeCount, FilePath, which.max)) # Needed
splitPath <- split(data, data$FilePath) # Needed
data <- na.omit(do.call(rbind, lapply(1:length(splitPath), function(i) splitPath[[i]][maxChanged[i],]))) # Select authors
data <- data[order(match(data[,3],temp[,1])),] # Sort data$FilePath by temp$FilePath to get sorting by most relevant files
# Add character count of FilePath to data
data$Char <- nchar(as.character(data$FilePath))

# # Display plot
ggplot(data, aes(x=FilePath, y=Pct, fill=Author)) +
  aes(stringr::str_wrap(data$FilePath, wrapAtChar), data$Char) +
  scale_fill_brewer(palette=palette) +
  geom_bar(stat="identity") +
  geom_text(aes(label=paste(Author, "-", Pct, "%")), hjust=-0.05, size=3.75) +
  coord_flip() +
  scale_y_continuous(limits=c(0,100), expand=c(0, 0)) +
  theme(legend.position="none", axis.text.y=element_text(size=10), axis.text.x=element_text(angle=90, hjust=1, vjust=0.30, size=10), axis.title=element_text(size=7.5,face="bold"), title=element_text(size=10,face="bold")) +
  labs(x="", y="Ownership in %", title="Ownership by File ordered by ChangeCount")
```

![](Repository_Analysis_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-19-1.png)
