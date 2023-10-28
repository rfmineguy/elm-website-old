module Main exposing (..)

import HomePage exposing (..)
import Element exposing (..)
import Element.Background exposing (..)
import Framework

type alias Model = Int
type alias Flags = {}
type Msg =
  NothingYet

main =
  Framework.responsiveLayout [Element.Background.color (Element.rgb255 105 126 171)] HomePage.layout
