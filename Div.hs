{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Mul where

import Foundation
import Yesod.Core

getDivR :: Int -> Int -> Handler TypedContent
getDivR x 0 = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Division Error"
        [whamlet|#{x} / #{y} = #{"Cannot Divide by Zero"}|]
    provideJson $ object ["result" .= "Cannot Divide by Zero"]
getDivR 0 y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Division"
        [whamlet|#{x} / #{y} = #{0}|]
    provideJson $ object ["result" .= 0
                         ,"calculation" .= 0]
getDivR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Division"
        [whamlet|#{x} / #{y} = #{z}|]
    provideJson $ object ["result" .= z
                         ,"calculation" .= z]
  where
    z = x / y
