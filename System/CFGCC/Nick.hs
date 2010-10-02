
module System.CFGCC.Nick where

import qualified Data.Text as Text
import Data.Text (Text)
import Data.String


newtype Nick                 =  Nick Text
 deriving (Eq, Ord, Show)

instance IsString Nick where
  fromString s
    = case check t of Ok    ->  Nick t
                      err   ->  error (message err)
   where
    t                        =  Text.pack s


{-| Check if text is an acceptable UNIX username.
 -}
check                       ::  Text -> Check
check t
  | Text.null t              =  Empty
  | "@" `Text.isPrefixOf` t  =  BadLeadingNIS '@'
  | "+" `Text.isPrefixOf` t  =  BadLeadingNIS '+'
  | "-" `Text.isPrefixOf` t  =  BadLeadingNIS '-'
  | (== ':') `Text.any` t    =  Bad ':'
  | otherwise                =  Ok


{-| Characterizes success or failure of username check. 
 -}
data Check                   =  Ok | Empty | BadLeadingNIS Char | Bad Char


message                     ::  Check -> String
message Ok                   =  "Okay."
message Empty                =  "Empty usernames are not allowed."
message (BadLeadingNIS c)
  = "Leading `" ++ [c] ++"' interferes with NIS naming conventions."
message (Bad c) = "Char `" ++ [c] ++"' is rejected by `useradd.'"

