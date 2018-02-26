MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
RETURN author.name AS Author, change.modificationKind AS ModificationKind, count(change) AS ChangeCount
  ORDER BY ModificationKind, Author, ChangeCount DESC