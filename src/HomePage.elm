module HomePage exposing (..)

import Element as El -- exposing (fillPortion, spacing, padding, row, width, fill, rgb255, el, centerX, text, Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input

import Html exposing (br)

layout : El.Element msg
layout =
  El.column [ El.width El.fill ] [ header, aboutMe, projects, meAsADeveloper, work, volunteer, education ]

white : El.Color
white = El.rgb255 255 255 255

blue : El.Color
blue = El.rgb255 0 0 0xEE

grey : El.Color
grey = El.rgb255 210 210 210

darkGrey : El.Color
darkGrey = El.rgb255 110 110 110

header : El.Element msg
header =
  El.column [ El.width El.fill, El.centerX, El.padding 0, El.spacing 0 ]
      [
        El.el [ El.centerX, El.padding 30, Font.color white, Font.size 40 ] (El.text "I am Riley Fischer")
      , El.el [ El.centerX, El.padding 30, Font.color white, Font.size 18 ] (El.text "Programmer")
      ]

-- Utility function for making card views
card : String -> El.Element msg -> El.Element msg
card title element =
  El.row [El.spacing 30, El.width El.fill, El.paddingXY 100 40] [
    El.column [ El.centerX, El.width El.fill, Background.color white, El.spacing 30, El.padding 30, Border.rounded 4 ] [
      El.el [Font.size 30] (El.text title)
    , El.column [ El.width (El.fillPortion 2)] []
    , element
    , El.column [ El.width (El.fillPortion 2)] []
    ]
  ]

imageOfMe : El.Element msg
imageOfMe = El.image [ El.alignLeft, El.width (El.fill |> El.maximum (86 * 4)), El.height El.fill ] { description = "", src = "assets/riley_photo.jpeg" }

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
    ]
  )

hyperlink : String -> El.Element msg
hyperlink label =
  Input.button [ ] { onPress = Nothing, label = El.text label }

project : String -> String -> (String, Int, Int) -> String -> El.Element msg
project name url (image, width, height) desc =
  El.column [ El.alignTop, El.width El.fill, El.spacing 20 ] [
    El.el [ El.centerX ] ( El.link [Font.underline, Font.color blue] { url = url, label = El.text name } )
  , El.image [ El.centerX, El.width (El.fill |> El.maximum (width)), El.height (El.fill |> El.maximum (height)) ] { description = desc, src = image }
  , El.el [ El.centerX ] ( El.text desc )
  ]

projects : El.Element msg
projects =
  card "Projects" (
    El.row [ El.width El.fill ] [
      project "OpenGL Engine" "https://github.com/rfmineguy/opengl-engine" ("assets/opengl-engine-display.png", 300, 300) "2020-2022"
    , project "Firefly Lib" "https://github.com/rfmineguy/firefly-lib" ("assets/fflib_pong.png", 300, 300) "A graphics library I've been working on in spare time"
    , project "RF Lang" "https://github.com/rfmineguy/rflang-2" ("assets/rflang_logo.png", 300, 300) "A project I've been working on in spare time"
    ]
  )

meAsADeveloper : El.Element msg
meAsADeveloper =
  card "Me As A Developer" (
    El.row [ El.width El.fill ] [
      El.column [ El.alignTop, El.width (El.fillPortion 1), El.spacing 20 ] [
        El.image [ El.centerX, El.width (El.fill |> El.maximum 300) ] { description = "", src = "assets/nvim_screenshot.png" }
      ]
    , El.column [ El.alignTop, El.width (El.fillPortion 1), El.spacing 20] [
        El.el [ Font.bold ] (El.text """I can be comfortable in front 
of almost any operating system""")
      , El.el [ ] (El.text "Windows - 5 to 6 years")
      , El.el [ ] (El.text "Linux - 1 to 2 years")
      , El.el [ ] (El.text "MacOS - 1 to 2 years")
      ] 
    , El.column [ El.alignTop, El.width (El.fillPortion 1), El.spacing 20 ] [
        El.el [ Font.bold ] (El.text "Programming Languages")
      , El.row [ ] [El.el [] (El.text "Java - 2 to 3 years"), El.el [ Font.italic ] (El.text " (Mostly through Minecraft)")]
      , El.row [ ] [El.el [] (El.text "C++  - 2 years")]
      , El.row [ ] [El.el [] (El.text "C    - 1 year")]
      ]
    ]
  )

experienceElement : String -> String -> String -> El.Element msg
experienceElement time title description =
  El.column [ El.width El.fill, El.spacing 15, El.padding 15, Border.rounded 10, Border.width 2, Border.color darkGrey, Background.color grey  ] [
    El.el [Font.size 17] (El.text time)
  , El.el [Font.size 22, Font.bold] (El.text title)
  , El.el [Font.size 17] (El.paragraph [] [El.text description])
  ]

work : El.Element msg
work = 
  card "Work" (
    El.column [ El.width El.fill, El.spacing 50 ] [
      experienceElement "2022-2023" "Coder School" "I work as a code coach for 10-15 year olds working on programming projects"
    , experienceElement "2021-2022" "Tutor" "I worked as a tutor for an 8 year old 3rd grader to help get him through the work he needs to get done, and along with that comes a lot of me keeping him focused and on track."
    ]
    )

volunteer : El.Element msg
volunteer =
  card "Volunteer" (
    El.column [ El.width El.fill, El.spacing 50 ] [
      experienceElement "2022" "Beach Cleanup" "I went to Lake Tahoe to participate in a beach cleanup the day after 4th of July"
    , experienceElement "2016-2019" "School Cleanup" "I volunteered at my old elementary school to help keep the school looking clean and updated"
      ]
  )

educationElement : String -> String -> String -> El.Element msg
educationElement time title description =
  El.column [ El.width El.fill, El.spacing 15, El.padding 15, Border.rounded 10, Border.width 2, Border.color darkGrey, Background.color grey  ] [
    El.el [Font.size 17] (El.text time)
  , El.el [Font.size 22, Font.bold] (El.text title)
  , El.el [Font.size 17] (El.paragraph [] [El.text description])
  ]

education : El.Element msg
education =
  card "Education" (
    El.column [ El.width El.fill, El.spacing 50 ] [
      educationElement "2021-2022" "Computer Science AS (In Progress)" "Las Positas Community College"
      ]
  )
