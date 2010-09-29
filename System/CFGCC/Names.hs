
{-| Namespaces for controlled resources. Filesystem and passwd DB entries
    occupy different namespaces. There are several passwd namespaces.
 -}

module System.CFGCC.Names
  ( User(..)
  , Group(..)
  , Path(..)
  ) where

import System.CFGCC.PasswdDB
import System.CFGCC.FSLayout

