
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Add where

import Foundation
import Yesod.Core
import Yesod.Form
import Home

getAddR :: Int -> Int -> Handler TypedContent
getAddR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Addition"
        [whamlet|#{x} + #{y} = #{z}|]
    provideJson $ object ["result" .= z]
  where
    z = x + y

postAddAdvR :: Handler Html
postAddAdvR = do
     ((addRes,_),_) <- runFormPost renderAdd
     case addRes of
       FormSuccess add -> do
          defaultLayout $ do
            [whamlet| 
             Success
            |]
       _ -> undefined
         
