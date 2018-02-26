MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

UNION
MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[CONTAINS]->(change:Change)-[:MODIFIES]->(file:File)
WITH file, change, author.name AS Author,
     split(file.relativePath, '/')[0] + '/' +
     split(file.relativePath, '/')[1] + '/' +
     split(file.relativePath, '/')[2] + '/' +
     split(file.relativePath, '/')[3] + '/' +
     split(file.relativePath, '/')[4] + '/' +
     split(file.relativePath, '/')[5] + '/' +
     split(file.relativePath, '/')[6] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

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
     split(file.relativePath, '/')[7] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

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
     split(file.relativePath, '/')[8] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

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
     split(file.relativePath, '/')[9] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

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
     split(file.relativePath, '/')[10] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC

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
     split(file.relativePath, '/')[11] AS FilePath
  WHERE (FilePath CONTAINS '.')
RETURN Author, count(change) AS ChangeCount, FilePath
  ORDER BY FilePath, ChangeCount DESC
