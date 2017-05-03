{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE ViewPatterns      #-}
{-# LANGUAGE MultiParamTypeClasses #-}
module Foundation where

import Yesod.Core
import Yesod.Form

data App = App

{-Handles the state of the form, either success, failure -}
instance RenderMessage App FormMessage where
    renderMessage _ _ =  defaultFormMessage

mkYesodData "App" $(parseRoutesFile "routes")

instance Yesod App
