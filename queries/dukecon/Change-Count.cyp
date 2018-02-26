MATCH (author:Author)-[:COMMITTED]->(commit:Commit)-[:CONTAINS_CHANGE]->(change:Change)-[:MODIFIES]->(file:File)
RETURN change.modificationKind AS ModificationKind, count(change.modificationKind) AS ChangeCount
  ORDER BY ChangeCount DESC