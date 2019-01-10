module Emily exposing (main)

import Browser
import Html
import Html.Attributes
import Html.Events


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { answer : String
    , answerShown : Bool
    }


init : Model
init =
    { answer = "a delightful teacher!"
    , answerShown = False
    }


type Msg
    = ShowAnswer
    | HideAnswer
    | ChangeAnswer String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowAnswer ->
            { model | answerShown = True }

        HideAnswer ->
            { model | answerShown = False }

        ChangeAnswer newAnswer ->
            { model | answer = newAnswer }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ Html.h1
            [ Html.Attributes.style "color"
                (if model.answerShown then
                    "green"

                 else
                    "orange"
                )
            , Html.Attributes.style "text-decoration"
                (if model.answerShown then
                    "none"

                 else
                    "underline"
                )
            , Html.Attributes.style "font-style"
                (if model.answerShown then
                    "normal"

                 else
                    "italic"
                )
            ]
            [ Html.text "Hi! William is "
            , if model.answerShown then
                Html.text model.answer

              else
                Html.button
                    [ Html.Events.onClick ShowAnswer ]
                    [ Html.text "Show Answer  " ]
            , Html.text " "
            , Html.button
                [ Html.Events.onClick HideAnswer ]
                [ Html.text "Hide Answer" ]
            ]
        , Html.p
            []
            [ Html.label [ Html.Attributes.for "answer" ] [ Html.text "Answer: " ]
            , Html.input
                [ Html.Attributes.type_ "text"
                , Html.Attributes.value model.answer
                , Html.Events.onInput ChangeAnswer
                , Html.Attributes.size 50
                , Html.Attributes.id "answer"
                ]
                []
            ]
        ]
