module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head, tail, null)
import Data.Maybe (Maybe)
import Partial.Unsafe
type Address =
  { street :: String
  , city   :: String
  , state  :: String
  }

type Entry =
  { firstName :: String
  , lastName  :: String
  , address   :: Address
  }

type AddressBook = List Entry

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <> addr.city <> ", " <> addr.state

showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <> entry.firstName <> ": " <> showAddress entry.address

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = head <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

findStreet :: String ->  AddressBook -> Maybe Entry
findStreet street book = head $ filter filterEntry book
	where
	filterEntry :: Entry -> Boolean
	filterEntry entry = entry.address.street == street

-- showBook :: AddressBook -> String
-- showBook book = 
--   (showEntry $ (\x-> if null x then empty else head x) book) <> (showBook $ (\x-> if null x then empty else tail x) book)