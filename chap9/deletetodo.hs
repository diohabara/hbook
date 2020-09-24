import Control.Exception
import Data.List
import System.Directory
import System.IO

main = do
  contents <- readFile "todo.txt"
  let todoTasks = lines contents
      numberedTasks =
        zipWith
          (\n line -> show n ++ " - " ++ line)
          [0 ..]
          todoTasks

  putStrLn "These are your TO-DO items:"
  mapM_ putStrLn numberedTasks
  putStrLn "Which one do you want to delete?"
  numberString <- getLine
  let number = read numberString
      newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
  bracketOnError
    (openTempFile "." "temp")
    ( \(tempName, tempHandle) -> do
        hClose tempHandle
        removeFile tempName
    )
    ( \(tempName, tempHandle) -> do
        hPutStr tempHandle newTodoItems
        hClose tempHandle
        removeFile "todo.txt"
        renameFile tempName "todo.txt"
    )