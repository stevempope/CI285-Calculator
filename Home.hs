{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "15836791 Calculator"
    [whamlet|
        <p>
            <a href=@{AddR 5 7}>HTML addition
        <p>
            <a href=@{AddR 5 7}?_accept=application/json>JSON addition
        <p>
            <a href=@{SubR 3 9}> HTML subtraction
        <p>
            <a href=@{SubR 3 9}?_accept=application/json>JSON subtraction
        <p>
            <a href=@{MulR 5 8}> HTML multiplication
        <p>
            <a href=@{MulR 5 8}?_accept=application/json>JSON multiplication
        <form>
            Value X <input type = "number" id = "x"/>
            Value Y <input type = "number" id = "y"/>
            Calculate! <input type = "Submit" value = "Submit"/>
       <select id="functions">
    |]
