module Main exposing (..)

import HomePage exposing (..)
import Element exposing (..)
import Element.Background exposing (..)
import Framework
import Html exposing (Html)
import Browser
import Html.Attributes

-- Notes:
--  Really cool animation library : https://package.elm-lang.org/packages/andrewMacmurray/elm-simple-animation/latest/
--   Demo : https://elm-simple-animation-examples.vercel.app/

-- Easing function reference
--   https://easings.net/

type alias Model = Int
type alias Flags = {}
type Msg =
  NothingYet

init : Model
init = 0

view : Model -> Html msg
view model = 
  Framework.responsiveLayout [Element.Background.color (Element.rgb255 105 126 171), Element.htmlAttribute (Html.Attributes.style "flex-container" "")] HomePage.animatedLayout

update : Msg -> Model -> Model
update msg model = model

main : Program () Model Msg
main = 
  Browser.sandbox {
    init = init,
    view = view,
    update = update
  }
