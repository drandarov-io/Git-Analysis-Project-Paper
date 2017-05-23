MATCH (author:Author)-[COMMITED]->(commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
RETURN split(commit.date,'-')[0]+'-'+split(commit.date,'-')[1] AS CommitDate, change.modificationKind AS ModificationKind, count(change) AS ChangeCount
  ORDER BY ModificationKind, CommitDate, ChangeCount DESC