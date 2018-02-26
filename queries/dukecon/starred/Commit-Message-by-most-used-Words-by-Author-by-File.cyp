MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
WITH collect(commit) AS Commits, change, split(file.relativePath, '/')[size(split(file.relativePath, '/')) - 1] AS File, author.name AS Author
WITH ["'",'. ']+split('",#()-+;?!…_','')+
 [w IN split('OF THE BRANCH INTO AND FOR WITH PULL WE HAVE A MORE TO PRO ON AN IT SOME SIMPLE EASY FROM OUT IN IS OR THERE THEIR DER DIE DAS DES HABEN HAT WIRD WERDEN NUR FÜR UND IST VON MIT ES EINE GIBT KANN MUSS SOLL',' ') | ' ' + w + ' '] AS toRemove,
 toUpper(reduce(words = '', aCommit IN Commits | words + aCommit.message)) AS allMessages, File, Author
WITH reduce(text = allMessages, garbage IN toRemove | replace(text,garbage,' ')) as cleaned, File, Author
WITH split(cleaned,' ') as words, File, Author
RETURN
Author,
File,
words