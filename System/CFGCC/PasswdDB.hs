
module System.CFGCC.PasswdDB where

import Data.String
import Data.Word

import Data.Text

import System.CFGCC.FSLayout


data User                    =  Username UNick | UserID UID
 deriving (Eq, Ord, Show)

data Group                   =  Groupname GNick | GroupID GID
 deriving (Eq, Ord, Show)


newtype UNick                =  UNick Nick
 deriving (Eq, Ord, Show, IsString)

newtype UID                  =  UID ID
 deriving (Eq, Ord, Show, IsString)


newtype GNick                =  GNick Nick
 deriving (Eq, Ord, Show, IsString)

newtype GID                  =  GID ID
 deriving (Eq, Ord, Show, IsString)


newtype Nick                 =  Nick Text
 deriving (Eq, Ord, Show, IsString)

newtype ID                   =  ID Word16
 deriving (Eq, Ord, Show, Num)


data Password                =  Hashed Text | Literal Text
 deriving (Eq, Ord, Show)


data (Monad m) => UserEntry m = UserEntry (m UNick) --  Nick.
                                          (m Password) --  Password.
                                          (m UID) --  Numeric ID.
                                          (m Group) --  Primary group.
                                          (m Text) --  Comment.
                                          (m Path) --  Home.
                                          (m Path) --  Shell.

