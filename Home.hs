{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core
import Yesod.Form
import Data.Text
import Control.Applicative ((<$>),(<*>))

{-declare the Add data type. 
Something of type add 
has the information 
that can be passed
to the handler AddR
This is where we define
what goes in a form-}
data Add = Add {
valx :: Int
,operand :: Text
,valy :: Int
}
  deriving Show
{-The form that handles add
This builds the fram of the 
form with no data type-}
addAForm :: AForm Handler Add
addAForm = Add
{- <$> and <*> are operators used in the example on the Yesod Book Forms page-}
{-AREQ = REQUIRED-}
  <$> areq intField "Value X" Nothing
  <*> areq textField "Operator" (Just "+")
  <*> areq intField "Value Y" Nothing

{-Render the form on the page, glue together all the above bits-}
renderAdd :: Html -> MForm Handler (FormResult Add, Widget)
renderAdd = renderTable addAForm

getHomeR :: Handler Html
getHomeR = do
    (addX, addY) <- generateFormPost renderAdd
    defaultLayout $ do
    setTitle "15836791 Calculator"
    [whamlet|
        <h1> Basic Addition
        <p>
            <a href=@{AddR 5 7}>HTML addition
        <p>
            <a href=@{AddR 5 7}?_accept=application/json>JSON addition
        <h1> Basic Subtraction
        <p>
            <a href=@{SubR 3 9}> HTML subtraction
        <p>
            <a href=@{SubR 3 9}?_accept=application/json>JSON subtraction
        <h1> Basic Multiplication
        <p>
            <a href=@{MulR 5 8}> HTML multiplication
        <p>
            <a href=@{MulR 5 8}?_accept=application/json>JSON multiplication
        <h1> Basic Division
        <p>
            <a href=@{DivR 8 2}> HTML division
        <p>
            <a href=@{DivR 8 2}?_accept=application/json>JSON division
        <h1> Form Addition
        
        <form method=post action=@{AddAdvR} enctype=#{addY}>
            ^{addX}
            <button>Submit
    |]
