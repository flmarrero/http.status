{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module App
  ( run,
  )
where

import Codes
import DataTypes (HttpStatus)
import Network.Wai.Handler.Warp (defaultSettings, runSettings, setBeforeMainLoop, setPort)
import Servant (Application, Capture, Get, Handler, JSON, Proxy (Proxy), Server, serve, (:>))
import System.IO (hPutStrLn, stderr)

type HttpApi =
  "status" :> Capture "statusId" Integer :> Get '[JSON] HttpStatus

httpApi :: Proxy HttpApi
httpApi = Proxy

run :: IO ()
run = do
  runSettings settings =<< mkApp
  where
    port = 8080
    settings =
      setPort port $
        setBeforeMainLoop (hPutStrLn stderr ("listening on port " ++ show port)) $
          defaultSettings

mkApp :: IO Application
mkApp = return $ serve httpApi server

server :: Server HttpApi
server = getStatusById

getStatusById :: Integer -> Handler HttpStatus
getStatusById x = return $ searchCode x

searchCode :: Integer -> HttpStatus
searchCode 100 = continue
searchCode 101 = switchingProtocols
searchCode 102 = processing
searchCode 103 = earlyHints
searchCode 200 = ok
searchCode 201 = created
searchCode 202 = accepted
searchCode 203 = nonAuthoritativeInformation
searchCode x = unknown x