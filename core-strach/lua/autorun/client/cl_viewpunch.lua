local meta = FindMetaTable("Player")
local metavec = FindMetaTable("Vector")

local PUNCH_DAMPING = 10
local PUNCH_SPRING_CONSTANT = 600

local function lensqr(ang)
    return (ang[1] ^ 2) + (ang[2] ^ 2) + (ang[3] ^ 2)
end

function metavec:Approach(x, y, z, speed)
	if !isnumber(x) then
		local vec = x
		speed = y
		x, y, z = vec:Unpack()
	end
	self[1] = math.Approach(self[1], x, speed)
	self[2] = math.Approach(self[2], y, speed)
	self[3] = math.Approach(self[3], z, speed)
end

local function CLViewPunchThink()
	local self = LocalPlayer()
	if !self.ViewPunchVelocity then
		self.ViewPunchVelocity = Angle()
		self.ViewPunchAngle = Angle()
	end
	local vpa = self.ViewPunchAngle
    local vpv = self.ViewPunchVelocity

    if !self.ViewPunchDone and lensqr(vpa) + lensqr(vpv) > 0.000001 then
        local FT = FrameTime()

        vpa = vpa + (vpv * FT)
        local damping = 1 - (PUNCH_DAMPING * FT)
        if damping < 0 then
			damping = 0
		end
        vpv = vpv * damping

        local springforcemagnitude = PUNCH_SPRING_CONSTANT * FT
        springforcemagnitude = math.Clamp(springforcemagnitude, 0, 2)
        vpv = vpv - (vpa * springforcemagnitude)

        vpa[1] = math.Clamp(vpa[1], -89.9, 89.9)
        vpa[2] = math.Clamp(vpa[2], -179.9, 179.9)
        vpa[3] = math.Clamp(vpa[3], -89.9, 89.9)

        self.ViewPunchAngle = vpa
        self.ViewPunchVelocity = vpv
    else
		self.ViewPunchDone = true
	end
end
hook.Add("Think", "CLViewPunch", CLViewPunchThink)

local PunchPos = Vector()
local runfwd = 0
local function CLViewPunchCalc(ply, pos, ang)
	if ply.ViewPunchAngle then
		ang:Add(ply.ViewPunchAngle)
	end

	local vel = ply:GetVelocity():Length()
	local punchang = ply:GetViewPunchAngles() + (ply.ViewPunchAngle or angle_zero)
	PunchPos:Approach(0, 0, 0, FrameTime()*2.5)
	runfwd = math.Approach(runfwd, 1, FrameTime()*5)
	local punchlocal = LocalToWorld(PunchPos, angle_zero, pos, ang)
	punchlocal:Sub(pos)
	punchlocal.z = -punchlocal:Length()
	pos:Add(punchlocal)
end

hook.Add("CalcView","CLViewPunch",CLViewPunchCalc)

function meta:CLViewPunch(angle)
    self.ViewPunchVelocity:Add(angle * 1)

    local ang = self.ViewPunchVelocity

    ang[1] = math.Clamp(ang[1], -180, 180)
    ang[2] = math.Clamp(ang[2], -180, 180)
    ang[3] = math.Clamp(ang[3], -180, 180)
	
	self.ViewPunchDone = false
end

function meta:GetCLViewPunchAngles()
	return self.ViewPunchAngle
end