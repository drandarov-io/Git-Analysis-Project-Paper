MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
WITH change, count(change) AS ChangeCount, author, file, split(file.relativePath, '.')[size(split(file.relativePath, '.'))-1] as Extension
WHERE author.name = 'Author Name'
  RETURN Extension, count(Extension) as ExtensionCount, file.relativePath AS RelativePath, change.modificationKind AS ModificationKind
  ORDER BY count(Extension) DESC