MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
WITH split(file.relativePath, '.')[1] AS FileType, change, author
  WHERE FileType <> 'null'
RETURN author.name AS Author, FileType, change.modificationKind AS ModificationKind, count(change) AS ChangeCount
  ORDER BY ModificationKind, ChangeCount DESC