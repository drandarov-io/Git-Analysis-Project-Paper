MATCH (commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
RETURN count(commit) AS CommitCount, split(file.relativePath, '.')[1] AS FileType
  ORDER BY CommitCount DESC