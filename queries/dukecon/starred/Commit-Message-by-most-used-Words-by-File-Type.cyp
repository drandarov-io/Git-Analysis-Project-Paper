MATCH (commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
WITH collect(commit) AS Commits, change, split(file.relativePath, '.')[1] AS FileType
WITH ["'",'. ']+split('",#()-+;?!…_','')+
   [w IN split('OF THE BRANCH INTO AND FOR WITH PULL WE HAVE A MORE TO PRO ON AN IT SOME SIMPLE EASY FROM OUT IN IS OR THERE THEIR DER DIE DAS DES HABEN HAT WIRD WERDEN NUR FÜR UND IST VON MIT ES EINE GIBT KANN MUSS SOLL',' ') | ' ' + w + ' '] AS toRemove,
   toUpper(reduce(words = '', aCommit IN Commits | words + aCommit.message)) AS allMessages, FileType
WITH reduce(text = allMessages, garbage IN toRemove | replace(text,garbage,' ')) as cleaned, FileType
WITH split(cleaned,' ') as words, FileType
RETURN
FileType,
words