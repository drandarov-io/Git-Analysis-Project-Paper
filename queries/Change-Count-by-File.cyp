MATCH (change:Change)-[MODIFIES]->(file:File)
RETURN file.relativePath AS FilePath, count(change) AS ChangeCount, change.modificationKind AS ModificationKind
  ORDER BY ChangeCount DESC