positionsX = {42, 84, 126}
positionsY = {169,102,35}

local function add(self, arg)
    local i = #self
  
    self[i + 1] = arg

end

Mac_WhoIsTargetMixin = {}

function Mac_WhoIsTargetMixin:OnLoad() 
    self:RegisterEvent("UNIT_TARGET")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

    --[[Frame1.Texture:SetTexture("132345")
    Frame2.Texture:SetTexture("132345")
    Frame3.Texture:SetTexture("132345")

    Frame1:SetPoint("CENTER", positionsX[1], positionsY[1])
    Frame2:SetPoint("CENTER", positionsX[2], positionsY[1])
    Frame3:SetPoint("CENTER", positionsX[3], positionsY[1])]]

end

function Mac_WhoIsTargetMixin:OnEvent(event)

  local isArena, isRegistered = IsActiveBattlefieldArena()

  if isArena then

    if event == "COMBAT_LOG_EVENT_UNFILTERED" then

      local _, subevent, _, _, _, _, _, _, destName = CombatLogGetCurrentEventInfo()

      if subevent == "UNIT_DIED" then
        print(destName)

        self:OnUpdate()

      end


    end

    if event == "PLAYER_ENTERING_WORLD" then

      Frame1:Hide()
      Frame2:Hide()
      Frame3:Hide()

    end

    if event == "UNIT_TARGET" then

      self:OnUpdate()

    end

  end
  
end

function Mac_WhoIsTargetMixin:OnUpdate()

  --[[if GladiusExButtonFrameplayer then
      Frame1:ClearAllPoints()
      Frame1:SetPoint("RIGHT", GladiusExButtonFrameplayer, 42, 0)
      Frame2:ClearAllPoints()
      Frame2:SetPoint("RIGHT", GladiusExButtonFrameplayer, 84, 0)
      Frame3:ClearAllPoints()
      Frame3:SetPoint("RIGHT", GladiusExButtonFrameplayer, 126, 0)
    else
      print("фрэйм не создан")
    end]]

  local targetingThePlayer = {}
  local targetingTheParty1 = {}
  local targetingTheParty2 = {}

  Frame1:Hide()
  Frame2:Hide()
  Frame3:Hide()

  
  for i=1, GetNumArenaOpponents() do

    if GetUnitName("arena" .. i .. "target") == GetUnitName("player") then

      if UnitIsDead("arena" .. i) ~= true then -- проверяет жилой ли аппонент

        local frame = _G["Frame" .. i]

        local specID = GetArenaOpponentSpec(i)

        if specID then

          local id, name, description, icon, role, class = GetSpecializationInfoByID(specID)
          
            if targetingThePlayer[1] == nil then

              frame:Show()
              frame.Texture:SetTexture(icon)
              frame:ClearAllPoints()
              frame:SetPoint("RIGHT", GladiusExButtonFrameplayer, positionsX[1], 0)

              targetingThePlayer[1] = GetUnitName("arena" .. i)
                            
            elseif targetingThePlayer[2] == nil then

              frame:Show()
              frame.Texture:SetTexture(icon)
              frame:ClearAllPoints()
              frame:SetPoint("RIGHT", GladiusExButtonFrameplayer, positionsX[2], 0)

              targetingThePlayer[2] = GetUnitName("arena" .. i)
                            
            elseif targetingThePlayer[3] == nil then

              frame:Show()
              frame.Texture:SetTexture(icon)
              frame:ClearAllPoints()
              frame:SetPoint("RIGHT", GladiusExButtonFrameplayer, positionsX[3], 0)

              targetingThePlayer[3] = GetUnitName("arena" .. i)
                            
            end

          end
        
        else
        
        --  print("этот аппонент", GetUnitName("arena" .. i) ,"мертв и поэтому его таргет не отобрааеться")

        end

    end

    if GetUnitName("arena" .. i .. "target") == GetUnitName("party1") then

      if UnitIsDead("arena" .. i) ~= true then -- проверяет жилой ли аппонент

        local specID = GetArenaOpponentSpec(i)
        local frame = _G["Frame" .. i]
        if specID then

          local id, name, description, icon, role, class = GetSpecializationInfoByID(specID)

          if targetingTheParty1[1] == nil then

            frame:Show()
            frame.Texture:SetTexture(icon)
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", GladiusExButtonFrameparty1, positionsX[1], 0)

            targetingTheParty1[1] = GetUnitName("arena" .. i)
                          
          elseif targetingTheParty1[2] == nil then

            frame:Show()
            frame.Texture:SetTexture(icon)
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", GladiusExButtonFrameparty1, positionsX[2], 0)

            targetingTheParty1[2] = GetUnitName("arena" .. i)
                          
          elseif targetingTheParty1[3] == nil then

            frame:Show()
            frame.Texture:SetTexture(icon)
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", GladiusExButtonFrameparty1, positionsX[3], 0)

            targetingTheParty1[3] = GetUnitName("arena" .. i)
                          
          end
          
        end
      
      else
        
      -- print("этот аппонент", GetUnitName("arena" .. i) ,"мертв и поэтому его таргет не отобрааеться")

      end

    end

    if GetUnitName("arena" .. i .. "target") == GetUnitName("party2") then

      if UnitIsDead("arena" .. i) ~= true then -- проверяет жилой ли аппонент

        local specID = GetArenaOpponentSpec(i)
        local frame = _G["Frame" .. i]

        if specID then

          local id, name, description, icon, role, class = GetSpecializationInfoByID(specID)

          if targetingTheParty2[1] == nil then

            frame:Show()
            frame.Texture:SetTexture(icon)
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", GladiusExButtonFrameparty2, positionsX[1], 0)

            targetingTheParty2[1] = GetUnitName("arena" .. i)
                          
          elseif targetingTheParty2[2] == nil then

            frame:Show()
            frame.Texture:SetTexture(icon)
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", GladiusExButtonFrameparty2, positionsX[2], 0)

            targetingTheParty2[2] = GetUnitName("arena" .. i)
                          
          elseif targetingTheParty2[3] == nil then

            frame:Show()
            frame.Texture:SetTexture(icon)
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", GladiusExButtonFrameparty2, positionsX[3], 0)

            targetingTheParty2[3] = GetUnitName("arena" .. i)
                          
          end

        end
      
      else
        
      --  print("этот аппонент", GetUnitName("arena" .. i) ,"мертв и поэтому его таргет не отобрааеться")

      end

    end

  end

end