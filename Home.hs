{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|
        <p>
            <a href=@{AddR 5 7}>HTML addition
        <p>
            <a href=@{AddR 5 7}?_accept=application/json>JSON addition
        <p>
            <a href=@{SubR 3 9}> HTML subtraction
        <p>
            <a href=@{SubR  3 9}?_accept=application/json>JSON subtraction
        <p>
            <a href=@{MulR 5 8}> HTML multiplication
        <p>
            <a href=@{MulR 5 8}?_accept=application/json>JSON multiplication
		<p>
			<a href=@{DivR 5 8}> HTML Division
        <p>
            <a href=@{DivR 5 8}?_accept=application/json>JSON Division
		<p>
			<a href=@{DivR 5 0}> HTML Division by 0
        <p>
            <a href=@{DivR 5 0}?_accept=application/json>JSON Division by 0
		<p>
			<a href=@{DivR 0 8}> HTML 0 Divide by INT
        <p>
            <a href=@{DivR 0 8}?_accept=application/json>JSON 0 Divide by INT
    |]
