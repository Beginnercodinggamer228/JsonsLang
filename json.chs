import System.IO
import Data.Json
import System.Random

-- Function to generate a random string of given length
generateRandomString :: Int -> String
generateRandomString length = concat $ replicate length (randomElement ['a'..'z'] ++ randomElement ['0'..'9'])

-- Function to create a JSON file with the provided data
writeJsonValueToFile :: String -> String -> Value -> IO ()
writeJsonValueToFile filename extension value = do
  file <- openFile (filename ++ "." ++ extension) WriteMode
  writeValue file value

-- Main function
main :: IO ()
main = do
  username <- getLine
  let password = generateRandomString $ randomInt 10 20
  let data = objectFromList ["username" :: String, "password" :: String, "iflogin?" :: Bool] `appended` [username, password]
  writeJsonValueToFile "File" "json" data