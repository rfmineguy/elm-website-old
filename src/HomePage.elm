module HomePage exposing (..)

import Element as El
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Simple.Animation as Animation exposing (Animation)
import Simple.Animation.Animated as Animated
import Simple.Animation.Property as P

easeAnimation : Animation
easeAnimation =
  Animation.fromTo
  { duration = 400
  , options = [ Animation.easeInQuart ]
  }
  [ P.opacity 0 ]
  [ P.opacity 1 ]

animatedLayout : El.Element msg
animatedLayout =
  animatedEl easeAnimation [] layout

animatedEl : Animation -> List (El.Attribute msg) -> El.Element msg -> El.Element msg
animatedEl =
  animatedUi El.el

animatedUi =
  Animated.ui
  {
    behindContent = El.behindContent
  , htmlAttribute = El.htmlAttribute
  , html = El.html
  }

layout : El.Element msg
layout =
  El.column [ El.width El.fill ] [ header, aboutMe, projects, meAsADeveloper, work, volunteer, education ]

white : El.Color
white = El.rgb255 255 255 255

blue : El.Color
blue = El.rgb255 0 0 0xEE

red : El.Color
red = El.rgb255 0xEE 0 0

grey : El.Color
grey = El.rgb255 210 210 210

darkGrey : El.Color
darkGrey = El.rgb255 90 90 90

asset_dir : String
asset_dir = "./assets/"  -- this shouldn't be changed unless the assets move somewhere else (the ./ is also important)

header : El.Element msg
header =
  El.column [ El.width El.fill, El.centerX, El.padding 0, El.spacing 0 ]
      [
        El.el [ El.centerX, El.padding 30, Font.color white, Font.size 40 ] (El.text "I am Riley Fischer")
      , El.el [ El.centerX, El.padding 30, Font.color white, Font.size 18 ] (El.text "Programmer")
      ]

-- Utility function for making card view
card : String -> El.Element msg -> El.Element msg
card title element =
  El.wrappedRow [ El.spacing 30, El.width El.fill, El.paddingXY 100 20 ] [
    El.column [ El.centerX, El.width El.fill, Background.color white, El.spacing 30, El.padding 30, Border.rounded 4 ] [
      El.el [Font.size 30, Font.bold] (El.text title)
    , El.column [ El.width (El.fillPortion 2)] []
    , element
    , El.column [ El.width (El.fillPortion 2)] []
    ]
  ]

imageOfMe : El.Element msg
imageOfMe = El.image [ El.alignLeft, El.width El.fill, El.height El.fill ] { description = "", src = asset_dir ++ "riley_photo.jpeg" }

aboutMe : El.Element msg
aboutMe =
  card "About Me" (
    El.wrappedRow [ El.width El.fill ] [
      imageOfMe
    , El.column [ El.width El.fill, El.padding 10, El.spacing 20 ] [
      El.el [ El.width (El.fill |> El.minimum 100)] (El.paragraph [] [El.text """My name is Riley Fischer. My pride and joy is programming
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

project : String -> String -> String -> (String, Int, Int) -> String -> El.Element msg
project name date url (image, width, height) desc =
  El.wrappedRow [ El.width El.fill, El.spacing 20, Border.rounded 10, Border.width 2, Border.color darkGrey, Background.color grey  ] [
    El.column [ El.width (El.fillPortion 1), El.height (El.fill), El.spacing 30, El.padding 20, Border.color darkGrey, Border.widthEach { bottom = 0, left = 0, top = 0, right = 1 }] [
      El.el [El.centerX, Font.bold, Font.underline, Font.size 20] (El.link [] {label = El.text name, url = url})
    , El.image [ El.centerX, El.centerY, Border.rounded 8, El.clip, El.centerX, El.width (El.fill |> El.maximum width), El.height (El.fill |> El.maximum height) ] { description = desc, src = image }
    ]
  , El.column [ El.spacing 5, El.padding 20, El.width (El.fillPortion 2), El.height El.fill ] [
      El.el [El.alignTop] (El.paragraph [Font.size 20] [El.text date])
    , El.el [El.alignTop] (El.paragraph [Font.size 20] [El.text desc])
    ]
  ]

project_more_info : El.Element msg
project_more_info = 
  El.wrappedRow [ El.width El.fill, El.spacing 20 ] [
    El.column [ El.width El.fill, El.height El.fill ] [
      El.el [] ( El.paragraph [] [ El.text "For more information go visit my github profile at https://github.com/rfmineguy!" ])
    ]
  ]

opengl_engine_description : String
opengl_engine_description = """This project is an attempt at making a somewhat functional game engine using opengl and a variety of other libraries"""

mirror_lib_description : String
mirror_lib_description = """This project was inspired by TheCodingTrain on YouTube. It is a \"simulation\" of how light might bounce off mirrors"""

fireflylib_description : String
fireflylib_description = """This project is a fully code driven game library that has the ability to faciliate very simple games"""

rflang_description : String
rflang_description = """An attempt to learn compiler development through designing my own language"""

projects : El.Element msg
projects =
  card "Projects" (
    El.column [ El.width El.fill, El.spacing 10 ] [
      project "MirrorLib"    "2021-2022" "https://github.com/rfmineguy/mirror-lib"  (asset_dir ++ "mirror_lib.png", 300, 300) mirror_lib_description
    , project "Firefly Lib"  "2022-2023" "https://github.com/rfmineguy/firefly-lib" (asset_dir ++ "fflib_pong.png", 300, 300)            fireflylib_description
    , project "RF Lang"      "2022-2023" "https://github.com/rfmineguy/rflang-2"    (asset_dir ++ "rflang_logo.png", 300, 300)           rflang_description
    , project_more_info
    ]
  )

meAsADeveloper : El.Element msg
meAsADeveloper =
  let entry element = El.column [ El.alignTop, El.width El.fill, El.height El.fill, El.spacing 20, El.padding 10, Border.width 2, Border.rounded 10, Background.color grey ] element in
  card "Me As A Developer" (
    El.wrappedRow [ El.width El.fill, El.spacing 10 ] [
      entry [
        El.el [Font.bold ] (El.text "Editors")
      , El.el [] (El.text "Neovim")
      , El.el [] (El.text "IntelliJ IDEA")
      , El.el [] (El.text "CLion")
      ]
    , entry [
        El.el [ Font.bold ] (El.text """I can be comfortable in front 
of almost any operating system""")
      , El.el [ ] (El.text "Windows - 5 to 6 years")
      , El.el [ ] (El.text "Linux - 1 to 2 years")
      , El.el [ ] (El.text "MacOS - 1 to 2 years")
      ] 
    , entry [
        El.el [ Font.bold ] (El.text "Programming Languages")
      , El.wrappedRow [ ] [El.el [] (El.text "Java - 2 to 3 years"), El.el [ Font.italic ] (El.text " (Mostly through Minecraft)")]
      , El.row [ ] [El.el [] (El.text "C++  - 2 years")]
      , El.row [ ] [El.el [] (El.text "C    - 1 year")]
      ]
    ]
  )

experienceElement : String -> String -> String -> El.Element msg
experienceElement time title description = 
  El.column [ El.width El.fill, El.spacing 15, El.padding 15, Border.rounded 10, Border.width 2, Border.color darkGrey, Background.color grey  ] [
    El.wrappedRow [] [El.el [Font.size 17] (El.text time)]
  , El.el [Font.size 22, Font.bold] (El.text title)
  , El.el [Font.size 17] (El.paragraph [] [El.text description])
  ]

educationElement : String -> String -> String -> El.Element msg
educationElement = experienceElement

work : El.Element msg
work = 
  card "Work" (
    El.column [ El.width El.fill, El.spacing 10 ] [
      experienceElement "2022-2023" "Coder School" "I work as a code coach for 10-15 year olds working on programming projects primarily in Unity C#"
    , experienceElement "2021-2022" "Tutor" "I worked as a tutor for an 8 year old 3rd grader to help get him through the work he needs to get done, and along with that comes a lot of me keeping him focused and on track."
    ]
  )

volunteer : El.Element msg
volunteer =
  card "Volunteer" (
    El.column [ El.width El.fill, El.spacing 10 ] [
      experienceElement "2022" "Beach Cleanup" "I went to Lake Tahoe to participate in a beach cleanup the day after 4th of July"
    , experienceElement "2016-2019" "School Cleanup" "I volunteered at my old elementary school to help keep the school looking clean and updated"
    ]
  )

education : El.Element msg
education =
  card "Education" (
    El.column [ El.width El.fill, El.spacing 10 ] [
      educationElement "2021-2022" "Computer Science AS (In Progress)" "Las Positas Community College"
    , educationElement "2021-2022" "Computer Science AS (In Progress)" "Las Positas Community College"
    ]
  )
