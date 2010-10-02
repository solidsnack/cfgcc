
{-# LANGUAGE TypeFamilies
           , EmptyDataDecls
  #-}

module System.CFGCC.Spec where

import Data.Word
import Data.String

import Data.Text




data Spec e where
  Is                        ::  (Entry e) => Name e -> Info e -> Spec e
  IsNot                     ::  (Entry e) => Name e -> Maybe (Info e) -> Spec e


class Entry thing where
  data Name thing           ::  *
  data Info thing           ::  *
  check                     ::  Name thing -> Maybe (Info thing) -> IO Bool
  remove                    ::  Name thing -> IO ()
  create                    ::  Name thing -> Info thing -> IO ()




data User
instance Entry User where
  data Name User             =  Username Text | UID Word16
  data Info User             =  User (Maybe Password)
                                     (Maybe Word16)
                                     (Maybe (Name Group))
                                     (Maybe (Name FSObject))
                                     (Maybe (Name FSObject))


data Group
instance Entry Group where
  data Name Group            =  Groupname Text | GID Word16
  data Info Group            =  Group (Maybe Password) (Maybe Word16)


data Password                =  Literal Text | Hashed Text
   deriving (Eq, Show, Ord)                          




data FSObject
instance Entry FSObject where
  data Name FSObject         =  Path Text
  data Info FSObject         =  File (Maybe ContentsChecked)
                                     (Maybe Mode)
                                     (Maybe Ownership)
                             |  Directory (Maybe Mode) (Maybe Ownership)
                             |  Link (Maybe (Name FSObject))

             
data Mode                    =  Mode Ternary Ternary Ternary Ternary -- user
                                     Ternary Ternary Ternary Ternary -- group
                                     Ternary Ternary Ternary Ternary -- other
                                  -- r       w       x       s/t
data Ternary                 =  Plus | Zero | Minus

data Ownership


newtype ContentsChecked      =  ContentsChecked Bool


