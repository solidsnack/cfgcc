
module System.CFGCC.Nick where

import qualified Data.Text as Text
import Data.Text (Text)
import Data.String


newtype Nick                 =  Nick Text
 deriving (Eq, Ord, Show, IsString)

instance IsString Nick where
  fromString s  =  case check t of Ok   ->  Nick t
                                   err  ->  error (message err)
   where
    t                        =  Text.pack s


{-| Check if text is an acceptable UNIX username.
 -}
check                       ::  Text -> Check
check
  | Text.null t              =  Ok
  | "@" `Text.isPrefixOf` t  =  BadLeadingNIS '@'
  | "+" `Text.isPrefixOf` t  =  BadLeadingNIS '+'
  | "-" `Text.isPrefixOf` t  =  BadLeadingNIS '-'
  | (== ':') `Text.any` t    =  Bad ':'


{-| Characterizes success or failure of username check. 
 -}
data Check                   =  Ok | BadLeadingNIS Char | Bad Char


message                     ::  Check -> String
message Ok                   =  "Okay."
message (BadLeadingNIS c)
  = "Leading `" ++ [c] ++"' interferes with NIS naming conventions."
message (BadChar c) = "Char `" ++ [c] ++"' is rejected by `useradd.'"

