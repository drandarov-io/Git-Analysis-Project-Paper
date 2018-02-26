MATCH (author:Author)-[:COMMITTED]->(commit:Commit)
WITH collect(commit) AS Commits, author.name AS Author
WITH ["'",'. ']+split('",#()-+;?!…_','')+
     [w IN split('OF THE BRANCH INTO AND FOR WITH PULL WE HAVE A MORE TO PRO ON AN IT SOME SIMPLE EASY FROM OUT IN IS OR THERE THEIR DER DIE DAS DES HABEN HAT WIRD WERDEN NUR FÜR UND IST VON MIT ES EINE GIBT KANN MUSS SOLL',' ') | ' ' + w + ' '] AS toRemove,
     toUpper(reduce(words = '', aCommit IN Commits | words + aCommit.message)) AS allMessages, Author
WITH reduce(text = allMessages, garbage IN toRemove | replace(text,garbage,' ')) as cleaned, Author
WITH split(cleaned,' ') as words, Author
RETURN
  Author,
  words