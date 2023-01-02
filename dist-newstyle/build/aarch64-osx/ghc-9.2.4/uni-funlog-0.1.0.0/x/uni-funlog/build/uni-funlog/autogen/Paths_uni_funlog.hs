{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_uni_funlog (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/veekhere/.cabal/bin"
libdir     = "/Users/veekhere/.cabal/lib/aarch64-osx-ghc-9.2.4/uni-funlog-0.1.0.0-inplace-uni-funlog"
dynlibdir  = "/Users/veekhere/.cabal/lib/aarch64-osx-ghc-9.2.4"
datadir    = "/Users/veekhere/.cabal/share/aarch64-osx-ghc-9.2.4/uni-funlog-0.1.0.0"
libexecdir = "/Users/veekhere/.cabal/libexec/aarch64-osx-ghc-9.2.4/uni-funlog-0.1.0.0"
sysconfdir = "/Users/veekhere/.cabal/etc"

getBinDir     = catchIO (getEnv "uni_funlog_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "uni_funlog_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "uni_funlog_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "uni_funlog_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "uni_funlog_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "uni_funlog_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
