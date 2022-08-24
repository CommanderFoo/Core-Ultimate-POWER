local damageable = script:FindAncestorByType("DamageableObject")

function Tick()
	damageable:ApplyDamage(Damage.New(math.random(10, 30)))
	Task.Wait(.5)
end