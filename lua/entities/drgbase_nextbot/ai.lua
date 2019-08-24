
-- Convars --

local EnemyRadius = CreateConVar("drgbase_ai_radius", "5000", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

-- Getters/setters --

function ENT:IsAIDisabled()
  return self:GetNW2Bool("DrGBaseAIDisabled") or GetConVar("ai_disabled"):GetBool()
end

function ENT:GetEnemy()
  return self:GetNW2Entity("DrGBaseEnemy")
end
function ENT:HasEnemy()
  return IsValid(self:GetEnemy())
end
function ENT:HaveEnemy()
  return self:HasEnemy()
end
function ENT:HadEnemy()
  return self._DrGBaseHadEnemy
end

function ENT:GetNemesis()
  if self:HasNemesis() then
    return self:GetEnemy()
  else return NULL end
end
function ENT:HasNemesis()
  return self:GetNW2Bool("DrGBaseNemesis") and self:HasEnemy()
end
function ENT:HaveNemesis()
  return self:HasNemesis()
end
function ENT:HadNemesis()
  return self:GetNW2Bool("DrGBaseNemesis") and self:HadEnemy()
end

-- Functions --

-- Hooks --

function ENT:OnNewEnemy() end
function ENT:OnEnemyChange() end
function ENT:OnLastEnemy() end

-- Handlers --

function ENT:_InitAI()
  if SERVER then
    self._DrGBasePatrolPos = {}
    self._DrGBaseAllyDamageTolerance = {}
    self._DrGBaseAfraidOfDamageTolerance = {}
    self._DrGBaseNeutralDamageTolerance = {}
    self:LoopTimer(1, self.UpdateAI)
  end
  self:SetNW2VarProxy("DrGBaseEnemy", function(self, name, old, new)
    if not self._DrGBaseHadEnemy and IsValid(new) then
      self._DrGBaseHadEnemy = true
      self:OnNewEnemy(new)
    elseif self._DrGBaseHadEnemy and not IsValid(new) then
      self._DrGBaseHadEnemy = false
      self:OnLastEnemy(old)
      if SERVER and self.IsDrGNextbotHuman and self:HasWeapon() and
      not self:IsWeaponFull() then self:Reload() end
    else self:OnEnemyChange(old, new) end
  end)
end

if SERVER then

  -- Getters/setters --

  function ENT:SetAIDisabled(bool)
    local disabled = self:GetNW2Bool("DrGBaseAIDisabled")
    self:SetNW2Bool("DrGBaseAIDisabled", bool)
    if disabled and not bool then
      self:UpdateAI()
    end
  end
  function ENT:DisableAI()
    self:SetAIDisabled(true)
  end
  function ENT:EnableAI()
    self:SetAIDisabled(false)
  end

  function ENT:SetEnemy(enemy)
    self:SetNW2Entity("DrGBaseEnemy", enemy)
    self:SetNW2Bool("DrGBaseNemesis", false)
  end
  function ENT:SetNemesis(nemesis)
    self:SetNW2Entity("DrGBaseEnemy", nemesis)
    self:SetNW2Bool("DrGBaseNemesis", true)
  end

  function ENT:AddPatrolPos(pos, i)
    if not isvector(pos) then return end
    if isnumber(i) then
      table.insert(self._DrGBasePatrolPos, i, pos)
    else
      table.insert(self._DrGBasePatrolPos, pos)
    end
  end
  function ENT:GetPatrolPos(i)
    return self._DrGBasePatrolPos[i]
  end
  function ENT:RemovePatrolPos(i)
    return table.remove(self._DrGBasePatrolPos, i)
  end

  -- Functions --

  function ENT:UpdateAI()
    self:UpdateHostilesSight()
    self:UpdateEnemy()
  end

  function ENT:UpdateEnemy()
    local enemy
    if not self:IsPossessed() then
      if self:HasNemesis() then return self:GetNemesis() end
      enemy = self:OnUpdateEnemy()
      if enemy == nil then return self:GetEnemy() end
      if not IsValid(enemy) or
      self:GetRangeSquaredTo(enemy) > EnemyRadius:GetFloat()^2 then
        enemy = NULL
      end
      if self:IsAfraidOf(enemy) and
      not self:IsInRange(enemy, self.WatchAfraidOfRange) then
        enemy = NULL
      end
    else enemy = NULL end
    self:SetEnemy(enemy)
    return enemy
  end
  local function CompareEnemies(self, ent1, ent2)
    if self:IsAfraidOf(ent1) and self:IsEnemy(ent2) and
    not self:IsInRange(ent1, self.WatchAfraidOfRange) then return false end
    if self:IsEnemy(ent1) and self:IsAfraidOf(ent2) and
    not self:IsInRange(ent2, self.WatchAfraidOfRange) then return true end
    local res = self:OnFetchEnemy(ent1, ent2)
    if isbool(res) then return res end
    local prio1 = self:GetPriority(ent1)
    local prio2 = self:GetPriority(ent2)
    if prio1 > prio2 then return true
    elseif prio2 > prio1 then return false
    else return self:GetRangeSquaredTo(ent1) < self:GetRangeSquaredTo(ent2) end
  end
  function ENT:FetchEnemy()
    if self:IsPossessed() then return NULL end
    local current = NULL
    for enemy in self:HostileIterator(true) do
      if not IsValid(current) or CompareEnemies(self, enemy, current) then
        current = enemy
      end
    end
    return current
  end

  function ENT:ClearPatrolPos()
    self._DrGBasePatrolPos = {}
  end
  function ENT:ShufflePatrolPos()
    table.sort(self._DrGBasePatrolPos, function()
      return math.random(2) == 1
    end)
  end
  function ENT:SortPatrolPos()
    table.sort(self._DrGBasePatrolPos, function(pos1, pos2)
      return self:GroundDistance(pos1) < self:GroundDistance(pos2)
    end)
  end

  -- Hooks --

  function ENT:OnRangeAttack() end
  function ENT:OnMeleeAttack() end
  function ENT:OnChaseEnemy() end
  function ENT:OnAvoidEnemy() end
  function ENT:OnWatchEnemy() end
  function ENT:OnEnemyUnreachable() end

  function ENT:OnAvoidAfraidOf() end
  function ENT:OnWatchAfraidOf() end

  function ENT:OnReachedPatrol() end
  function ENT:OnPatrolUnreachable() end
  function ENT:OnPatrolling()
    self:WhilePatrolling()
  end
  function ENT:WhilePatrolling() end

  function ENT:OnIdle() end

  function ENT:OnUpdateEnemy()
    return self:FetchEnemy()
  end
  function ENT:OnFetchEnemy() end

  function ENT:ShouldRun()
    return self:HasEnemy()
  end

  -- Handlers --

  cvars.AddChangeCallback("ai_disabled", function(name, old, new)
    for i, nextbot in ipairs(DrGBase.GetNextbots()) do
      if not tobool(new) then nextbot:UpdateAI() end
    end
  end, "DrGBaseDisableAIUpdateBT")

end
