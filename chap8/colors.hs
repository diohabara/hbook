main = do
  colors <- forM [1,2,3,4] $ \a -> do
    putStrLn $ "Which color do you associate with the number "
      ++ show a ++ "?"
    color <- getLine
    return color
  putStrLn "The colors tha you associate with 1, 2, 33 and 4 are: "
  mapM putStrLn colors