include("GameCapabilities");
GAME_SPEED = GameConfiguration.GetGameSpeedType()
GAME_SPEED_MULTIPLIER = GameInfo.GameSpeeds[GAME_SPEED] and GameInfo.GameSpeeds[GAME_SPEED].CostMultiplier / 100 or 1

DebugON = true
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

-- 累积奖励计算
function TradeScienceCalc(pPlayer, TradingScience)
	if DebugON and pPlayer == nil then print("Fatal: pPlayer = nil") return end
    -- 初始化存档数据
    if pPlayer:GetProperty("sScience.MonaTradeScience") == nil then
        pPlayer:SetProperty("sScience.MonaTradeScience", 0)
        pPlayer:SetProperty("sGold.MonaTradeScience", 0)
        if DebugON then print("Initiating PlayerProperties: " .. pPlayer:GetProperty("sScience.MonaTradeScience")) end
    end
    -- 更新本回合数据
    local sScience, sGold = tonumber(pPlayer:GetProperty("sScience.MonaTradeScience")) + TradingScience, tonumber(pPlayer:GetProperty("sGold.MonaTradeScience"))+ TradingScience * 2
    pPlayer:SetProperty("sScience.MonaTradeScience", sScience)
    pPlayer:SetProperty("sGold.MonaTradeScience", sGold)
    TSLValueProvider(pPlayer, sScience)
    if DebugON then print("sScience: " .. sScience .. "sGold: " .. sGold) end
    if DebugON then print("Game speed: " .. GAME_SPEED_MULTIPLIER) end
end

-- 累积值写入到首都单元格属性
function TSLValueProvider(pPlayer, sScience)
    binsScience = intToBins(math.floor(sScience / 100))
	pCapital = pPlayer:GetCities():GetCapitalCity()
	pCapitalPlot = pCapital:GetPlot()
	pCapitalPlot:SetProperty("1.MonaTSL", binsScience[1])
	pCapitalPlot:SetProperty("2.MonaTSL", binsScience[2])
	pCapitalPlot:SetProperty("4.MonaTSL", binsScience[3])
	pCapitalPlot:SetProperty("8.MonaTSL", binsScience[4])
	pCapitalPlot:SetProperty("16.MonaTSL", binsScience[5])
	pCapitalPlot:SetProperty("32.MonaTSL", binsScience[6])
	pCapitalPlot:SetProperty("64.MonaTSL", binsScience[7])
	pCapitalPlot:SetProperty("128.MonaTSL", binsScience[8])
	pCapitalPlot:SetProperty("256.MonaTSL", binsScience[9])
	pCapitalPlot:SetProperty("512.MonaTSL", binsScience[10])
end

-- 整数转换至二进制数组
function intToBins(n)
    print(n)
    if n > 1023 then n = 1023 end
    local bools = {}
    for i = 1, 10 do
        bools[i] = n % 2
        n = math.floor(n / 2)
        if DebugON then print (bools[i]) end
    end
    return bools
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
    MonaNotificationsSender(DB.MakeHash("NOTIFICATION_MONA_RESEARCHREWARD"), RewardGold)
    end
end

-- 通知发送器
function MonaNotificationsSender(nType, nValue1, nValue2)
    if nType == DB.MakeHash("NOTIFICATION_MONA_TRADESCIENCE") then
        sTitle = DB.MakeHash("LOC_NOTIFICATION_MONA_TRADESCIENCE_TITLE")
        sString = ("LOC_NOTIFICATION_MONA_TRADESCIENCE_STRING_1" .. string.format("%d", nValue1) .. GameInfo.Yields['YIELD_GOLD'].IconString .. "LOC_NOTIFICATION_MONA_TRADESCIENCE_2" .. string.format("%d", nValue2 / 2) .. GameInfo.Yields['YIELD_SCIENCE'].IconString .. "LOC_NOTIFICATION_MONA_TRADESCIENCE_STRING_3")
    elseif nType == DB.MakeHash("NOTIFICATION_MONA_RESEARCHREWARD") then
        sTitle = DB.MakeHash("LOC_NOTIFICATION_MONA_RESEARCHREWARD_TITLE")
        sString = ("LOC_NOTIFICATION_MONA_RESEARCHREWARD_STRING_1" .. string.format("%d", nValue1) .. GameInfo.Yields['YIELD_GOLD'].IconString .. "LOC_NOTIFICATION_MONA_RESEARCHREWARD_STRING_2")
    end
    local notificationData = {};
    notificationData[ParameterTypes.MESSAGE] = sTitle;
    notificationData[ParameterTypes.SUMMARY] = sString;
    if(CapitalPlotX ~= nil) then
        notificationData [ParameterTypes.LOCATION] = { x = CapitalPlotX, y = CapitalPlotY};
    end
    notificationData.AlwaysAutoActivate = true;
    notificationData.AlwaysUnique = true;
    --notificationData.ShowIcon = false;
    NotificationManager.SendNotification(ePlayer, nType, notificationData)
end
-- 首都上方显示飘字
function CapitalWorldViewTextSender(playerID, Incometext)
    pCapital = Players[playerID]:GetCities():GetCapitalCity()
    CapitalPlotX, CapitalPlotY = pCapital:GetX(), pCapital:GetY()
    Game.AddWorldViewText(EventSubTypes.PROJECT, Incometext, CapitalPlotX, CapitalPlotY)
end

Events.TurnBegin.Add(TurnCounter)
Events.ResearchCompleted.Add(MonaResearchReward)