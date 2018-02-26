MATCH  (author:Author)-[:COMMITTED]->(commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
RETURN author.name AS Author, commit.date AS CommitDate, change.modificationKind AS ModificationKind, count(change) AS ChangeCount
  ORDER BY CommitDate, ChangeCount DESC, ModificationKind