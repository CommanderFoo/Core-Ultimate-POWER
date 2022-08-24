local KARLS = script:GetCustomProperty("Karls"):WaitForObject()
local FIRE_DOT = script:GetCustomProperty("FireDOT")

local function use_ultimate()
	local karls = KARLS:GetChildren()

	for index, karl in ipairs(karls) do
		World.SpawnAsset(FIRE_DOT, {

			parent = karl:GetChildren()[1]

		})
	end
end

local function on_action_pressed(player, action)
	if(action == "Use Ultimate" and player:GetResource("Ultimate") == 100) then
		player:SetResource("Ultimate", 0)
		use_ultimate()
	end
end

Input.actionPressedEvent:Connect(on_action_pressed)