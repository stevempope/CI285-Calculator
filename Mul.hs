{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Mul where

import Foundation
import Yesod.Core

getMulR :: Int -> Int -> Handler TypedContent
getMulR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Multiplication"
        [whamlet|#{x} * #{y} = #{z}|]
    provideJson $ object ["result" .= z
                         ,"calculation" .= z]
  where
    z = x * y
