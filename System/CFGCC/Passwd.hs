
module System.CFGCC.Passwd where

import Data.String
import Data.Word

import Data.Text


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

