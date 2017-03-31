module Setup.Msg exposing (..)

import Dom
import Html5.DragDrop as DragDrop
import Keyboard.Combo
import Mobster.Operation exposing (MobsterOperation)


type Msg
    = StartTimer
    | ViewRpgNextUp
    | ShowRotationScreen
    | SkipHotkey
    | StartRpgMode
    | UpdateMobsterData MobsterOperation
    | CheckRpgBox Msg Bool
    | UpdateMobsterInput String
    | AddMobster
    | ClickAddMobster
    | DomFocusResult (Result Dom.Error ())
    | ChangeTimerDuration String
    | ChangeBreakInterval String
    | SelectDurationInput
    | OpenConfigure
    | NewTip Int
    | SetExperiment
    | ChangeExperiment
    | UpdateExperimentInput String
    | EnterRating Int
    | ComboMsg Keyboard.Combo.Msg
    | ShuffleMobsters
    | TimeElapsed Int
    | UpdateAvailable String
    | ResetBreakData
    | RotateInHotkey Int
    | RotateOutHotkey Int
    | DragDropMsg (DragDrop.Msg DragId DropArea)
    | OpenExternalUrl String
    | SendIpcMessage IpcMessage


type DragId
    = ActiveMobster Int
    | InactiveMobster Int


type DropArea
    = DropBench
    | DropActiveMobster Int


type IpcMessage
    = ShowFeedbackForm
    | ShowScriptInstallInstructions
    | Hide
    | Quit
    | QuitAndInstall
