MATCH (change:Change)-[:MODIFIES]->(file:File)
WITH split(file.relativePath, '.')[1] AS FileType, change
  WHERE FileType <> 'null' AND NOT(FileType CONTAINS '/')
RETURN FileType, count(change) AS ChangeCount
  ORDER BY ChangeCount DESC, FileType