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
        -- 转账到除自己外科技值最高的玩家
        Players[HighestSciencePlayerID]:GetTreasury():ChangeGoldBalance(TradingGold)
        if DebugON then print("Sending " .. TradingGold .. " Gold to Player " .. HighestSciencePlayerID) end
        HighestSciencePlayerCapitalText = '[COLOR_FLOAT_GOLD]' .. '+' .. string.format("%.1f", TradingGold) .. GameInfo.Yields['YIELD_GOLD'].IconString .. '[ENDCOLOR]'
        CapitalWorldViewTextSender(HighestSciencePlayerID, HighestSciencePlayerCapitalText)
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