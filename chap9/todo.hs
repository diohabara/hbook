import Control.Exception
import Data.List
import System.Directory
import System.Environment
import System.IO

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
disptach command = doesntExist command

main = do
    (command : argList) <- getArgs
    dispatch command argList

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")
add _ = putStrLn "The add command takes exactly two arguments"

view :: [String] -> IO ()
view [fileName] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith
            (\n line -> show n ++ " - " ++ line)
            [0 ..]
            todoTasks
    putStr $ unlines numberedTasks
view _ = putStrLn "The add command takes exactly two arguments"

remove :: [String] -> IO ()
remove [fileName, numberString] = do
    contents <- readFile fileName
    let todoTasks = lines contents
        numberedTasks = zipWith (\n line -> show n ++ " - " ++ line)
                            [0..] todoTasks
    putStrLn "These are your TO-DO items:"
    mapM_ putStrLn numberedTasks
    let number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)

        (\(tempName, tempHandle) -> do
            hPutStr tempHandle newTodoItems
            hClose tempHandle
            removeFile fileName
            renameFile tempName fileName
            )
remove _ = putStrLn "The add command takes exactly two arguments"

doesntExist :: String -> [String] -> IO ()
doesntExist command _ =
    putStrLn $ "THe " ++ command ++ " command doesn't exist"