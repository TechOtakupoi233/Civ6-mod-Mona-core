include("GameCapabilities");
GAME_SPEED = GameConfiguration.GetGameSpeedType()
GAME_SPEED_MULTIPLIER = GameInfo.GameSpeeds[GAME_SPEED] and GameInfo.GameSpeeds[GAME_SPEED].CostMultiplier / 100 or 1

-- DebugON = true
-- 回合计数器
function TurnCounter()
    -- 获取当前回合数，if回合数能被5整除
    if (Game.GetCurrentGameTurn() ~= nil and Game.GetCurrentGameTurn() % 5 == 0 ) then
        if DebugON then print("Turn " .. Game.GetCurrentGameTurn()) end
        MonaFinder()
    end
end

function MonaFinder()
    -- 遍历玩家，如果发现玩家具备“伟大的占星术士”特性，则将其加入MonaIDs表，否则计算科技值并找到科技值最高的玩家ID。
    AlivePlayers = PlayerManager.GetAliveMajorIDs()
    MonaIDs = {}
    local HighestScience, HighestSciencePlayerID = 0, nil
    if DebugON then print("AlivePlayers: " .. table.concat(AlivePlayers, ",")) end
    for i, playerID in pairs(AlivePlayers) do
        if (HasTrait("TRAIT_GREAT_ASTROLOGIST", playerID)) then
            table.insert(MonaIDs, playerID)
        else
            local PlayerScience = Players[playerID]:GetTechs():GetScienceYield()
            if PlayerScience > HighestScience then
                HighestScience, HighestSciencePlayerID = PlayerScience, playerID
            end
        end
    end
    if DebugON then print("Found Mona PlayerID: " .. table.concat(MonaIDs, ",")) end
    if DebugON then print("Player " .. HighestSciencePlayerID .. " has highest Science of " .. HighestScience) end
    MonaTradeScience(MonaIDs, HighestSciencePlayerID)
end

-- 钱换瓶
function MonaTradeScience(MonaIDs, HighestSciencePlayerID)
    for i, playerID in pairs(MonaIDs) do
        local pPlayer = Players[playerID]
        local MonaCapitalText, HighestSciencePlayerCapitalText
        if pPlayer ~= nil then
        -- 获取金币余额并计算转换的科技值
        TradingGold = pPlayer:GetTreasury():GetGoldBalance()
        TradingScience = TradingGold / 2
        -- 转科技和钱
        pPlayer:GetTechs():ChangeCurrentResearchProgress(TradingScience)
        pPlayer:GetTreasury():ChangeGoldBalance(0 - TradingGold)
        if DebugON then print("Player " .. playerID .. " is trading " .. TradingGold .. " Gold to " .. TradingScience .. " Science") end
        -- 飘字文本
        MonaCapitalText = '[COLOR_FLOAT_GOLD]' .. string.format("%d", TradingGold) .. GameInfo.Yields['YIELD_GOLD'].IconString .. '[ENDCOLOR]' .. '[ICON_GoingTo]'.. '[COLOR_FLOAT_SCIENCE]' ..  string.format("%d", TradingScience) .. GameInfo.Yields['YIELD_SCIENCE'].IconString .. '[ENDCOLOR]'
        CapitalWorldViewTextSender(playerID, MonaCapitalText)
        TradeScienceCalc(pPlayer, TradingScience)
        -- 转账到除自己外科技值最高的玩家
        Players[HighestSciencePlayerID]:GetTreasury():ChangeGoldBalance(TradingGold)
        if DebugON then print("Sending " .. TradingGold .. " Gold to Player " .. HighestSciencePlayerID) end
        HighestSciencePlayerCapitalText = '[COLOR_FLOAT_GOLD]' .. '+' .. string.format("%.1f", TradingGold) .. GameInfo.Yields['YIELD_GOLD'].IconString .. '[ENDCOLOR]'
        CapitalWorldViewTextSender(HighestSciencePlayerID, HighestSciencePlayerCapitalText)
        end
    end
end

GAME_SPEED = GameConfiguration.GetGameSpeedType()
GAME_SPEED_MULTIPLIER = GameInfo.GameSpeeds[GAME_SPEED] and GameInfo.GameSpeeds[GAME_SPEED].CostMultiplier / 100 or 1

-- 累积奖励计算
function TradeScienceCalc(pPlayer, TradingScience)
	if DebugON and pPlayer == nil then print("Fatal: pPlayer = nil") return end
    -- 初始化存档数据
    if pPlayer:GetProperty("SUM.MonaTradeScience") == nil then
        pPlayer:SetProperty("SUM.MonaTradeScience", 0)
        pPlayer:SetProperty("sValue.MonaTradeScience", 0)
        pPlayer:SetProperty("gValue.MonaTradeScience", 0)
        if DebugON then print("Initiating PlayerProperties: " .. pPlayer:GetProperty("SUM.MonaTradeScience")) end
    end
    -- 更新本回合数据
    local SUM, sValue, gValue = pPlayer:GetProperty("SUM.MonaTradeScience"), pPlayer:GetProperty("sValue.MonaTradeScience"), pPlayer:GetProperty("gValue.MonaTradeScience")
    pPlayer:SetProperty("SUM.MonaTradeScience", SUM + TradingScience)
    pPlayer:SetProperty("sValue.MonaTradeScience", sValue + TradingScience)
    pPlayer:SetProperty("gValue.MonaTradeScience", gValue + TradingScience * 2)
    local sValue, gValue = pPlayer:GetProperty("sValue.MonaTradeScience"), pPlayer:GetProperty("gValue.MonaTradeScience")
    -- 每100科技值（标准速度下）为玩家附加一个加星纬殿堂产出的Modifier(+1科技)
    if sValue >= 100 then repeat sValue = sValue - 100 * GAME_SPEED_MULTIPLIER
        pPlayer:AttachModifierByID(GameInfo.Modifiers["MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE"].ModifierId)
        pPlayer:AttachModifierByID(GameInfo.Modifiers["MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE"].ModifierId)
        until sValue < 100
        pPlayer:SetProperty("sValue.MonaTradeScience", sValue)
        if DebugON then print("+1 Science for Temple") end
    end
    if DebugON then print("SUM is " .. pPlayer:GetProperty("SUM.MonaTradeScience")) end
end

-- 自动购置学院区建筑
function MonaAutoBuyCampusBuildings(pPlayer, gValue)
    -- 从数据库获取建筑原价并计算游戏速度影响
    dCampus = GameInfo.Districts["DISTRICT_CAMPUS"].Index;
    bLib, cLib = GameInfo.Buildings["BUILDING_LIBRARY"].Index, GameInfo.Buildings["BUILDING_LIBRARY"].Cost * GAME_SPEED_MULTIPLIER
    bUni, cUni = GameInfo.Buildings["BUILDING_UNIVERSITY"].Index, GameInfo.Buildings["BUILDING_UNIVERSITY"].Cost * GAME_SPEED_MULTIPLIER
    bRes, cRes = GameInfo.Buildings["BUILDING_RESEARCH_LAB"].Index, GameInfo.Buildings["BUILDING_RESEARCH_LAB"].Cost * GAME_SPEED_MULTIPLIER
    local pCities = pPlayer:GetCities();
    local pCity;
    for ii, pCity in pCities:Members() do
        if (pCity ~= nil) then
            local pCityBuildings = pCity:GetBuildings();
            local pCityDistricts = pCity:GetDistricts();
            local pCityBuildQueue = pCity:GetBuildQueue();
            -- 如果城市没有建筑且累积金币足够则购买
            if pCityDistricts:HasDistrict(dCampus) and (not pCityBuildings:HasBuilding(bLib)) and gValue >= cLib then
                pCityBuildQueue:CreateIncompleteBuilding(bLib);
                gValue = gValue - cLib
                pPlayer:SetProperty("gValue.MonaTradeScience", gValue)
                if DebugON then print("Bought a Library in " .. pCity:GetName(pCity)) end
                return gValue
            elseif pCityDistricts:HasDistrict(dCampus) and (not pCityBuildings:HasBuilding(bUni)) and gValue >= cUni then
                pCityBuildQueue:CreateIncompleteBuilding(bUni);
                gValue = gValue - cUni
                pPlayer:SetProperty("gValue.MonaTradeScience", gValue)
                if DebugON then print("Bought a University in " .. pCity:GetName(pCity)) end
                return gValue
            elseif pCityDistricts:HasDistrict(dCampus) and (not pCityBuildings:HasBuilding(bRes)) and gValue>= cRes then
                pCityBuildQueue:CreateIncompleteBuilding(bRes);
                gValue = gValue - cRes
                pPlayer:SetProperty("gValue.MonaTradeScience", gValue)
                if DebugON then print("Bought a Research Lab in " .. pCity:GetName(pCity)) end
                return gValue
            end
        end
    end
end

-- 研究返点
function MonaResearchReward(ePlayer, eTech)
    -- 检查完成研究eTech的玩家是否具备“伟大的占星术士”特性
    if (not HasTrait("TRAIT_GREAT_ASTROLOGIST", ePlayer)) then
    else
    -- 获取完成研究eTech所消耗的科技点，计算返点金额
    local pPlayer = Players[ePlayer]
    local MonaCapitalText
    RewardGold = pPlayer:GetTechs():GetResearchCost(eTech) / 2
    -- 返点到账
    pPlayer:GetTreasury():ChangeGoldBalance(RewardGold)
    MonaCapitalText = '[COLOR_FLOAT_GOLD]' .. '+' .. string.format("%d", RewardGold) .. GameInfo.Yields['YIELD_GOLD'].IconString .. '[ENDCOLOR]'
    CapitalWorldViewTextSender(ePlayer, MonaCapitalText)
    local sTitle = "LOC_NOTIFICATION_MONA_RESEARCHREWARD_TITLE"
    local sString = ("LOC_NOTIFICATION_MONA_RESEARCHREWARD_STRING_1" .. string.format("%d", RewardGold) .. GameInfo.Yields['YIELD_GOLD'].IconString .. "LOC_NOTIFICATION_MONA_RESEARCHREWARD_STRING_2")
    local notificationData = {};
    notificationData[ParameterTypes.MESSAGE] = sTitle;
    notificationData[ParameterTypes.SUMMARY] = sString;
    if(CapitalPlotX ~= nil) then
        notificationData [ParameterTypes.LOCATION] = { x = CapitalPlotX, y = CapitalPlotY};
    end
    notificationData.AlwaysAutoActivate = true;
    notificationData.AlwaysUnique = true;
    --notificationData.ShowIcon = false;
    NotificationManager.SendNotification(ePlayer, ResearchRewardNotification, notificationData)
    end
end

-- 首都上方显示飘字
function CapitalWorldViewTextSender(playerID, Incometext)
    pCapital = Players[playerID]:GetCities():GetCapitalCity()
    CapitalPlotX, CapitalPlotY = pCapital:GetX(), pCapital:GetY()
    Game.AddWorldViewText(EventSubTypes.PROJECT, Incometext, CapitalPlotX, CapitalPlotY)
end

Events.TurnBegin.Add(TurnCounter)
Events.ResearchCompleted.Add(MonaResearchReward)