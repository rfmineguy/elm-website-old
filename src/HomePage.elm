module HomePage exposing (..)

import Element as El -- exposing (fillPortion, spacing, padding, row, width, fill, rgb255, el, centerX, text, Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)


myRowOfStuff : El.Element msg
myRowOfStuff =
    El.row [ El.width El.fill, El.centerY, El.spacing 30 ]
        [ myElement
        , myElement
        , El.el [ El.alignRight ] myElement
        ]


myElement : El.Element msg
myElement =
    El.el
        [ Background.color (El.rgb255 240 0 245)
        , Font.color (El.rgb255 255 255 255)
        , Border.rounded 3
        , El.padding 30
        ]
        (El.text "stylish!")

layout : El.Element msg
layout =
  El.column [ El.width El.fill ] [ header, aboutMe, projects ]

white : El.Color
white = El.rgb255 255 255 255

header : El.Element msg
header =
  El.column [ El.width El.fill, El.centerX, El.padding 0, El.spacing 0 ]
      [
        El.el [ El.centerX, El.padding 30, Font.color white, Font.size 40 ] (El.text "I am Riley Fischer")
       ,El.el [ El.centerX, El.padding 30, Font.color white, Font.size 18 ] (El.text "Programmer") 
      ]

card : String -> El.Element msg -> El.Element msg
card title element =
  El.row [El.spacing 30, El.width El.fill, El.paddingXY 100 40] [
    El.column [ El.centerX, El.width El.fill, Background.color white, El.spacing 30, El.padding 10, Border.rounded 4 ] [
      El.el [Font.size 35] (El.text title),
      El.column [ El.width (El.fillPortion 2)] [],
      element,
      El.column [ El.width (El.fillPortion 2)] []
    ]
  ]

imageOfMe : El.Element msg
imageOfMe = El.image [ El.alignLeft, El.width (El.fill |> El.maximum (86 * 4)), El.height El.fill ] { description = "", src = "../assets/riley_photo.jpeg" }

aboutMe : El.Element msg
aboutMe =
  card "About Me" (
    El.row [ El.width El.fill ] [
      El.column [ El.width El.fill, El.padding 3, El.spacing 20 ] [
        imageOfMe
      , El.el [] (El.paragraph [] [El.text """My name is Riley Fischer. My pride and joy is programming
                      and constantly pushing my skills further and further 
                      into unknown territory. I am mostly self-taught, and started off programming in Java for Minecraft modding, then slowly moved into more 
                      complicated projects. Because I was much younger I don't have many records of my first projects."""])
      , El.el [] (El.paragraph [] [El.text """I do however have most of my newer projects posted in github and listed further down this page. My most recent and most 
                  robust project to date is the beginnings of a basic game engine. I built it out of curiosity in OpenGL, and got lost in
                  how cool I found it so it grew into a much larger project than I initially intended very quickly"""])
      ]
   ])

-- project : String -> El.Element msg

projects : El.Element msg
projects = 
  card "Projects" (
    El.column [] []
    )

-- aboutMe = div [] [
--   h1 [] [ text "About Me" ]
--   ,p [] [ text "My name is Riley Fischer. My pride and joy is programming and constantly pushing my skills further and further into unknown territory. I am mostly self-taught, and started off programming in Java for Minecraft modding, then slowly moved into more complicated projects. Because I was much younger I don't have many records of my first projects. " ]
--   ]


-- new_project title image desc o
--   div [ class "flex" ] [
--     h6  [] [ text title ]
--   , img [ src image ] []
--   , p   [] [ text desc]
--   ]
-- 
-- projects =
--   Grid.container []
--     [ CDN.stylesheet
--     , Grid.row []
--       [ Grid.col []
--         [ new_project "OpenGL Engine" "images/openglengine.png" "This is a project I've been working on to sharpen my skills in the C programming language and OpenGL"
--         , new_project "Pong" "images/pong.png" "No desc yet"
--         , new_project "RF Lang" "images/rflang.png" "No desc yet"
--         ]
--       ]
--     ]
  --div [ class "container"] [
  --  div [ class "row"] [
  --    h1 [] [ text "Projects" ]
  --    , new_project "OpenGL Engine" "images/openglengine.png" "This is a project I've been working on to sharpen my skills in the C programming language and OpenGL"
  --    , new_project "Pong" "images/pong.png" "No desc yet"
  --    , new_project "RF Lang" "images/rflang.png" "No desc yet"
  --  ]
  --]
