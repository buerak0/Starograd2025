local function someoneInside(veh)
	for _, child in ipairs(veh:GetChildren()) do
		if child:GetClass() ~= 'prop_vehicle_prisoner_pod' then continue end
		local driver = child:GetDriver()
		if IsValid(driver) and not driver:IsAFK() then
			return true
		end
	end

	return false
end

timer.Create('octocars.removeIdle', 60, 0, function()
	local vehs = carDealer.spawnedVehicles
	local maxCars = carDealer.maxCars[game.GetMap()] or carDealer.maxCars.default
	local limitReached = table.Count(vehs) >= maxCars
	local scoreForEvac = carDealer.idleScoreForEvac
	local scoreForNotify = scoreForEvac - 5

	for veh, _ in pairs(vehs) do
		if not IsValid(veh) then
			vehs[veh] = nil
			continue
		end

		veh.idleScore = veh.idleScore or 0
		if veh.doNotEvacuate and not veh.evacRequested then
			continue
		end

		local curPos = veh:GetPos()
		local moveDist = veh.idleLastPos and veh.idleLastPos:DistToSqr(curPos) or 0
		local movedThisCycle = moveDist >= 64
		veh.idleLastPos = curPos

		local owner = carDealer.getOwner(veh) or veh:CPPIGetOwner()
		if movedThisCycle then
			veh.idleScore = math.max(veh.idleScore - 5, 0)

			if veh.evacRequested then
				if IsValid(owner) then
					carDealer.notify(owner, 'Эвакуация твоего автомобиля отменена, так как он был перемещен')
				end

				veh.evacRequested = nil
			end
			continue
		else
			-- we want cars to instantly be on notification score when limit is reached
			local maxScore = (limitReached or veh.evacRequested)
				and scoreForEvac
				or scoreForNotify

			local newScore = math.min(veh.idleScore + 1, maxScore)
			if newScore == veh.idleScore then
				continue
			end

			veh.idleScore = newScore

			-- notify when we can actually evacuate
			if newScore == scoreForNotify and newScore ~= maxScore and IsValid(owner) then
				carDealer.notify(owner, L.car_evacuate)
			end
		end

		if veh.idleScore >= scoreForEvac then
			if IsValid(owner) then
				carDealer.notify(owner, L.car_evacuated)
			end

			carDealer.storeVeh(veh)
		end
	end
end)
