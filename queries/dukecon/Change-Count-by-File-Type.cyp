MATCH (change:Change)-[:MODIFIES]->(file:File)
WITH split(file.relativePath, '.')[1] AS FileType, change
  WHERE FileType <> 'null'
RETURN FileType, change.modificationKind AS ModificationKind,
       count(change) AS ChangeCount
  ORDER BY ModificationKind, ChangeCount DESC