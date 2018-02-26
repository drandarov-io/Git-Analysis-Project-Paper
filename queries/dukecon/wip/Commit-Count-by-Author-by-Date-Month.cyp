MATCH  (author:Author)-[:COMMITTED]->(commit:Commit)
RETURN author.name AS Author, split(commit.date,'-')[0]+'-'+split(commit.date,'-')[1] AS CommitDate, count(commit) AS CommitCount
  ORDER BY CommitDate, CommitCount DESC