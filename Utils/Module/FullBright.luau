local FullBright = {}

local Lighting = game:GetService("Lighting")

local Original = {
	Ambient = Lighting.Ambient,
	ColorShift_Bottom = Lighting.ColorShift_Bottom,
	ColorShift_Top = Lighting.ColorShift_Top,
	Brightness = Lighting.Brightness,
	GlobalShadows = Lighting.GlobalShadows
}

FullBright.Enabled = false

function FullBright:Apply(v)
	if v then
		Lighting.Ambient = Color3.new(1,1,1)
		Lighting.ColorShift_Bottom = Color3.new(1,1,1)
		Lighting.ColorShift_Top = Color3.new(1,1,1)
		Lighting.Brightness = 3
		Lighting.GlobalShadows = false
	else
		Lighting.Ambient = Original.Ambient
		Lighting.ColorShift_Bottom = Original.ColorShift_Bottom
		Lighting.ColorShift_Top = Original.ColorShift_Top
		Lighting.Brightness = Original.Brightness
		Lighting.GlobalShadows = Original.GlobalShadows
	end
end

function FullBright:Toggle(v)
	self.Enabled = v
	self:Apply(v)
end

return FullBright
