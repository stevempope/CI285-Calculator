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
        <p>
            <a href=@{DivR 8 2}> HTML division
        <p>
            <a href=@{DivR 8 2}?_accept=application/json>JSON division
        <form action="http://localhost:3000/add/" method=get>
            Value X <input type = "number" name = "x"/>
            Value Y <input type = "number" name = "y"/>
            Calculate! <input type = "Submit" value = "Add"/>
    |]
