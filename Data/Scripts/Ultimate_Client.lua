local PROGRESS_TEXT = script:GetCustomProperty("ProgressText"):WaitForObject()
local READY_TEXT = script:GetCustomProperty("ReadyText"):WaitForObject()

local LOCAL_PLAYER = Game.GetLocalPlayer()
local is_flashing = false

READY_TEXT.text = "Press " .. Input.GetActionInputLabel("Use Ultimate") .. " For Ultimate"

local function on_resource_change(player, resource, amount)
	if(resource == "Ultimate") then
		PROGRESS_TEXT.text = tostring(amount) .. "%"

		if(amount == 100 and not is_flashing) then
			is_flashing = true

			local counter = 10

			while(counter > 0) do
				READY_TEXT.visibility = (counter % 2) + 1

				print((counter % 2) + 1)

				Task.Wait(.6)
				counter = counter - 1
			end

			READY_TEXT.visibility = Visibility.FORCE_ON
			is_flashing = false
		elseif(amount < 100) then
			READY_TEXT.visibility = Visibility.FORCE_OFF
		end
	end
end

LOCAL_PLAYER.resourceChangedEvent:Connect(on_resource_change)