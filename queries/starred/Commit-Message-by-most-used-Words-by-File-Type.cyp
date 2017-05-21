MATCH (commit:Commit)-[CONTAINS_CHANGE]->(change:Change)-[MODIFIES]->(file:File)
WITH collect(commit) AS Commits, change, split(file.relativePath, '.')[1] AS FileType
RETURN
  FileType,
  collect(DISTINCT
  split(

  replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
  replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
  replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
  replace(

  toUpper(
  reduce(words = '', aCommit IN Commits | words + aCommit.message)
  ),

  '"', ' '), "'", ' '), '#', ' '), ',', ' '), '(', ' '), ')', ' '), '-', ' '), '+', ' '), '…', ' '), ';', ' '),
  '. ', ' '), '?', ' '), '!', ' '),
  ' OF ', ' '), ' THE ', ' '), ' BRANCH ', ' '), ' INTO ', ' '), ' AND ', ' '), ' FOR ', ' '), ' WITH ', ' '),
  ' PULL ', ' '), ' WE ', ' '), ' HAVE ', ' '), ' A ', ' '), ' MORE ', ' '), ' TO ', ' '), ' PRO ', ' '), ' ON ', ' '),
  ' AN ', ' '), ' IT ', ' '), ' SOME ', ' '), ' SIMPLE ', ' '), ' EASY ', ' '), ' FROM ', ' '), ' OUT ', ' '),
  ' IN ', ' '), ' IS ', ' '), ' OR ', ' '), ' THERE ', ' '), ' THEIR ', ' '),
  '   ', ' '), '  ', ' '), ' ', '_')

  , '_')
  ) AS WordsByFileType