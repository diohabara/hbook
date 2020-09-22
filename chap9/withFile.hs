withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO abs
withFile name mode f =
  bracket
    (openFile name mode)
    (\handle -> hClose handle)
    (\handle -> f handle)