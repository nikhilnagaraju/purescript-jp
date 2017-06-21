module Main where

import Prelude (discard, map)
import Data.AddressBook (emptyBook, findEntry, findStreet, insertEntry, showAddress, showEntry)
import Control.Monad.Eff.Console (log, logShow)

sherlock_address ={ street : "12, baker", city   :"NW", state  : "CA"}
watson_address ={ street : "13, baker", city   :"NW", state  : "CA"}
jamie_address ={ street : "14, baker", city   :"NW", state  : "CA"}


sherlock ={firstName: "sherlock", lastName: "holmes", address: sherlock_address}
watson ={firstName: "john", lastName: "watson", address: watson_address}
jamie ={firstName: "jamie", lastName: "mort", address: jamie_address}

mybook = insertEntry sherlock emptyBook
mybook1 = insertEntry watson mybook
mybook2 = insertEntry jamie mybook1



main = do 

--Display addresses	
	log("--addresses--")
	logShow (showAddress jamie_address)
	logShow (showAddress sherlock_address)
	logShow (showAddress watson_address)

--Display All of entries/records
	log("--Entry--")
	logShow (showEntry jamie)
	logShow (showEntry sherlock)
	logShow (showEntry watson)

-- Find Entry by firstName and lastName using findEntry funtion
	log("--Find Entry by firstName and lastName using findEntry funtion--")
	logShow(map showEntry (findEntry "sherlock" "holmes" mybook2))
-- Find Entry by street using findStreet funtion
	log("--Find Entry by street using findStreet funtion--")
	logShow(map showEntry (findStreet "13, baker" mybook2))