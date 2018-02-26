MATCH (commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
RETURN commit.date AS CommitDate, count(change) AS CommitCount, split(file.relativePath, '.')[1] AS FileType
  ORDER BY CommitDate ASC, CommitCount DESC