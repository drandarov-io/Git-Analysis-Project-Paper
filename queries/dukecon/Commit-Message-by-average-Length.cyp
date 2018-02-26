MATCH (author:Author)-[:COMMITTED]->(commit:Commit)
RETURN DISTINCT author.name AS Author, round(avg(size(commit.message))) AS AverageMessageLength
  ORDER BY AverageMessageLength DESC