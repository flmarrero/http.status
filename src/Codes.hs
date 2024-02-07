module Codes
  ( continue,
  )
where

import DataTypes (HttpStatus (HttpStatus))

continue :: HttpStatus
continue = HttpStatus 100 "Continue" ""