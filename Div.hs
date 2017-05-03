{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Div where

import Foundation
import Yesod.Core

getDivR :: Int -> Int -> Handler TypedContent
getDivR x 0 = selectRep $ do
    provideRep $ defaultLayout $ do
         setTitle "Divide Zero"
         [whamlet|#{x} `div` 0 = You cannot Divide by 0|]
getDivR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Division"
        [whamlet|#{x} `div` #{y} = #{z}|]
    provideJson $ object ["result" .= z]
  where
    z = x `div` y
