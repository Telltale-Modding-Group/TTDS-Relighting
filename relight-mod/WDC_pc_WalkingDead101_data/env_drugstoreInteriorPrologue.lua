local kScene = "adv_drugstoreInteriorPrologue.scene"
local mBoardsComingOut = {}
local mBoardsFailed = {}
local getAvailableBoards = function()
  local avail = {}
  for i = 0, 5 do
    if not mBoardsComingOut[i] and not mBoardsFailed[i] then
      table.insert(avail, i)
    end
  end
  return avail
end
function Prologue_PickABoard()
  local avail = getAvailableBoards()
  if #avail == 0 then
    Logic["Drugstore - PrologueBoardCurrentOut"] = -1
    return
  end
  local boardIdx = TableGetRandomElement(avail)
  mBoardsComingOut[boardIdx] = true
  Logic["Drugstore - PrologueBoardCurrentOut"] = boardIdx
end
function Prologue_ResetBoard(idx)
  mBoardsComingOut[idx] = false
end
function Prologue_BoardIsComingOut(idx)
  return mBoardsComingOut[idx]
end
function Prologue_FailBoard(idx)
  mBoardsFailed[idx] = true
end
function dlgIdle(dlgItem, logicKey)
  while Logic[logicKey] do
    Dialog_PlayAndWait(dlgItem)
    Yield()
  end
end
function Prologue_MoveToCarley()
  Mode_Pop(mode_choice)
  Dialog_Play("cs_MoveToCarley")
end
function Prologue_MoveToDoug()
  Mode_Pop(mode_choice)
  Dialog_Play("cs_MoveToDoug")
end
function Prologue()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - PrologueStartFromChoice") then
    Dialog_Play("cs_choiceSetup")
  elseif IsToolBuild() and AgentGetProperty("logic_debug", "Debug - PrologueStartFromSaveClem") then
    AgentHide("Glenn", true)
    Dialog_Play("cs_kennyReturns")
  elseif Platform_HasHeadTracking() then
    Dialog_Play("cs_getOnDoor")
  elseif not SaveLoad_IsFromLoad() then
    if not IsToolBuild() or not GetPreferences()["Skip Intro Cutscenes"] then
      if Platform_IsWiiU() then
        print("Dialog Preloading start1")
        DlgPreload("env_drugstorePrologue.dlog", "cs_prologueAtEnd", 0, 15, 0, false)
      end
      Dialog_Play("cs_prologueAtEnd")
    else
      if Platform_IsWiiU() then
        print("Dialog Preloading start2")
        DlgPreload("env_drugstorePrologue.dlog", "logic_StartScene", 0, 10, 0, false)
      end
      Dialog_Play("logic_StartScene")
    end
  end
end
SceneOpen(kScene, "Prologue")
