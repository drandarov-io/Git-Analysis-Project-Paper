MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
WITH change.modificationKind AS ModificationKind, author.name AS Author, split(file.relativePath, '.')[1] AS FileType
  WHERE NOT(FileType CONTAINS '/')
RETURN Author, FileType
  ORDER BY Author, FileType