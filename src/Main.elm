module Main exposing (..)

import HomePage exposing (..)
import Element exposing (..)
import Element.Background exposing (..)
import Framework
import Html exposing (Html)
import Browser
import Html.Attributes

type alias Model = Int
type alias Flags = {}
type Msg =
  NothingYet

initialModel = 0

view : Model -> Html msg
view model = 
  Framework.responsiveLayout [Element.Background.color (Element.rgb255 105 126 171), Element.htmlAttribute (Html.Attributes.style "flex-container" "")] HomePage.layout

update : Msg -> Model -> Model
update msg model = model

main : Program () Model Msg
main = 
  Browser.sandbox {
    init = initialModel,
    view = view,
    update = update
  }
