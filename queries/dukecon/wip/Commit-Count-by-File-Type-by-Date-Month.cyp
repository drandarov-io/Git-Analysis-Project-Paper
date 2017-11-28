MATCH (commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
RETURN split(commit.date,'-')[0]+'-'+split(commit.date,'-')[1] AS CommitDate, count(change) AS CommitCount, split(file.relativePath, '.')[1] AS FileType
  ORDER BY CommitDate ASC, CommitCount DESC