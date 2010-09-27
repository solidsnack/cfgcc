
module System.CFGCC.Acts.Atomic where

import Data.Set

import Data.Text

import System.CFGCC.Names
import System.CFGCC.Passwd


{-| FS acts all set a property of an implicit filesystem object. 
 -}
data FS where
  = EnsureMode Path ModeSpec
  | EnsureOwnerShip Path (Maybe User) (Maybe Group)
  | EnsureContents Path

data Passwd where
  = EnsureUser User (Maybe Password)          --  Password, as hash or literal.
                    (Maybe UID)               --  Numeric ID.
                    (Maybe Group)             --  Primary group.
                    (Maybe Text)              --  Comment.
                    (Maybe Path)              --  Home.
                    (Maybe Path)              --  Shell.
  | EnsureGroup Group (Maybe GID)             --  Numeric ID.
  | EnsureMembership Group (Set User)         --  Members to include.
                           (Set User)         --  Members to exclude.

