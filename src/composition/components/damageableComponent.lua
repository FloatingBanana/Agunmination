local Component = require "engine.composition.component"
local Vector2   = require "engine.math.vector2"

local SIZE = 4

---@class DamageableComponent: Component
---
---@overload fun(health: number, maxHealth: number, cooldown: number): DamageableComponent
local DamageableComponent = Component:extend("DamageableComponent")

function DamageableComponent:new(health, maxHealth, cooldown)
    self.health = health
    self.maxHealth = maxHealth
    self.maxCooldown = cooldown
    self.cooldown = 0
end

function DamageableComponent:draw()
    local transform = self.entity:getComponent("Transform2dComponent") --[[@as Transform2dComponent]]

    local pos = Vector2(transform.rect.center.x - self.maxHealth * SIZE / 2, transform.position.y - 15)

    love.graphics.setLineWidth(2)

    love.graphics.setColor(1,.5,.5)
    love.graphics.rectangle("fill", pos.x, pos.y, self.health * SIZE, 5)

    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line", pos.x, pos.y, self.maxHealth * SIZE, 5)

    love.graphics.setLineWidth(1)
end

function DamageableComponent:update(dt)
    self.cooldown = math.max(self.cooldown - dt, 0)
end


---@param damage number
---@return boolean
function DamageableComponent:takeDamage(damage)
    if self.cooldown <= 0 then
        self.health = math.max(self.health - damage, 0)
        self.cooldown = self.maxCooldown
        self.entity:broadcastToComponents("onDamageTaken", damage)

        return true
    end
    return false
end


---@param amount number
function DamageableComponent:heal(amount)
    self.health = math.min(self.health + amount, self.maxHealth)
end

return DamageableComponent