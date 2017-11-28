MATCH (commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[mod:MODIFIES]->(file:File)
WITH commit, file, (commit)-->(:Change)-->(:File) AS CommitToFile
  WHERE size(CommitToFile) > 1
RETURN CommitToFile, size(CommitToFile) AS CommitSize, commit.sha AS CommitSHA, file.relativePath AS FilePath
  ORDER BY CommitSize ASC  LIMIT 1000