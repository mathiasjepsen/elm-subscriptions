import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (every, millisecond, Time, second, inMilliseconds, inSeconds)


main: Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = Time

init : (Model, Cmd Msg)
init =
  (0, Cmd.none)

-- UPDATE

type Msg
  = Tick Time

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (newTime, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  every millisecond Tick

-- VIEW

view : Model -> Html Msg
view model =
  let
    progress = toString <| toFloat (inMilliseconds model) % 5000 / 5000 * 100
  in
    svg [ viewBox "0 0 120 120", width "500px" ]
      [ rect [x "10", y "10", width "100", height "6", rx "2", ry "2" ] []
      , rect [x "10", y "10", width progress, height "6", rx "2", ry "2", fill "#AAA"] []
      ]
