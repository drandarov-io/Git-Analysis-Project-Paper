MATCH (author:Author)-[COMMITED]->(commit:Commit)
RETURN split(commit.time, ':')[0] AS HourOfDay, count(commit) AS CommitCount, author.name AS Author
  ORDER BY CommitCount DESC