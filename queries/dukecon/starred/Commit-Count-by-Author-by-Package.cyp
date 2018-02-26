MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' +
     split(file.relativePath, '/')[6] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' +
     split(file.relativePath, '/')[6] + '/' +
     split(file.relativePath, '/')[7] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' +
     split(file.relativePath, '/')[6] + '/' +
     split(file.relativePath, '/')[7] + '/' +
     split(file.relativePath, '/')[8] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' +
     split(file.relativePath, '/')[6] + '/' +
     split(file.relativePath, '/')[7] + '/' +
     split(file.relativePath, '/')[8] + '/' +
     split(file.relativePath, '/')[9] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' +
     split(file.relativePath, '/')[6] + '/' +
     split(file.relativePath, '/')[7] + '/' +
     split(file.relativePath, '/')[8] + '/' +
     split(file.relativePath, '/')[9] + '/' +
     split(file.relativePath, '/')[10] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' +
     split(file.relativePath, '/')[6] + '/' +
     split(file.relativePath, '/')[7] + '/' +
     split(file.relativePath, '/')[8] + '/' +
     split(file.relativePath, '/')[9] + '/' +
     split(file.relativePath, '/')[10] + '/' +
     split(file.relativePath, '/')[11] + '/' AS Path
  WHERE NOT(Path CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, Path
  ORDER BY Path, ChangeCount DESC
