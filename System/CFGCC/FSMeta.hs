
module System.CFGCC.FSMeta where

import Data.String
import Data.Word

import Data.Text

import System.CFGCC.PasswdDB


data ModeSpec                =  ModeSpec TriState -- ^ User read bit.
                                         TriState -- ^ User write bit.
                                         TriState -- ^ User execute bit.
                                         TriState -- ^ Set UID bit.
                                         TriState -- ^ Group read bit.
                                         TriState -- ^ Group write bit.
                                         TriState -- ^ Group execute bit.
                                         TriState -- ^ Set GID bit.
                                         TriState -- ^ Other read bit.
                                         TriState -- ^ Other write bit.
                                         TriState -- ^ Other execute bit.
                                         TriState -- ^ Sticky bit.
 deriving (Eq, Ord, Show)

data TriState                =  On | Indifferent | Off
 deriving (Eq, Ord, Show)


data OwnershipSpec           =  OwnershipSpec (Maybe User) (Maybe Group)
 deriving (Eq, Ord, Show)

