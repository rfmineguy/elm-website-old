module Main exposing (..)

import HomePage exposing (..)
import Element exposing (..)
import Element.Background exposing (..)

type alias Model = Int
type alias Flags = {}
type Msg =
  NothingYet

main =
  Element.layout [Element.Background.color (Element.rgb255 39 39 39)] HomePage.layout
