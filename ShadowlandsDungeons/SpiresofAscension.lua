--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Spires of Ascension
------------------------------------------------------
core._2285 = {}

------------------------------------------------------
---- Oryphrion
------------------------------------------------------
local ShatteredDevestator1Complete = false
local ShatteredDevestator2Complete = false
local ShatteredDevestator3Complete = false
local ShatteredDevestatorCounter = 0

function core._2285:Oryphrion()
    --Defeat Oryphrion after activating and destroying all three Shattered Devastators in the Spires of Ascension on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14331, 1) == true and ShatteredDevestator1Complete == false then
        core:sendMessage(GetAchievementCriteriaInfo(14331,1) .. " " .. L["Shared_Completed"] .. " (" .. ShatteredDevestatorCounter .. "/3)")
        ShatteredDevestator1Complete = true
        ShatteredDevestatorCounter = ShatteredDevestatorCounter + 1
    end
    if core:getBlizzardTrackingStatus(14331, 2) == true and ShatteredDevestator2Complete == false then
        core:sendMessage(GetAchievementCriteriaInfo(14331,2) .. " " .. L["Shared_Completed"] .. " (" .. ShatteredDevestatorCounter .. "/3)")
        ShatteredDevestator2Complete = true
        ShatteredDevestatorCounter = ShatteredDevestatorCounter + 1
    end
    if core:getBlizzardTrackingStatus(14331, 3) == true and ShatteredDevestator3Complete == false then
        core:sendMessage(GetAchievementCriteriaInfo(14331,3) .. " " .. L["Shared_Completed"] .. " (" .. ShatteredDevestatorCounter .. "/3)")
        DessertShatteredDevestator3CompleteCompleted = true
        ShatteredDevestatorCounter = ShatteredDevestatorCounter + 1
    end

    if core:getBlizzardTrackingStatus(14331, 1) == true and core:getBlizzardTrackingStatus(14331, 2) == true and core:getBlizzardTrackingStatus(14331, 3) == true then
        core:getAchievementSuccess()
    end
end

function core._2285:DevosParagonOfDoubt()
    --Defeat Devos, Paragon of Doubt after hitting her with five Spears of Duty in the Spires of Ascension on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14323, 1) then
        core:getAchievementSuccess()
    end
end

function core._2285:ICanSeeMyHouseFromHere()
    --Gather all five orbs within 60 seconds of each other in Spires of Ascension after defeating Devos, Paragon of Doubt in the Spires of Ascension on Mythic difficulty.

    if core:getBlizzardTrackingStatus(14327, 1) then
        core:getAchievementSuccess()
    end
end

function core._2285:ClearVariables()
    ------------------------------------------------------
    ---- Oryphrion
    ------------------------------------------------------
    ShatteredDevestator1Complete = false
    ShatteredDevestator2Complete = false
    ShatteredDevestator3Complete = false
    ShatteredDevestatorCounter = 0
end