MATCH  (author:Author)-[:COMMITTED]->(commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
RETURN author.name AS Author, split(commit.date,'-')[0]+'-'+split(commit.date,'-')[1] AS CommitDate, change.modificationKind AS ModificationKind, count(change) AS ChangeCount
  ORDER BY CommitDate, ChangeCount DESC, ModificationKind