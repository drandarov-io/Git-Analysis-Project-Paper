MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
WITH change.modificationKind AS ModificationKind, author.name AS Author, split(file.relativePath, '.')[1] AS FileType
RETURN Author, count(ModificationKind), ModificationKind, FileType
  ORDER BY ModificationKind, count(ModificationKind) DESC, Author