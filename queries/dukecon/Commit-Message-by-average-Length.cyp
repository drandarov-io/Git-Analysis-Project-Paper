MATCH (author:Author)-[COMMITED]->(commit:Commit)
RETURN DISTINCT author.name AS Author, round(avg(size(commit.message))) AS AverageMessageLength
  ORDER BY AverageMessageLength DESC