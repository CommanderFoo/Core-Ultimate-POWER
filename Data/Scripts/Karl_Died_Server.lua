local function on_died(obj, damage)
	if(Object.IsValid(damage.sourcePlayer)) then
		local ultimate = damage.sourcePlayer:GetResource("Ultimate")

		damage.sourcePlayer:SetResource("Ultimate", math.min(100, ultimate + math.random(10, 30)))
	end
end

script:FindAncestorByType("DamageableObject").diedEvent:Connect(on_died)