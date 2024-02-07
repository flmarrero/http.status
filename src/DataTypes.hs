{-# LANGUAGE DeriveGeneric #-}

module DataTypes
  ( HttpStatus (..),
  )
where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)

data HttpStatus = HttpStatus
  { status :: Integer,
    summary :: String,
    description :: String
  }
  deriving (Eq, Show, Generic)

instance ToJSON HttpStatus

instance FromJSON HttpStatus