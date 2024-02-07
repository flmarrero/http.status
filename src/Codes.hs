{-# OPTIONS_GHC -Wno-missing-export-lists #-}

module Codes where

import DataTypes (HttpStatus (HttpStatus))

unknown :: Integer -> HttpStatus
unknown status = HttpStatus status "Unknown status code" "This status code does not exist."

continue :: HttpStatus
continue = HttpStatus 100 "Continue" "This interim response indicates that the client should continue the request or ignore the response if the request is already finished."

switchingProtocols :: HttpStatus
switchingProtocols = HttpStatus 101 "Switching Protocols" "This code is sent in response to an Upgrade request header from the client and indicates the protocol the server is switching to."

processing :: HttpStatus
processing = HttpStatus 102 "Processing" "This code indicates that the server has received and is processing the request, but no response is available yet."

earlyHints :: HttpStatus
earlyHints = HttpStatus 103 "Early Hints" "This status code is primarily intended to be used with the Link header, letting the user agent start preloading resources while the server prepares a response or preconnect to an origin from which the page will need resources."

ok :: HttpStatus
ok = HttpStatus 200 "OK" "The request succeeded. The result meaning of success depends on the HTTP method."

created :: HttpStatus
created = HttpStatus 201 "Created" "The request succeeded, and a new resource was created as a result. This is typically the response sent after POST requests, or some PUT requests."

accepted :: HttpStatus
accepted = HttpStatus 202 "Accepted" "The request has been received but not yet acted upon. It is noncommittal, since there is no way in HTTP to later send an asynchronous response indicating the outcome of the request. It is intended for cases where another process or server handles the request, or for batch processing."

nonAuthoritativeInformation :: HttpStatus
nonAuthoritativeInformation = HttpStatus 203 "Non-Authoritative Information" "This response code means the returned metadata is not exactly the same as is available from the origin server, but is collected from a local or a third-party copy. This is mostly used for mirrors or backups of another resource. Except for that specific case, the 200 OK response is preferred to this status."