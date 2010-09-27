
{-| Namespaces for controlled resources. Filesystem and passwd DB entries
    occupy different namespaces. There are several passwd namespaces.
 -}

module System.CFGCC.Names where

import Data.String
import Data.Word

import Data.Text

import System.CFGCC.Passwd


newtype Path                 =  Path Text
 deriving (Eq, Show, Ord, IsString)

data User                    =  Username UNick | UserID UID
 deriving (Eq, Show, Ord)

data Group                   =  Groupname GNick | GroupID GID
 deriving (Eq, Show, Ord)

