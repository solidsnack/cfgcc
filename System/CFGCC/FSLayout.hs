
module System.CFGCC.FSLayout where

import Data.String
import Data.Word

import Data.Text


newtype Path                 =  Path Text
 deriving (Eq, Show, Ord)

instance IsString Path where
  fromString s | any (== '\0') s = error "Null is not allowed in paths."
               | otherwise   =  (Path . pack) s


data ObjectSpec              =  Symlink Path -- ^ Link to source.
                             |  Directory
                             |  File Bool -- ^ Flag to check file contents.
 deriving (Eq, Show, Ord)

