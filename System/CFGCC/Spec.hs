
{-# LANGUAGE TypeFamilies
           , EmptyDataDecls
  #-}

module System.CFGCC.Spec where

import Data.Word
import Data.String

import Data.Text




class (Monad m) => StaticUNIXThing thing m where
  data Name thing           ::  *
  data Spec thing m         ::  *




data User
instance StaticUNIXThing User Maybe where
  data Name User             =  Username Text | UID Word16
  data Spec User Maybe       =  User (Maybe Password)
                                     (Maybe Word16)
                                     (Maybe (Name Group))
                                     (Maybe (Name FSEntry))
                                     (Maybe (Name FSEntry))


data Group
instance StaticUNIXThing Group Maybe where
  data Name Group            =  Groupname Text | GID Word16
  data Spec Group Maybe      =  Group (Maybe Password) (Maybe Word16)


data Password                =  Literal Text | Hashed Text
   deriving (Eq, Show, Ord)                          




data FSEntry
instance StaticUNIXThing FSEntry Maybe where
  data Name FSEntry          =  Path Text
  data Spec FSEntry Maybe    =  File (Maybe ContentsChecked)
                                     (Maybe Mode)
                                     (Maybe Ownership)
                             |  Directory (Maybe Mode) (Maybe Ownership)
                             |  Link (Maybe (Name FSEntry))

             
data Mode                    =  Mode Ternary Ternary Ternary Ternary -- user
                                     Ternary Ternary Ternary Ternary -- group
                                     Ternary Ternary Ternary Ternary -- other
                                  -- r       w       x       s/t
data Ternary                 =  Plus | Zero | Minus

data Ownership


newtype ContentsChecked      =  ContentsChecked Bool


