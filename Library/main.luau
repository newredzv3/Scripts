


























local a=cloneref or(function(...)return...end)

local b=setmetatable({},{
__index=function(b,c)
rawset(b,c,a(game:GetService(c)))
return rawget(b,c)
end
})local _=

b.MarketplaceService
local d=b.UserInputService
local e=b.TweenService
local f=b.HttpService
local g=b.RunService
local h=b.Players local _=

g.Heartbeat

local j=h.LocalPlayer
local k=j:GetMouse()

local l=(gethui or function()return b.CoreGui end)()

local m={
Darker={
Colors={
Background=ColorSequence.new{
ColorSequenceKeypoint.new(0.00,Color3.fromRGB(25,25,25)),
ColorSequenceKeypoint.new(0.50,Color3.fromRGB(32.5,32.5,32.5)),
ColorSequenceKeypoint.new(1.00,Color3.fromRGB(25,25,25))
},
Primary=Color3.fromRGB(88,101,242),
OnPrimary=Color3.fromRGB(61,67,135),
ScrollBar=Color3.fromRGB(1,76,105),
Stroke=Color3.fromRGB(45,45,45),

Error=Color3.fromRGB(255,102,102),
Icons=Color3.fromRGB(232,233,235),

JoinButton=Color3.fromRGB(37,128,69),
Link=Color3.fromRGB(40,150,255),

Dialog={
Background=Color3.fromRGB(28,28,28)
},
Buttons={
Holding=Color3.fromRGB(32,32,32),
Default=Color3.fromRGB(28,28,30)
},
Border={
Holding=Color3.fromRGB(60,60,60),
Default=Color3.fromRGB(38,38,38),
},
Text={
Default=Color3.fromRGB(255,255,255),
Dark=Color3.fromRGB(200,200,200),
Darker=Color3.fromRGB(175,175,175),
},
Slider={
SliderBar=Color3.fromRGB(1,76,105),
SliderNumber=Color3.fromRGB(232,233,235),
},
Dropdown={
Holder=Color3.fromRGB(30,30,30),
}
},
Icons={
Error="rbxassetid://10709752996",
Button="rbxassetid://10709791437",
Close="rbxassetid://10747384394",
TextBox="rbxassetid://15637081879",
Search="rbxassetid://10734943674",
Keybind="rbxassetid://10734982144",
Dropdown={
Open="rbxassetid://10709791523",
Close="rbxassetid://10709790948"
}
},
Font={
Normal=Enum.Font.BuilderSans,
Medium=Enum.Font.BuilderSansMedium,
Bold=Enum.Font.BuilderSansBold,
ExtraBold=Enum.Font.BuilderSansExtraBold,
SliderValue=Enum.Font.FredokaOne
},
BackgroundTransparency=0.03
}
}

for n,o in m do
o.Name=n
table.freeze(o)
end

local n={
Information={
Version="v2.0.0",
GitHubOwner="tlredz"
},
Default={
Theme="Darker",
UISize=UDim2.fromOffset(550,380),
TabSize=160
},

Themes=m,

Connections={},
Options={},
Tabs={}
}

n.Info=n.Information
n.Save=n.Default

local o=workspace.CurrentCamera.ViewportSize local p=function(

p, q, r)
table.insert(n.Connections,p[r or"Connect"](p,q))end


local q={}
q.__index=q local r=function(

r, s)
for t in s:gmatch"[^%.]+"do
r=r[t]
end

return r end local s=function(


s, t, u, v)
if not v then
v=n.CurrentTheme
end

s[t]=r(v,if type(u)=="function"then u()else u)end local t=function(


t, u, v)
for w,x in v do
s(u,w,x,t)
end end


local u=false

local v={
MAX_SCALE=1.6,
MIN_SCALE=0.6,

TEXTBOX={
PLACEHOLDER_TEXT="Input"
}
}

function q:add(w,x)
self.Descendants[x]=w

if self.IS_RENDERING then
t(n.CurrentTheme,w,x)
end
end

function q:update()
if self.IS_RENDERING and not self.UPDATED_OBJECTS then
local w=n.CurrentTheme
self.UPDATED_OBJECTS=true

for x,y in self.Descendants do
local z=typeof(y)
if z=="table"then y:update()continue end

t(w,y,x)
end
end
end

function q:destroy()
local w=self.Parent and table.find(self.Parent.Descendants)

if w then
table.remove(self.Parent.Descendants,w)
end

table.clear(self.Descendants)
setmetatable(self,nil)
end

function q:changeRendering(w)
if self.IS_RENDERING~=w then
self.IS_RENDERING=w
self.UPDATED_OBJECTS=false
end
end

function q:new()
local w=setmetatable({
IS_RENDERING=true,
UPDATED_OBJECTS=false,
Descendants={},
Parent=self.Descendants~=nil and self or nil
},q)

if self.Descendants then
table.insert(self.Descendants,w)
end

return w
end

local w=q:new()

local x,y={}do
local z={}

local A={}do
A.ElementsTable={
Corner=function(B)
return y("UICorner",{
CornerRadius=B or UDim.new(0,8)
})
end,
Stroke=function(B,C)
return y("UIStroke",{
Color=B or Color3.fromRGB(60,60,60),
Thickness=C or 1
})
end,
Image=function(B)
return y("ImageLabel",{
Image=B or"",
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1)
})
end,
Button=function()
return y("TextButton",{
Text="",
Size=UDim2.fromScale(1,1),
AutoButtonColor=false
})
end,
Padding=function(B,C,D,E)
return y("UIPadding",{
PaddingLeft=B or UDim.new(0,10),
PaddingRight=C or UDim.new(0,10),
PaddingTop=D or UDim.new(0,10),
PaddingBottom=E or UDim.new(0,10)
})
end,
ListLayout=function(B)
return y("UIListLayout",{
Padding=B or UDim.new(0,5)
})
end,
Text=function(B)
return y("TextLabel",{
BackgroundTransparency=1,
Text=B or""
})
end,
Gradient=function(B)
return y("UIGradient",{
Color=B
})
end
}

function A:Create(B,C,...)
local D=self.ElementsTable[C]

if D then
local E=D(...)
E.Parent=B
return E
end
end
end

local B={}

function B:Childs(C)
for D=1,#C do
C[D].Parent=self
end
end

function B:Elements(C)
for D,E in pairs(C)do
if type(E)=="table"then
x.SetProperties(A:Create(self,D),E)
else
A:Create(self,D,E)
end
end
end

function B:ThemeTag(C)
local D=C.OBJECTS
C.OBJECTS=nil
return(D or w):add(self,C)
end

function x:SetProperties(C)
for D,E in pairs(C)do
if B[D]then
B[D](self,E)
else
self[D]=E
end
end
end

function x:SetValues(...)
local C=self

for D,E in{...}do
local F=typeof(E)

if F=="table"then
x.SetProperties(C,E)
else
C[if F=="string"then"Name"else"Parent"]=E
end
end

return C
end

local C

function x:Draggable(D,E,F)

local K=E or 0.28
local L=0
local M local N=function(

N)
local O=N.Position-H
local P
L=tick()

if F then
P=F(
I.X.Scale,I.X.Offset+O.X/D.Scale,
I.Y.Scale,I.Y.Offset+O.Y/D.Scale
)
else
P=UDim2.new(
I.X.Scale,I.X.Offset+O.X/D.Scale,
I.Y.Scale,I.Y.Offset+O.Y/D.Scale
)
end
self.Position=self.Position:Lerp(P,K)end local O=function()



while C==self do
if(tick()-L)>=1 then
M()
break
end
task.wait()
end end


local P={
[Enum.UserInputType.MouseButton1]=true,
[Enum.UserInputType.Touch]=true
}

local Q={
[Enum.UserInputType.MouseMovement]=true,
[Enum.UserInputType.Touch]=true
}

p(self.InputBegan,function(R)
if u==false and C==nil and P[R.UserInputType]then
H=R.Position
I=self.Position
C=self
L=tick()
u=true

local S;

function M()
u=false
C=nil
S:Disconnect()
end

task.spawn(O)

S=R.Changed:Connect(function()
if R.UserInputState==Enum.UserInputState.End then
M()
end
end)
end
end)

p(d.InputChanged,function(R)
if C==self and Q[R.UserInputType]then
N(R)
end
end)
end

function x:CreateNewTemplate(D)
return x.CloneObject(z[self],D)
end

function x.new(D,...)
return x.SetValues(Instance.new(D),...)
end

y=x.new
end

local z={}local A=function(

A)
if A==nil then
return{}
end

if type(A)~="function"and type(A)~="table"then
error(`Failed to get Callback: 'function', or 'table' expected, got {typeof(A)}`,2)
end

if type(A)~="function"then
local B=A[1]
local C=A[2]

A=function(D)
B[C]=D
end
end

return table.pack(A)end local B=function(


B)
z[B]=nil end local C=function(


C, ...)
if z[C]then return end

z[C]=true

for D=1,#C do
task.spawn(C[D],...)
end

task.defer(B,C)end


local D="redz-library-v5"
local E=l:FindFirstChild(D)

if not E then
E=y("ScreenGui",D,l,{
IgnoreGuiInset=true
})
end local F=function(

F, G, H, I, ...)
local J=TweenInfo.new(I,EasingStyle or Enum.EasingStyle.Quint,...)

return e:Create(F,J,{
[G]=H
})end local G=function(


G)
local H={}
for I=1,#G do
rawset(H,G[I],true)
end
return H end


local H=G(string.split"\n\t,_:;()[]#&=!. \"'*^<>$")local I=function(

I)
return string.gsub(I:lower(),".",function(J)
return H[J]and""or J
end)end local J=function(


J)
local K,L,M=tostring(J),"",0

for N=#K,1,-1 do
L=K:sub(N,N)..L
M+=1

if N>1 and M%3==0 then
L=","..L
end
end

return L end local K=function(


K)
local L="rbxassetid://"
return K:sub(1,#L)==L end local L=function(


L)
return(o.Y/450)*L end local M=function(


M)
local N=math.floor(M/60)
local O=math.floor(M/60/60)
M=math.floor((M-(N*60))*10)/10
N=N-(O*60)

if O>0 then
return`{O}h {N}m {math.floor(M)}s`
elseif N>0 then
return`{N}m {math.floor(M)}s`
else
return tostring(M)
end end


local N={}do
local O={}
local P={}
local Q={}
local R={}

local S
local T
local U
local V
local W
local X
local Y
local Z
local _

local aa=""

local ab={SelectedTab=1,Minimized=false}
ab.__index=ab

local ac={}
ac.__index=ac

local ad={}
ad.__index=ad

local ae={}
ae.__index=ae

local af={}do local ag=function()

local ag={}
ag.__index=function(ah,ai)
return ag[ai]or rawget(ad,ai)
end

return ag end


local ah=ag()
af.TextBox=ah

local ai=ag()
af.Toggle=ai

local aj=ag()
af.Slider=aj

local ak=ag()
af.Dropdown=ak

local al=ag()
af.Keybind=al

local am=ag()
af.Dialog=am local an=function()


V.Closed=true
V.Closing=false
setmetatable(V,nil)

V=nil
W.Parent=nil end local ao=function()



if V~=nil then
V:Close()
end end


function am:NewOption(ap)
local aq=ap[1]or ap.Name or ap.Title
local ar=A(ap[2]or ap.Callback)

table.insert(ar,ao)

assert(type(aq)=="string",`"Dialog.NewOption.Name". 'string' expected, got {typeof(aq)}`)

local as=y("TextButton",{
AutoButtonColor=false,
Size=UDim2.fromScale(0.2,1),
BackgroundTransparency=1,
TextSize=10,
Text=aq,
Elements={
Corner=UDim.new(1,0)
},
ThemeTag={
BackgroundColor3="Colors.Buttons.Default",
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})

local at=F(as,"BackgroundTransparency",0,0.3)
local au=F(as,"BackgroundTransparency",1,0.3)

p(as.MouseLeave,function()au:Play()end)
p(as.MouseEnter,function()at:Play()end)
p(as.Activated,function()C(ar)end)

as.Parent=W.Template.Options
end

function am:Close(ap)
if self.Closed or self.Closing or V~=self then
return nil
end

self.Closing=true

local aq=F(self.TEMPLATE,"Size",self.NEW_SIZE,0.1)
aq:Play()

if ap then
aq.Completed:Wait()
an()
else
p(aq.Completed,an)
end
end

function am.new(ap,aq)
return setmetatable({
TITLE_LABEL=ap,
DESCRIPTION_LABEL=ap,
Content=ap.Text,
Title=aq.Text,

Closed=false,
Closing=false,
Kind="Dialog"
},am)
end

function ak:SetEnabled(ap)
assert(type(ap)=="table",`"Dropdown.SetEnabled[param 1]". 'table' expected, got {typeof(ap)}`)

self.SET_ENABLED_OPTIONS(ap)
end

function ak:Clear()
self.CLEAR_DROPDOWN()
end

function ak:NewOptions(...)
self:Clear()
self:Add(...)
end

function ak:GetOptionsCount()
return#self.DROPDOWN_OPTIONS
end

function ak:Remove(...)
local ap={...}
assert(#ap>0,"'Dropdown.Remove' requires one or more options.")

for aq,ar in ap do
self.REMOVE_DROPDOWN_OPTION(ar)
end
end

function ak:Add(...)
local ap={...}
assert(#ap>0,"'Dropdown.Add' requires one or more options.")

for aq,ar in ap do
self.ADD_DROPDOWN_OPTION(ar)
end
end

function ak.new(ap,aq,ar,as,at)
return setmetatable({
CALLBACKS=at,

DESTROY_ELEMENT=aq,
VISIBLE_ELEMENT=aq,

TITLE_LABEL=ar,
DESCRIPTION_LABEL=as,
Description=as.Text,
Title=ar.Text,

Parent=ap,
Kind="Dropdown"
},ak)
end

function aj:SetValue(ap)
assert(type(ap)=="number",`"Slider.SetValue". 'number' expected, got {typeof(ap)}`)

if self.Value~=ap then
self.WHEN_VALUE_CHANGED(ap)
end
end

function aj.new(ap,aq,ar,as,at)
return setmetatable({
CALLBACKS=at,

DESTROY_ELEMENT=aq,
VISIBLE_ELEMENT=aq,

TITLE_LABEL=ar,
DESCRIPTION_LABEL=as,
Description=as.Text,
Title=ar.Text,

Parent=ap,
Kind="Slider"
},aj)
end

function ai:SetValue(ap)
assert(type(ap)=="boolean",`"Toggle.SetValue". 'boolean' expected, got {typeof(ap)}`)

if self.Value~=ap then
self.Value=ap
self.WHEN_VALUE_CHANGED(ap)
end
end

function ai.new(ap,aq,ar,as,at,au)
return setmetatable({
CALLBACKS=au,
WHEN_VALUE_CHANGED=at,

DESTROY_ELEMENT=aq,
VISIBLE_ELEMENT=aq,

TITLE_LABEL=ar,
DESCRIPTION_LABEL=as,
Description=as.Text,
Title=ar.Text,

Parent=ap,
Kind="Toggle"
},ai)
end

function ah:SetText(ap)
assert(type(ap)=="string",`"TextBox.SetText". 'string' expected, got {typeof(ap)}`)

self.TEXTBOX.Text=ap
return self
end

function ah:SetPlaceholder(ap)
assert(type(ap)=="string",`"TextBox.SetPlaceholder". 'string' expected, got {typeof(ap)}`)

self.TEXTBOX.PlaceholderText=ap
return self
end

function ah:CaptureFocus()
self.TEXTBOX:CaptureFocus()
return self
end

function ah:Clear()
self.TEXTBOX.Text=""
return self
end

function ah:SetTextFilter(ap)
if ap~=nil then
assert(type(ap)=="function",`"TextBox.SetTextFilter[param 1]". 'function', or 'nil' expected, got {typeof(ap)}`)
end

self.TEXTBOX_TEXT_FILTER=ap
return self
end

function ah.new(ap,aq,ar,as,at,au)
return setmetatable({
Title=aq.Text,
Description=ar.Text,
DESCRIPTION_LABEL=ar,
TITLE_LABEL=aq,

CALLBACKS=au,
DESTROY_ELEMENT=as,
VISIBLE_ELEMENT=as,

TEXTBOX=at,
BUTTON=as,

Parent=ap,
Kind="TextBox"
},ah)
end

ah.Set=ah.SetText
ai.Set=ai.SetValue
aj.Set=aj.SetValue
end local ag=function(

ag, ah, ai)
local aj=y("TextButton","Button",ai,{
Size=UDim2.new(1,0,0,24),
AutoButtonColor=false,
Text="",
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
},
Childs={
y("TextLabel","Title",{
BackgroundTransparency=1,
Font=Enum.Font.GothamMedium,
Text=ah.Title,
TextSize=10,
TextXAlignment=Enum.TextXAlignment.Left,
TextTransparency=(FirstTab and 0.3)or 0,
TextTruncate=Enum.TextTruncate.AtEnd,
ThemeTag={
TextColor3="Colors.Text.Default"
}
})
}
})

local ak=y("Frame",aj,{
Position=UDim2.new(0,1,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
Size=UDim2.fromOffset(4,4),
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Colors.Primary"
},
Elements={
Corner=UDim.new(0.5,0)
}
})

local al=y("ScrollingFrame","Container",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,1),
AnchorPoint=Vector2.new(0,1),
ScrollBarThickness=1.5,
BackgroundTransparency=1,
ScrollBarImageTransparency=0.2,
AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,
BorderSizePixel=0,
CanvasSize=UDim2.new(),
ThemeTag={
ScrollBarImageColor3="Colors.ScrollBar"
},
Elements={
Padding={
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingTop=UDim.new(0,10),
PaddingBottom=UDim.new(0,10)
},
ListLayout={
Padding=UDim.new(0,5)
}
}
})

local am=y("ImageLabel",aj,{
Position=UDim2.new(0,8,0.5),
Size=UDim2.new(0,13,0,13),
AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,
ImageTransparency=0.3,
Image=ah.Icon or""
})local an=function()


local an=string.sub(am.Image,1,13)=="rbxassetid://"
local ao=aj.Title
am.Visible=an
ao.Size=UDim2.new(1,an and-25 or-15,1)
ao.Position=UDim2.fromOffset(an and 25 or 15)end


p(am:GetPropertyChangedSignal"Image",an)
an()

return aj,al,ak,am end local ah=function(


ah, ai, aj, ak)
local al=y("TextLabel",{
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,-20),
Position=UDim2.fromScale(0,0.5),
AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,
TextSize=11,
ThemeTag={
OBJECTS=w,
TextColor3="Colors.Text.Default",
Font="Font.Medium"
}
})

local am=R[ah]
local an=P[ah].Container

local ao=y("TextLabel",{
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,-20),
Position=UDim2.new(0,12,0,15),
BackgroundTransparency=1,
TextWrapped=true,
TextSize=8,
RichText=true,
ThemeTag={
OBJECTS=am,
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})

local ap=y("TextButton","Option",{
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.new(1,0,0,25),
Text="",
ThemeTag={
OBJECTS=am,
BackgroundColor3="Colors.Buttons.Default"
},
Elements={
Corner=UDim.new(0,6)
},
Childs={
y("Frame","Holder",{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=ak,
Elements={
ListLayout={
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,2)
},
Padding={
PaddingBottom=UDim.new(0,5),
PaddingTop=UDim.new(0,5)
}
},
Childs={al,ao}
})
}
})

local aq=ap.Holder

p(ao:GetPropertyChangedSignal"Text",function()
local ar=#ao.Text>0

if ao.Visible~=ar then
local as=ar and 0 or 0.5
ao.Visible=ar
aq.Position=UDim2.fromScale(0,as)
aq.AnchorPoint=Vector2.new(0,as)
end
end)

al.Text=ai
ao.Text=aj or""

ap.Parent=an

return ap,al,ao end local ai=function(


ai, aj)
if type(aj)~="table"then
error(`"Tab.Add{ai}[Configs]". 'table' expected, got {typeof(aj)}`,2)
end

local ak=aj[1]or aj.Name or aj.Title
local al=aj.Desc or aj.Description

assert(type(ak)=="string",`"Tab.Add{ai}.Title". 'string' expected, got {typeof(ak)}`)

if al~=nil and type(al)~="string"then
error(`"Tab.Add{ai}.Description". 'string', or 'nil' expected, got {typeof(al)}`,2)
end

return ak,al or""end local aj=function(


aj, ak)
if ak~=nil and type(ak)~="string"then
error(`"Tab.Add{aj}.Flag". 'nil', or 'string' expected, got {typeof(ak)}`)
end

return ak end local ak=function()



local ak=160

local al={
Corner=UDim.new(0,6),
Stroke={
ThemeTag={
Color="Colors.Stroke"
}
},
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
}

local am=y("TextButton",OutBox,{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
Active=true,
Text=""
})

local an=y("Frame","Dropdown",am,{
Size=UDim2.fromOffset(ak,100),
Position=UDim2.fromOffset(50,50),
Elements=al,
Active=true,
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
}
})

local ao=y("TextButton","Search",an,{
Position=UDim2.new(1,5,0,5),
Size=UDim2.new(0,25,0,25),
AutomaticSize=Enum.AutomaticSize.X,
Active=true,
Elements=al,
Text="",
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
},
Childs={
y("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
PaddingTop=UDim.new(0,5)
}),
y("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection=Enum.FillDirection.Horizontal
}),
y("TextBox","SearchBox",{
Size=UDim2.fromScale(0,1),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,
PlaceholderText="Search...",
ClearTextOnFocus=false,
Text="",
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.Stroke",
TextColor3="Colors.Text.Default",
Font="Font.ExtraBold"
}
}),
y("ImageLabel","SearchIcon",{
Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ThemeTag={
BackgroundColor3="Colors.Stroke",
ImageColor3="Colors.Icons",
Image="Icons.Search"
}
})
}
})

local ap=y("ScrollingFrame",an,{
Size=UDim2.new(1,-6,1,-6),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
ScrollBarThickness=3,
BackgroundTransparency=1,
BorderSizePixel=0,
CanvasSize=UDim2.new(),
ScrollingDirection=Enum.ScrollingDirection.Y,
AutomaticCanvasSize=Enum.AutomaticSize.Y,
Active=true,
ThemeTag={
OBJECTS=w,
ScrollBarImageColor3="Colors.ScrollBar"
},
Elements={
Padding={
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingTop=UDim.new(0,5),
PaddingBottom=UDim.new(0,5)
},
ListLayout={
Padding=UDim.new(0,4)
}
}
})local _=

ao.SearchIcon
local ar=ao.SearchBox

local as=130

local at=F(an,"Size",UDim2.fromOffset(ak,0),0.2)
local au=F(ar,"Size",UDim2.new(0,as-30,1,0),0.3)
local av=F(ar,"Size",UDim2.new(0,0,1,0),0.2)

local aw={}
local ax=false
local ay=false
local az
local aA
local aB
local aC
local aD

local aE=0

local aF=25
local aG=(aF*12)+10
local aH=5 local aI=function(

aI)
local aJ=E.AbsoluteSize.Y/Z.Scale
return math.min((aF*math.max(aI,0.5))+10,aG,aJ/1.75)end local aJ=function()



local aJ=an.AbsolutePosition
local aK=an.AbsoluteSize

local aL=Vector2.new(k.X,k.Y)

local aM=aL.X>=aJ.X and aL.X<=(aJ.X+aK.X)
local aN=aL.Y>=aJ.Y and aL.Y<=(aJ.Y+aK.Y)

return aM and aN end local aK=function(


aK, aL)
local aM=aD.AbsolutePosition
local aN=aD.AbsoluteSize
local aO=E.AbsoluteSize
local aP=Z.Scale
local aQ=aI(aK)

local aR=aO.X/aP
local aS=aO.Y/aP
local aT=aM.X/aP
local aU=aM.Y/aP local _=
aN.X/aP
local aW=aN.Y/aP

local aX=aU+(aW/2)
local aY=aX-(aQ/2)

local aZ=aH
local a_=aS-aQ-aH

local a0=math.clamp(aY,aZ,a_)

local a1=Vector2.new(0,0)

if a0>(aS*0.7)then
a1=Vector2.new(0,1)
a0=math.min(aX+(aQ/2),aS-aH)
end

local a2=math.clamp(
aT,
aH,
aR-an.Size.X.Offset-(aH*2)-(ao.AbsoluteSize.X/aP)
)

return Vector2.new(a2,a0),a1 end local aL=function(...)



local aL,aM=aK(...)

an.AnchorPoint=aM
an.Position=UDim2.fromOffset(aL.X,aL.Y)end local aM=function()



if not ay then return end

ay=false

ar.Text=""
av:Play()
av.Completed:Wait()
ar.Visible=false end local aN=function()



if ay then return end

ay=true

ar.Visible=true
au:Play()

ar:CaptureFocus()

local aN=an.AbsoluteSize
local aO=E.AbsoluteSize
local aP=Z.Scale local _=
an.AnchorPoint

local aR=as*aP

local aS=an.AbsolutePosition.X

local aT=aS+aN.X+5+aR

if aT>aO.X-(aH*aP)then
local aU=(aO.X-aN.X-aR-5-(aH*aP))/aP

aU=math.max(aU,aH)

F(an,"Position",UDim2.fromOffset(aU,an.Position.Y.Offset),0.3):Play()
end end local aO=function(


aO)
if not ax then
az=aO
am.Parent=U
return true
end end local aP=function()



if ax then return end

if az then
az()
az=nil
end

task.spawn(aM)
ax=true
at:Play()
at.Completed:Wait()
am.Parent=nil
ax=false end local aQ=function()



if ar:IsFocused()then
aE=tick()
return nil
end

if(tick()-aE)>=0.3 and not aJ()then
aP()
end end local aR=function()



for aR,aS in aw do
aR.Parent=nil
aw[aR]=nil
end end local aS=function(


aS, aT)
aS.Selected=aT

if aS.Instance then
local aU=aS.Instance
local aV=aU.TextLabel
local aW=aU.Frame

local aX=aT and 0 or(aC and 0.8 or 1)
local aY=aT and 0 or 0.4
local aZ=UDim2.fromOffset(4,aT and 14 or 4)

if aU.Parent then
F(aW,"BackgroundTransparency",aX,0.35):Play()
F(aV,"TextTransparency",aY,0.35):Play()
F(aW,"Size",aZ,0.35):Play()
else
aV.TextTransparency=aY
aW.BackgroundTransparency=aX
aW.Size=aZ
end
end end local aT=function(


aT)
if ar.Visible==false or not aT then
local aU=aB and#aB or 0
an.Size=UDim2.fromOffset(ak,aI(aU))
return nil
end

if aT then
local aU=aT.Instance
local aV=I(ar.Text)
aU.Visible=#aV==0 or aT.SearchText:find(aV)~=nil

if aU.Visible~=false then
SEARCH_RESULT_COUNT+=1
an.Size=UDim2.fromOffset(ak,aI(SEARCH_RESULT_COUNT))
end
end end local aU=function(


aU, aV, aW, aX)
local aY=true

if aV=="+"or aV=="-"then
aY=aU.Selected==(aV=="+")
aW=aW:sub(2,-1)
end

return aY and aX:find(aW,1,true)~=nil end local aV=function(


aV, aW)
local aX=y("TextButton",{
Size=UDim2.new(1,0,0,21),
AutoButtonColor=false,
Text="",
Elements={
Corner=UDim.new(0,4)
},
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
},
Childs={
y("Frame",{
Position=UDim2.new(0,1,0.5),
Size=UDim2.new(0,4,0,4),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0,0.5),
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag={
BackgroundColor3="Colors.Primary"
}
}),
y("TextLabel",{
Size=UDim2.fromScale(1,1),
Position=UDim2.fromOffset(10,0),
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
TextTransparency=0.4,
Text=aV.DisplayName,
TextSize=9,
ThemeTag={
Font="Font.Bold",
TextColor3="Colors.Text.Default"
}
})
}
})

local aY=0

p(aX.Activated,function()
if(tick()-aY)<0 then return end

aY=tick()+0.2
aA(aV)
end)

aV.SearchText=I(aV.DisplayName)
aV.Instance=aX

if aW then
local aZ=ar.Text

if#aZ>0 then
local a_=string.sub(aZ,1,1)
local a0=I(ar.Text)
aX.Visible=aU(aV,a_,a0,aV.SearchText)
end

aX.Parent=ap
aT(aV)
end

aS(aV,aV.Selected)end local aW=function(


aW)
aR()
aB=aW

for aX=1,#aW do
local aY=aW[aX]
local aZ=aY.Instance

if aZ==nil then
aV(aY)
aZ=aY.Instance
end

aZ.Parent=ap
aw[aZ]=true
end

aL(#aW)
F(an,"Size",UDim2.fromOffset(ak,aI(#aW)),0.3):Play()end local aX=function()



local aX=ar.Text
local aY=string.sub(aX,1,1)
local aZ=I(aX)
local a_=#aZ==0
local a0=0

for a1=1,#aB do
local a2=aB[a1]
local a3=a_ or aU(a2,aY,aZ,a2.SearchText)
a2.Instance.Visible=a3

if a3 then
a0+=1
end
end

SEARCH_RESULT_COUNT=a0
an.Size=UDim2.fromOffset(ak,aI(a0))end


p(X:GetPropertyChangedSignal"Visible",aQ)
p(X:GetPropertyChangedSignal"Size",aQ)
p(am.MouseButton1Down,aQ)
p(am.Activated,aQ)

p(ao.Activated,aN)
p(ar:GetPropertyChangedSignal"Text",aX)

return table.freeze{
CreateOptionTemplate=aV,
SetOptionValue=aS,
CloseDropdown=aP,
OpenDropdown=aO,
SetOptions=aW,
Clear=aR,
SetOnClicked=function(...)
aA=...
end,
SetMultiSelect=function(...)
aC=...
end,
SetHolder=function(...)
aD=...
end
}end


local al




local ao=G({"number","string","nil","boolean","table"},true)local ap=function(

ap)
if al==nil then
al=G(Enum.KeyCode:GetEnumItems())
end

return typeof(ap)=="EnumItem"and al[ap]end


function ac:GetNoSelfCall(aq)
assert(type(aq)=="string",`"Tab.GetNoSelfCall". 'string' expected, got {typeof(aq)}`)
local ar=self[aq]
assert(type(ar)=="function",`"Tab.GetNoSelfCall". '{ar}' is not a 'function'-{aq}`)

return function(...)
return ar(self,...)
end
end

function ac:AddSection(aq)
assert(aq==nil or type(aq)=="string",`"Tab.AddSection[param 1]". 'string', or 'nil' expected, got {typeof(aq)}`)
aq=aq or""

local ar=R[self]

local as=y("Frame","Option",P[self].Container,{
Size=UDim2.new(1,0,0,20),
BackgroundTransparency=1
})

local at=y("TextLabel",as,{
TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,
Size=UDim2.new(1,-25,1,0),
Position=UDim2.new(0,5),
BackgroundTransparency=1,
TextSize=17,
Text=aq,
ThemeTag={
OBJECTS=ar,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

return setmetatable({
Title=aq,

DESTROY_ELEMENT=as,
VISIBLE_ELEMENT=as,
TITLE_LABEL=at,

Kind="Section",
Parent=self
},ad)
end

function ac:AddToggle(aq)
local ar,as=ai("Toggle",aq)
local at=aj("Toggle",aq[4]or aq.Flag)

local au=aq[2]or aq.Default or false
local av=A(aq[3]or aq.Callback)

if type(au)~="boolean"then
error(`"Tab.AddToggle.Default". 'boolean' expected, got {typeof(au)}`,2)
end

if at~=nil and type(_[at])=="number"then
au=_[at]==0
end

local aw=R[self]
local ax,ay,az=ah(self,ar,as,UDim2.new(1,-38,0,0))

local aA=y("Frame",ax,{
Size=UDim2.new(0,35,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag={
OBJECTS=aw,
BackgroundColor3="Colors.Stroke"
}
})

local aB=y("Frame",aA,{
BackgroundTransparency=1,
Size=UDim2.new(0.8,0,0.8,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5)
})

local aC={
OBJECTS=aw,
BackgroundColor3="Colors.OnPrimary"
}

local aD=y("Frame",aB,{
Size=UDim2.new(0,12,0,12),
Position=UDim2.new(0,0,0.5),
AnchorPoint=Vector2.new(0,0.5),
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag=aC
})local aE=function(

aE)
if at~=nil then _[at]=aE and 0 or 1 end
C(av,aE)

local aF=UDim2.new(aE and 1 or 0,0,0.5,0)
local aG=Vector2.new(aE and 1 or 0,0.5)
local aH=aE and"Colors.Primary"or"Colors.OnPrimary"
local aI=r(n.CurrentTheme,aH)

aC.BackgroundColor3=aH

if self.Selected then
F(aD,"Position",aF,0.25):Play()
F(aD,"AnchorPoint",aG,0.25):Play()
F(aD,"BackgroundColor3",aI,0.25):Play()
else
aD.Position=aF
aD.AnchorPoint=aG
aD.BackgroundColor3=aI
end end


local aF=af.Toggle.new(self,ax,ay,az,aE,av)

aF.Value=au

task.defer(aE,au)

local aG=0

p(ax.Activated,function()
if(tick()-aG)<0 then return end

aG=tick()+0.2
aF:SetValue(not aF.Value)
end)

return aF
end

function ac:AddButton(aq)
local ar,as=ai("Button",aq)
local at=A(aq[2]or aq.Callback)
local au=aq.Debounce or aq.Cooldown

local av=R[self]
local aw,ax,ay=ah(self,ar,as,UDim2.new(1,-20,0,0))

y("ImageLabel",aw,{
Size=UDim2.new(0,14,0,14),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
ThemeTag={
OBJECTS=av,
Image="Icons.Button"
}
})

local aA=0

p(aw.Activated,function()
if au~=nil and(tick()-aA)<0 then return end

if au~=nil then
aA=tick()+au
end

C(at)
end)

return setmetatable({
CALLBACKS=at,
DESTROY_ELEMENT=aw,
VISIBLE_ELEMENT=aw,
TITLE_LABEL=ax,
DESCRIPTION_LABEL=ay,

Title=ar,
Description=as,

Parent=self,
Kind="Button"
},ad)
end

function ac:AddTextBox(aq)
local ar,as=ai("TextBox",aq)
local at=aj("TextBox",aq[4]or aq.Flag)

local au=aq[2]or aq.Default
local av=A(aq[3]or aq.Callback)

local aw=aq.Placeholder or aq.PlaceholderText
local ax=aq.ClearOnFocus or aq.ClearTextOnFocus

if au~=nil and type(au)~="string"then
error(`"Tab.AddTextBox.Default". 'string', or 'nil' expected, got {typeof(au)}`,2)
end

if at and type(_[at])=="string"then
au=_[at]
end

local ay=R[self]
local az,aA,aB=ah(self,ar,as,UDim2.new(1,-150,0,0))

local aC=y("Frame",az,{
Size=UDim2.new(0,150,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
ThemeTag={
OBJECTS=ay,
BackgroundColor3="Colors.Stroke"
},
Elements={
Corner=UDim.new(0,4)
}
})

local aD=y("TextBox",aC,{
Size=UDim2.new(0.85,0,0.85,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,
TextScaled=true,
Active=true,
Text="",
PlaceholderText=v.TEXTBOX.PLACEHOLDER_TEXT,
ThemeTag={
OBJECTS=ay,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aE={
OBJECTS=ay,
Image="Icons.TextBox",
ImageColor3="Colors.Icons"
}

local aF=y("ImageLabel",aC,{
Size=UDim2.new(0,12,0,12),
Position=UDim2.new(0,-5,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
ThemeTag=aE
})

if au~=nil then
aD.Text=au
end

if ax~=nil then
aD.ClearTextOnFocus=ax
end

if aw~=nil then
aD.PlaceholderText=aw
end

local aG=af.TextBox.new(self,aA,aB,az,aD,av)local aH=function(

aH)
aE.ImageColor3=aH
F(aF,"ImageColor3",r(n.CurrentTheme,aH),0.5):Play()end


if at~=nil then
p(aD:GetPropertyChangedSignal"Text",function()
_[at]=aD.Text
end)
end

p(aD.Focused,function()
aH"Colors.Primary"
end)

p(aD.FocusLost,function()
aH"Colors.Icons"
local aI=aG.TEXTBOX_TEXT_FILTER

if aI then
local aJ=aI(aD.Text)
if type(aJ)=="string"then
aD.Text=aJ
end
end

C(av,aD.Text)
end)

p(az.Activated,function()
aD:CaptureFocus()
end)

return aG
end

function ac:AddSlider(aq)
local ar,as=ai("Slider",aq)
local at=aj("Slider",aq[7]or aq.Flag)

local au=aq[2]or aq.Min
local av=aq[3]or aq.Max
local aw=aq[4]or aq.Increment
local ax=aq[5]or aq.Default
local ay=A(aq[6]or aq.Callback)

if aw~=nil and type(aw)~="number"then
error(`"Tab.AddSlider.Increment". 'number', or 'nil' expected, got {typeof(aw)}`,2)
end

if ax~=nil and type(ax)~="number"then
error(`"Tab.AddSlider.Default". 'number', or 'nil' expected, got {typeof(ax)}`,2)
end

assert(type(au)=="number",`"Tab.AddSlider.Min", 'number' expected, got {typeof(au)}`)
assert(type(av)=="number",`"Tab.AddSlider.Max", 'number' expected, got {typeof(av)}`)

local az=R[self]
local aA=P[self].Container

local aB,aC,aD=ah(self,ar,as,UDim2.new(0.55,0,0,0))

if ax==nil then
ax=au
end

if aw==nil then
aw=1
end

if at~=nil and type(_[at])=="number"then
ax=_[at]
end

local aE=y("TextButton",aB,{
Size=UDim2.new(0.45,0,1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
AutoButtonColor=false,
BackgroundTransparency=1,
Text=""
})

local aF=y("Frame",aE,{
Size=UDim2.new(1,-20,0,6),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
OBJECTS=az,
BackgroundColor3="Colors.Stroke"
},
Elements={
Corner=UDim.new(0.5,0)
}
})

local aG=y("Frame",aF,{
Size=UDim2.fromScale(0,1),
BorderSizePixel=0,
ThemeTag={
OBJECTS=az,
BackgroundColor3="Colors.Primary"
},
Elements={
Corner=UDim.new(0.5,0)
}
})

local aH=y("Frame",aF,{
Size=UDim2.new(0,6,0,12),
BackgroundColor3=Color3.fromRGB(220,220,220),
Position=UDim2.fromScale(0,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=0.2,
Elements={
Corner=UDim.new(0,6)
}
})

local aI=y("TextLabel",aE,{
Size=UDim2.new(0,50,0,14),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,-1,0.5,0),
BackgroundTransparency=1,
TextSize=12,
TextXAlignment=Enum.TextXAlignment.Right,
ThemeTag={
OBJECTS=az,
TextColor3="Colors.Text.Default",
Font="Font.SliderValue"
}
})

local aJ=y("UIScale",aI)

local aK=af.Slider.new(self,aB,aC,aD,ay)

aK.Min=au
aK.Max=av
aK.Increment=aw local aL=function(

aL)
return(aL-au)/(av-au)end local aM=function(


aM)
return(aM*(av-au))+au end local aN=function(


aN)
return math.floor(aN * 100 + 0.5) / 100 end local aO=function(


aO, aP)
if aO==aK.Value then return end

if at~=nil then
_[at]=aO
end

task.defer(C,ay,aO)
aK.Value=aO

local aQ=UDim2.fromScale(aP,0.5)
local aR=UDim2.fromScale(aP,1)

  if aO == math.floor(aO) then
    aI.Text = tostring(aO)  
else
    aI.Text = string.format("%.1f", aO)  
end

if self.Selected then
F(aH,"Position",aQ,0.3):Play()
F(aG,"Size",aR,0.3):Play()
else
aH.Position=aQ
aG.Size=aR
end end local aP=function(


aP)
local aQ=math.clamp(aN(aP),au,av)
aO(aQ,aL(aQ))end


aK.WHEN_VALUE_CHANGED=aP local aQ=function(

aQ, aR)
local aS=(k.X-aQ.X)/aR.X
local aT=math.clamp(aS,0,1)
local aU=aM(aT)
local aV=aN(aU)
local aW=math.clamp(aV,au,av)
aO(aW,aL(aW))end


local aR=Random.new()
aP(ax)

p(aE.MouseButton1Down,function()
if u~=false then return end

F(aH,"BackgroundTransparency",0,0.3):Play()
aA.ScrollingEnabled=false
u=true

local aS=aF.AbsolutePosition
local aT=aF.AbsoluteSize

while d:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
aQ(aS,aT)
task.wait()
end

u=false
F(aH,"BackgroundTransparency",0.2,0.3):Play()
aA.ScrollingEnabled=true
end)

p(aI:GetPropertyChangedSignal"Text",function()
if not self.Selected then return end

aJ.Scale=0.3
F(aJ,"Scale",1.2,0.1):Play()

local aS=F(aI,"Rotation",aR:NextNumber(-7.5,7.5),0.15)
aS:Play()
aS.Completed:Wait()

F(aJ,"Scale",1,0.2):Play()
F(aI,"Rotation",0,0.1):Play()
end)

return aK
end

function ac:AddDiscordInvite(aq)
local ar,as=ai("DiscordInvite",aq)
local at=aq.Icon or aq.Image or aq.Logo
local au=aq.Banner or aq.BannerColor
local av=aq.Online or aq.MembersOnline
local aw=aq.Members or aq.TotalMembers
local ax=aq.Invite or aq.Link

assert(type(ax)=="string",`"Tab.AddDiscordInvite.Invite". 'string' expected, got {typeof(ax)}`)

if au~=nil and typeof(au)~="Color3"and type(au)~="string"then
error(`"Tab.AddDiscordInvite.Banner". 'nil', 'Color3', or 'string' expected, got {typeof(au)}`,2)
end

if av~=nil and type(av)~="number"then
error(`"Tab.AddDiscordInvite.Online". 'number' expected, got {typeof(av)}`,2)
end

if aw~=nil and type(aw)~="number"then
error(`"Tab.AddDiscordInvite.Members". 'nil', or 'number' expected, got {typeof(aw)}`,2)
end

if E.ZIndexBehavior~=Enum.ZIndexBehavior.Sibling then
E.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
end

local ay=R[self]
local az=P[self].Container

local aA=y("Frame","Option",az,{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,148)
})

local aB=y("CanvasGroup",aA,{
Size=UDim2.new(0,178,1,-15),
Position=UDim2.new(0,5,1,0),
AnchorPoint=Vector2.new(0,1),
ClipsDescendants=true,
Elements={
Corner=UDim.new(0,9),
Stroke={
ThemeTag={
Color="Colors.Border.Default"
}
}
},
ThemeTag={
OBJECTS=ay,
BackgroundColor3="Colors.Buttons.Default"
}
})

local aC=y("ImageLabel",aB,{
BackgroundColor3=Color3.new(1,1,1),
Size=UDim2.fromScale(1,0.28),
BackgroundTransparency=1
})

y("TextLabel",aA,{
Position=UDim2.fromOffset(5,0),
Size=UDim2.new(1,0,0,15),
TextColor3=Color3.fromRGB(40,150,255),
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
TextSize=9,
Text=ax,
ThemeTag={
OBJECTS=ay,
TextColor3="Colors.Link",
Font="Font.Medium"
}
})

y("ImageLabel",aB,{
Size=UDim2.fromOffset(33,33),
Position=UDim2.new(0,10,0.28,0),
AnchorPoint=Vector2.new(0,0.5),
Image=at,
ThemeTag={
OBJECTS=ay,
BackgroundColor3="Colors.Buttons.Default"
},
Elements={
Corner=UDim.new(0,8),
Stroke={
Thickness=2.2,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
ThemeTag={
OBJECTS=ay,
Color="Colors.Buttons.Default"
}
}
}
})

local aF=y("TextLabel",aB,{
Size=UDim2.new(1,-10,0,10),
Position=UDim2.new(0,10,0.44,0),
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
TextSize=11,
Text=ar,
ThemeTag={
OBJECTS=ay,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aG

if av or aw then
aG=y("Frame",aB,{
Size=UDim2.new(1,-10,0,9),
Position=UDim2.new(0,0,0.52,0),
BackgroundTransparency=1,
Elements={
Padding={
PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,10)
},
ListLayout={
HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Center,
FillDirection=Enum.FillDirection.Horizontal,
Padding=UDim.new(0,4),
}
}
})local aH=function(

aH, aI)
return y("Frame",aG,{
Size=UDim2.fromScale(0,1),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
Childs={
y("Frame",{
Size=UDim2.fromOffset(3,3),
Position=UDim2.new(0,5,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=aH,
Elements={
Corner=UDim.new(1,0)
}
}),
y("TextLabel",{
Size=UDim2.new(0,0,1,0),
Position=UDim2.new(0,12,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,
TextSize=7,
Text=aI,
ThemeTag={
OBJECTS=ay,
TextColor3="Colors.Text.Darker",
Font="Font.Normal"
}
})
}
})end


if av~=nil then
aH(Color3.fromRGB(67,181,129),J(av).." Online")
end
if aw~=nil then
aH(Color3.fromRGB(86,101,105),J(aw).." Members")
end
end

local aH=y("TextLabel",aB,{
Size=UDim2.new(1,-50,0,8),
Position=UDim2.new(0,10,aG and 0.6 or 0.56,0),
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
TextSize=8,
Text=as or"",
TextWrapped=true,
ThemeTag={
OBJECTS=ay,
TextColor3="Colors.Text.Darker",
Font="Font.Medium"
}
})

local aI=y("Frame",aB,{
Size=UDim2.new(1,0,0.28,0),
Position=UDim2.fromScale(0,1),
AnchorPoint=Vector2.new(0,1),
BorderSizePixel=0,
ThemeTag={
OBJECTS=ay,
BackgroundColor3="Colors.Buttons.Default"
}
})

if#aH.Text>0 then
aI.Size=UDim2.new(1,0,0.42,0)

y("UIGradient",aI,{
Rotation=-90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.00,0.00),
NumberSequenceKeypoint.new(0.60,0.00),
NumberSequenceKeypoint.new(1.00,1.00)
}
})
end

local aJ=y("TextButton",aI,{
Position=UDim2.new(0.5,0,1,-9),
Size=UDim2.new(1,-18,0,18),
AnchorPoint=Vector2.new(0.5,1),
Text="Go to Server",
Elements={
Corner=UDim.new(0.5,0)
},
ThemeTag={
OBJECTS=ay,
BackgroundColor3="Colors.JoinButton",
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aK=0

p(aJ.Activated,function()
if(tick()-aK)<0 then return end

aK=tick()+5
local aL=aJ.Text
aJ.Text="Copied to Clipboard!"
setclipboard(ax)
task.wait(4)
aJ.Text=aL
end)

if type(au)=="string"then
aC.ScaleType=Enum.ScaleType.Crop
aC.Image=au
elseif typeof(au)=="Color3"then
aC.BackgroundTransparency=0
y("UIGradient",aC,{
Rotation=-15,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,au),
ColorSequenceKeypoint.new(1,au:Lerp(Color3.new(1,1,1),0.2))
}
})
end

return setmetatable({
DESTROY_ELEMENT=aA,
VISIBLE_ELEMENT=aA,

Title=ar,
Description=as,
DESCRIPTION_LABEL=aH,
TITLE_LABEL=aF,

Kind="DiscordInvite",
Parent=self
},ad)
end

function ac:AddParagraph(aq,ar)
assert(type(aq)=="string",`"Tab.AddParagraph[param 1]". 'string' expected, got {typeof(aq)}`)

if ar~=nil and type(ar)~="string"then
error(`"Tab.AddParagraph[param 2]". 'string', or 'nil' expected, got {typeof(ar)}`,2)
end local _=

R[self]
local at,au,av=ah(self,aq,ar,UDim2.new(1,0,0,0))

return setmetatable({
DESTROY_ELEMENT=at,
VISIBLE_ELEMENT=at,
TITLE_LABEL=au,
DESCRIPTION_LABEL=av,

Title=aq,
Description=ar,

Parent=self,
Kind="Paragraph"
},ad)
end

function ac:AddDropdown(aq)
local ar,as=ai("Dropdown",aq)
local at=aj("Dropdown",aq[5]or aq.Flag)

local au=aq[2]or aq.Options
local av=aq[3]or aq.Default
local aw=A(aq[4]or aq.Callback)
local ax=aq.MultiSelect

if av~=nil and type(av)~="table"and type(av)~="string"then
error(`"Tab.AddDropdown.Default". 'string', 'table', or 'nil' expected, got {typeof(av)}`,2)
end

if au~=nil and type(au)~="table"then
error(`"Tab.AddDropdown.Options". 'table', or 'nil' expected, got {typeof(au)}`,2)
end

if ax~=nil and type(ax)~="boolean"then
error(`"Tab.AddDropdown.MultiSelect". 'boolean', or 'nil' expected, got {typeof(ax)}`,2)
end

if at and type(_[at])==(ax and"table"or"string")then
av=_[at]
end

local ay=R[self]
local az,aA,aB=ah(self,ar,as,UDim2.new(1,-150,0,0))

local aC=y("Frame",az,{
Size=UDim2.new(0,150,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
Elements={
Corner=UDim.new(0,4)
},
ThemeTag={
OBJECTS=ay,
BackgroundColor3="Colors.Stroke"
}
})

local aD=y("TextLabel",aC,{
Size=UDim2.new(0.85,0,0.85,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=1,
TextScaled=true,
Text="...",
ThemeTag={
OBJECTS=ay,
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aE={
OBJECTS=ay,
Image="Icons.Dropdown.Open",
ImageColor3="Colors.Icons"
}

local aF=y("ImageLabel",aC,{
Size=UDim2.new(0,15,0,15),
Position=UDim2.new(0,-5,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
ThemeTag=aE
})

local aG=af.Dropdown.new(self,az,aA,aB,aw)

local aH
local aI=false
local aJ=false

local aK={}
local aL={}
local aM={}
local aN={}

aG.DROPDOWN_OPTIONS=aM
aG.Opened=aJ local aO=function(

aO, aP)
aE.ImageColor3=aO
aE.Image=aP

F(aF,"ImageColor3",r(n.CurrentTheme,aO),0.35):Play()
aF.Image=r(n.CurrentTheme,aP)end local aP=function(


aP)
aJ=aP
aG.Opened=aP

local aQ=aP and"Colors.Primary"or"Colors.Icons"
local aR=aP and"Icons.Dropdown.Close"or"Icons.Dropdown.Open"
aO(aQ,aR)end local aQ=function()



aP(false)end local aR=function()



local aR={}
for aS,aT in aL do
if not aT then continue end
aR[#aR+1]=aS
end
return aR end local aS=function(


aS)
local aT=type(aS)=="table"and table.concat(aS,", ")or(aS or"")

if#aT>=100 then
aT=aT:sub(1,97).."..."
end

aD.Text=#aT~=0 and aT or"..."end local aT=function()



aI=false

local aT=ax and aR()or aH and aH.Name
C(aw,ax and aL or aT)
aS(aT)

if at~=nil then
_[at]=aT
end end local aU=function()



if not aI then
aI=true
task.delay(0.1,aT)
end end local aV=function(


aV)
if ax then
local aW=not aV.Selected
T.SetOptionValue(aV,aW)
aL[aV.Name]=aW
else
if aH==aV then
return nil
elseif aH~=nil then
T.SetOptionValue(aH,false)
end

aH=aV
T.SetOptionValue(aV,true)
end

aU()end local aW=function(


aW)
aW=tostring(aW)
if aN[aW]then return end

local aX={
Name=aW,
DisplayName=aW,
Selected=false
}

if ax and aL[aW]==nil then
aL[aW]=false
end

aN[aW]=aX
aM[#aM+1]=aX
return aX end local aX=function(


aX)
if aJ==aX then return end

if not T then
T=ak()
end

if aX then
if not T.OpenDropdown(aQ)then return end

T.SetHolder(aC)
T.SetMultiSelect(ax)
T.SetOnClicked(aV)
T.SetOptions(aM)
else
T.CloseDropdown()
end

aP(aX)end local aY=function(


aY, aZ)
if aZ and type(aY)=="boolean"then
return aY==true and aM[aZ]
end

return if type(aY)=="number"then aM[aY]else aN[tostring(aY)]end local aZ=function(


aZ)
aZ.Selected=true

if ax then
aL[aZ.Name]=true
else
aH=aZ
end end local a_=function(...)



local a_=aY(...)

if a_ then
aZ(a_)
elseif ax and type(...)=="string"then
aK[select(1,...)]=true
end end local a0=function()



if not av then return end

for a0=1,(ax and#av or 1)do
a_(av[a0],a0)
end end local a1=function(


a1)
local a2=table.find(aM,a1)

if a2 then
table.remove(aM,a2)
end

if a1.Instance then
a1.Instance:Destroy()
end

aN[a1.Name]=nil end local a2=function(


a2)
if ax then
local a3=a2.Name
return(aL[a3]or aK[a3])==true
else
return aH and aH.Name==a2.Name
end end


aG.ADD_DROPDOWN_OPTION=function(a3)
if type(a3)=="table"then
for a4=1,#a3 do
aG:Add(a3[a4])
end

return nil
end

local a4=aW(a3)

if a4 then
if aG.Opened then
T.CreateOptionTemplate(a4,true)
end

if a2(a4)then
aZ(a4)

if a4.Instance then
T.SetOptionValue(a4,a4.Selected)
end
end

aU()
end
end

aG.REMOVE_DROPDOWN_OPTION=function(a3)
local a4=aN[tostring(a3)]
if a4 then
a1(a4)
end
end

aG.CLEAR_DROPDOWN=function()
for a3=#aM,1,-1 do
local a4=aM[a3]
if a4.Instance then
a4.Instance:Destroy()
end

aN[a4.Name]=nil
aM[a3]=nil
end

if aG.Opened then
T.Clear()
end
end

do
if au then
for a3=1,#au do
aW(au[a3])
end
end

if type(av)=="table"then
a0()
elseif type(av)=="string"or type(av)=="number"then
local a3=aY(av)

if a3 then
aZ(a3)
end
end

if ax then
local a3=aR()
task.defer(C,aw,aL)
aS(a3)
else
local a3=aH
local a4=a3 and a3.Name or""
task.defer(C,aw,a4)
aS(a4)
end
end

p(az.Activated,function()
aX(not aJ)
end)

return aG
end

function ac:Destroy()
assert(type(self)=="table"and self.IS_A_TAB,`"Tab.Destroy". {tostring(self)} is not a tab`)
if self.IS_DESTROYED then return end
local aq=table.find(O,self)
assert(aq,`"Tab.Destroy". failed to destroy '{self.Title}'`)

table.remove(O,aq)

for ar,as in P[self]do
as:Destroy()
end

R[self]:destroy()

P[self]=nil
R[self]=nil

setmetatable(self,nil)
end

function ac:Select()
if Y==self then
return nil
end

if Y then
Q[Y].Unselect()
end

Y=self
Q[Y].Select()
end

function ad:SetTitle(aq)
assert(type(aq)=="string",`"Option.SetTitle". 'string' expected, got {typeof(aq)}`)
assert(self.TITLE_LABEL,`"Option.SetTitle". cannot change this option name {self.KIND}:{self.Title}`)

self.TITLE_LABEL.Text=aq
self.Title=aq
return self
end

function ad:SetDescription(aq)
assert(aq==nil or type(aq)=="string",`"Option.SetDescription". 'string', or 'nil' expected, got {typeof(aq)}`)
assert(self.DESCRIPTION_LABEL,`"Option.SetDescription". cannot change this option description {self.KIND}:{self.Title}`)

self.DESCRIPTION_LABEL.Text=aq
self.Description=aq
return self
end

function ad:SetVisible(aq)
assert(typeof(self.VISIBLE_ELEMENT)=="Instance",`"Option.SetVisible". cannot change this option visibility {self.KIND}:{self.Title}`)
assert(type(aq)=="boolean",`"Option.SetVisible". 'boolean' expected, got {typeof(aq)}`)

self.VISIBLE_ELEMENT.Visible=aq
end

function ad:Destroy()
assert(typeof(self.DESTROY_ELEMENT)=="Instance",`"Option.Destroy". cannot destroy this option {self.KIND}:{self.Title}`)

self.DESTROY_ELEMENT:Destroy()
setmetatable(self,nil)

self.Destroyed=true
end

function ad:AddCallback(aq)
assert(self.CALLBACKS,"\"Option.AddCallback\". cannot add callback to this option.")
assert(type(aq)=="function",`"Option.AddCallback[param 1]". 'function' expected, got {typeof(aq)}`)

table.insert(self.CALLBACKS,aq)
return self
end

ad.NewCallback=ad.AddCallback
ad.SetContent=ad.SetDescription
ad.SetDesc=ad.SetDescription

function ae:CreateMobileMinimizer(aq)
local ar=y("ImageButton",E,{
Size=UDim2.fromOffset(35,35),
Position=UDim2.fromScale(0.17,0.28),
AnchorPoint=Vector2.new(0.5,0.5),
AutoButtonColor=false,
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
}
})

p(ar.Activated,function()
ab:Minimize()
end)

aq.Elements={}

if aq.Corner then
aq.Elements.Corner=aq.Corner
aq.Corner=nil
end

if aq.Stroke then
aq.Elements.Stroke=aq.Stroke
aq.Stroke=nil
end

x.Draggable(ar,Z,0.5)
x.SetProperties(ar,aq)

return ar
end

function ae:SetKeyCode(aq)
if not ap(aq)then
error(`"Minimizer.SetKeyCode[param 1]". 'KeyCode' expected, got {typeof(aq)}`,2)
end

self.KeyCode=aq
end

function ab:SelectTab(aq)
local ar=type(aq)=="number"and O[aq]

if type(aq)=="table"and aq.IS_A_TAB then
ar=aq
end

if ar then
ar:Select()
elseif not ar then
assert(type(aq)=="number",`"Window.SelectTab" number or tab expected, got {typeof(aq)}`)
assert(aq>0,`"Window.SelectTab" the number must be greater than 0, value: {aq}`)
assert(aq==math.floor(aq),`"Winow.SelectTab" floor number expected, got {aq}`)

self.SelectedTab=aq
end
end

function ab:Minimize()
X.Visible=not X.Visible
end

function ab:MakeTab(aq)
local ar=aq[1]or aq.Name or aq.Title
local as=aq[2]or aq.Icon or aq.Image

assert(type(ar)=="string",`"Tab.Title" 'string' expected, got {typeof(ar)}`)
assert(as==nil or type(as)=="string",`"Tab.Icon" 'string' expected, got {typeof(as)}`)

local at=setmetatable({
Selected=self.SelectedTab==#O+1,
Icon=n:GetIconByName(as),
Title=ar,

Parent=self,
IS_A_TAB=true
},ac)

local au=self:GetElements()
local av=au.TabsContainer
local aw=au.ContainerHolder

local ax,ay,az=ag(self,at,av)

local aA=F(ay,"Size",UDim2.new(1,0,1,0),0.3)
local aB=UDim2.new(1,0,1,150)

local aC=0.45

local aD={
F(az,"BackgroundTransparency",0,aC),
F(az,"Size",UDim2.fromOffset(4,13),aC)
}

local aE={
F(az,"BackgroundTransparency",1,aC),
F(az,"Size",UDim2.fromOffset(4,4),aC)
}

local aF=w:new()
R[at]=aF local aG=function(

aG)
for aH=1,#aG do
aG[aH]:Play()
end end local aH=function()



aG(aD)
at.Selected=true
aF:changeRendering(true)
aF:update()
ay.Parent=aw
ay.Size=aB
aA:Play()end local aI=function()



aG(aE)
at.Selected=false
ay.Parent=nil
aF:changeRendering(false)end


Q[at]=table.freeze{
Unselect=aI,
Select=aH
}

P[at]=table.freeze{
SelectTabButton=ax,
Container=ay
}

table.insert(O,at)

p(ax.Activated,function()
at:Select()
end)

if at.Selected then
at:Select()
end

return at
end

function ab:StartWindow(aq)
local ar=aq.MinimizeButton
local as=aq.MainFrame
local at=aq.Resizers
local au=aq.TopBar

local av=aq.SubTitle
local aw=aq.Title

U=aq.Dropdowns
X=aq.MainFrame
Z=aq.UIScale
_=aq.Flags

local ax=as.Size
local ay=0

function ab:MinimizeButton()
if(tick()-ay)<0 then
return false
end

if self.Minimized then
ar.Image="rbxassetid://10734896206"
F(as,"Size",ax,0.25):Play()
else
ax=as.Size
ar.Image="rbxassetid://10734924532"
F(as,"Size",UDim2.fromOffset(as.Size.X.Offset,au.Size.Y.Offset),0.25):Play()
end

for az,aA in at do
aA.Visible=self.Minimized
end

self.Minimized=not self.Minimized
ay=tick()+0.5

return true
end

function ab:GetTitle()
return aw.Text
end

function ab:GetSubTitle()
return av.Text
end

function ab:SetTitle(az)
assert(type(az)=="string",`"Window.SetTitle". 'string' expected, got {typeof(az)}`)
assert(#az>0,"\"Window.SetTitle\". the new 'Title' is too short.")

aw.Text=az
end

function ab:SetSubTitle(az)
assert(type(az)=="string",`"Window.SetSubTitle". 'string' expected, got {typeof(az)}`)
assert(#az>0,"\"Window.SetSubTitle\". the new 'SubTitle' is too short.")

av.Text=az
end

S=y("Frame",E,{
Size=UDim2.new(0,280,1,0),
Position=UDim2.fromScale(1,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
Elements={
Padding={
PaddingBottom=UDim.new(0,20)
},
ListLayout={
HorizontalAlignment=Enum.HorizontalAlignment.Center,
VerticalAlignment=Enum.VerticalAlignment.Bottom,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,20)
}
}
})

W=y("TextButton","OutBox",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.3,
AutoButtonColor=false,
Text="",
ThemeTag={
BackgroundColor3="Colors.Buttons.Default"
},
Childs={
as:FindFirstChildOfClass"UICorner":Clone(),
y("Frame","Template",{
Size=UDim2.new(0.35,60,0.20,80),
Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
Elements={
Corner=UDim.new(0,6),
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
},
Childs={
y("TextLabel","Title",{
Size=UDim2.new(1,-20,0,20),
TextTruncate=Enum.TextTruncate.AtEnd,
TextSize=15,
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=1,
ThemeTag={
Font="Font.ExtraBold",
TextColor3="Colors.Text.Default"
}
}),
y("TextLabel","Description",{
Position=UDim2.new(0.5,0,0,46),
Size=UDim2.new(1,-20,0,0),
AnchorPoint=Vector2.new(0.5,0),
TextWrapped=true,
TextSize=11,
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Colors.Text.Darker",
Font="Font.Medium"
}
}),
y("Frame","Options",{
Size=UDim2.new(1,-20,0.15,18),
Position=UDim2.new(0.5,0,1,-10),
AnchorPoint=Vector2.new(0.5,1),
BackgroundTransparency=1,
Elements={
Padding={
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,30),
PaddingTop=UDim.new(0,30)
},
ListLayout={
HorizontalAlignment=Enum.HorizontalAlignment.Right,
VerticalAlignment=Enum.VerticalAlignment.Center,
FillDirection=Enum.FillDirection.Horizontal
}
}
})
}
})
}
})

W.Template:SetAttribute("OriginalSize",W.Template.Size)

p(W.Activated,function()
if V~=nil and not V.Closing and not V.Closed then
V:Close()
end
end)

ab.StartWindow=nil
end

function ab:DeleteFlags()
return _()
end

function ab:SetFlag(aq,ar)
assert(type(aq)=="string",`"Window.SetFlag[param 1]". 'string' expected, got {typeof(aq)}`)

if ao[typeof(ar)]~=true then
local as={}

for at,au in ao do
table.insert(as,at)
end

return error(`"Window.SetFlag[param 2]". '{table.concat(as,"', '")}' expected, got {typeof(ar)}`,2)
end

_[aq]=ar
end

function ab:GetFlag(aq)
return _[aq]
end

function ab:NewMinimizer(aq)
local ar=type(aq)=="table"and(aq[1]or aq.KeyCode)or aq

if not ap(ar)then
error(`"Window.NewMinimizer.KeyCode". 'KeyCode' expected, got {typeof(ar)}`,2)
end

local as=setmetatable({
KeyCode=ar
},ae)

p(d.InputBegan,function(at)
if at.KeyCode==as.KeyCode then
ab:Minimize()
end
end)

return as
end

function ab:Dialog(aq)
if self.Minimized then
while not self:MinimizeButton()do task.wait()end
end

if V then
V:Close(true)
end

local ar=aq.Title or aq.Name
local as=aq.Content or aq.Description
local at=aq.Options

assert(type(ar)=="string",`"Window.Dialog.Title". 'string' expected, got {typeof(ar)}`)
assert(type(as)=="string",`"Window.Dialog.Content". 'string' expected, got {typeof(as)}`)
assert(type(at)=="table",`"Window.Dialog.Options". 'table' expected, got {typeof(at)}`)
assert(#at>0,"\"Window.Dialog.Options\". requires one or more options.")local au=function()


local au=W.Template
local av=au.Description
local aw=au.Title

local ax=au:GetAttribute"OriginalSize"
local ay=UDim2.new(ax.X.Scale*1.2,ax.X.Offset,ax.Y.Scale*1.2,ax.Y.Offset)

au.Size=ay
W.Parent=X
av.Text=as
aw.Text=ar

F(au,"Size",ax,0.3):Play()

local az=af.Dialog.new(av,aw)
az.NEW_SIZE=ay
az.TEMPLATE=au

for aA,aB in au.Options:GetChildren()do
if aB:IsA"GuiObject"then
aB:Destroy()
end
end

for aA=#at,1,-1 do
az:NewOption(at[aA])
end

return az end


V=au()
return V
end

function ab:SetNotifyDefaultIcon(aq)
assert(type(aq)=="string",`"Window.SetNotifyDefaultIcon[param 1]". 'string' expected, got {typeof(aq)}`)

aa=aq
end

function ab:Notify(aq)
if type(aq)~="table"then
aq={}
end

local ar=aq[1]or aq.Name or aq.Title
local as=aq[2]or aq.Content
local at=aq[3]or aq.Icon or aq.Image
local au=aq[4]or aq.Duration or aq.Countdown or aq.Time

if self.NOTIFICATION_GROUP then
if au==nil then au=self.Duration end
if as==nil then as=self.Content end
if ar==nil then ar=self.Title end
if at==nil then at=self.Icon end
end

assert(type(ar)=="string",`"Window.Notify.Title". 'string' expected, got {typeof(ar)}`)
assert(type(as)=="string",`"Window.Notify.Content". 'string' expected, got {typeof(ar)}`)
assert(at==nil or type(at)=="string",`"Window.Notify.Icon". 'nil' or 'string' expected, got {typeof(at)}`)

if au~=nil and type(au)~="number"then
error(`"Window.Notify.Time". 'number', or 'nil' expected, got {typeof(au)}`,2)
elseif au==nil then
au=5
end

local av=y("Frame","Notification",S,{
Size=UDim2.new(0.85,0,0,60),
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.Y
})

local aw=y("TextButton",av,{
AutomaticSize=Enum.AutomaticSize.Y,
Size=UDim2.fromScale(1,1),
AutoButtonColor=false,
Text="",
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
},
Elements={
Corner=UDim.new(0,9),
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
}
})

local ax=y("UIScale",av)

local ay=y("Frame","Holder",aw,{
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Elements={
ListLayout={
SortOrder=Enum.SortOrder.LayoutOrder,
VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,4)
},
Padding={
PaddingBottom=UDim.new(0,8),
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,40)
}
}
})

local az=y("TextLabel",ay,{
Size=UDim2.new(1,0,0,20),
TextTruncate=Enum.TextTruncate.AtEnd,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Bottom,
BackgroundTransparency=1,
TextSize=14,
ThemeTag={
TextColor3="Colors.Text.Default",
Font="Font.Bold"
}
})

local aA=y("TextLabel",ay,{
Size=UDim2.new(1,0,0,20),
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
TextWrapped=true,
TextSize=12,
ThemeTag={
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})

local aB=y("ImageLabel",aw,{
Size=UDim2.fromOffset(24,24),
Position=UDim2.new(0,8,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Colors.Icons"
}
})

local aC=y("TextLabel",aw,{
Size=UDim2.new(0,40,0,16),
Position=UDim2.new(1,-10,0,8),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
TextSize=10,
ThemeTag={
TextColor3="Colors.Text.Darker",
Font="Font.Normal"
}
})

local aD=false

local aE=F(ax,"Scale",1.22,0.35)
local aF=F(ax,"Scale",1.00,0.35)

local aG=setmetatable({
TITLE_LABEL=az,
DESCRIPTION_LABEL=aA,
VISIBLE_ELEMENT=av,
DESTROY_ELEMENT=av,
NOTIFICATION=aw,

Kind="Notification",
Closed=false,
Parent=self
},ad)

function aG:Close()
if self.Closed==true then return end

self:Destroy()
self.Closed=true

local aH=F(aw,"Position",UDim2.fromScale(3,0),0.8)
aH:Play()
aH.Completed:Wait()
av:Destroy()
end local aH=function()


at=n:GetIconByName(at or aa)
aB.Image=at

if not K(at)then
aB.Visible=false
ay.UIPadding.PaddingLeft=UDim.new(0,15)
end

aw.Position=UDim2.fromScale(3,0)
F(aw,"Position",UDim2.fromScale(0,0),0.35):Play()

az.Text=ar
aA.Text=as

local aH=aw.MouseLeave

while au>0 do
aC.Text=M(au)
if aD==true then aH:Wait()end
au-=task.wait()
end

aG:Close()end


p(aw.MouseButton1Down,function()aE:Play()aD=true end)
p(aw.MouseLeave,function()aF:Play()aD=false end)

task.defer(aH)

return aG
end

function ab:NewNotifyGroup(aq)
local ar=aq[1]or aq.Name or aq.Title
local as=aq[2]or aq.Content
local at=aq[3]or aq.Icon or aq.Image
local au=aq[4]or aq.Duration or aq.Countdown or aq.Time

if ar~=nil and type(ar)~="string"then
error(`"Window.NewNotifyGroup.Title". 'string', or 'nil' expected, got {typeof(ar)}`,2)
end

if as~=nil and type(as)~="string"then
error(`"Window.NewNotifyGroup.Content". 'string', or 'nil' expected, got {typeof(as)}`,2)
end

if at~=nil and type(at)~="string"then
error(`"Window.NewNotifyGroup.Icon". 'string', or 'nil' expected, got {typeof(at)}`,2)
end

if au~=nil and type(au)~="number"then
error(`"Window.NewNotifyGroup.Time". 'number', or 'nil' expected, got {typeof(au)}`,2)
end

return{
NOTIFICATION_GROUP=true,
Notify=ab.Notify,

Duration=au,
Content=as,
Title=ar,
Icon=at,
}
end

ab.NewNotificationGroup=ab.NewNotifyGroup
ab.SetDefaultNotifyIcon=SetNotifyDefaultIcon
ab.Notificafion=ab.Notify

N.Window=ab
end local aa=function(

aa, ab)
local ac=ab.Size.Y.Offset
local ad=UDim2.new(0,aa.TabSize or n.Default.TabSize,1,-ac)
local ae=UDim2.new(1,-ad.X.Offset,1,-ac)

local af=y("ScrollingFrame","TabsScroll",{
AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
ScrollBarThickness=2.2,
BackgroundTransparency=1,
ScrollBarImageTransparency=0.2,
CanvasSize=UDim2.new(),
BorderSizePixel=0,
Size=ad,
ThemeTag={
ScrollBarImageColor3="Colors.ScrollBar"
},
Elements={
Padding={
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingTop=UDim.new(0,10),
PaddingBottom=UDim.new(0,10)
},
ListLayout={
Padding=UDim.new(0,5)
}
}
})

local ag=y("Frame","Containers",{
Size=ae,
AnchorPoint=Vector2.new(1,1),
Position=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ClipsDescendants=true
})

return af,ag end


function n:GetIconByName(ab)
if ab==nil then return end
assert(ab,`"Library.GetIconByName". 'string' expected, got {typeof(ab)}`)

if K(ab)or#ab==0 then
return ab
end

local ac=I(ab)

if self.Icons[ac]then
return"rbxassetid://"..self.Icons[ac]
end

for ad,ae in self.Icons do
if ad:find(ac,1,true)then
return"rbxassetid://"..ae
end
end
end

function n:IsValidTheme(ab)
assert(type(ab)=="string",`"Library.IsValidTheme". string extected, got {typeof(ab)}`)

return self.Themes[ab]~=nil
end

function n:GetThemes()
local ab={}
for ac,ad in self.Themes do
table.insert(ab,ac)
end
return ab
end

function n:GetTheme(ab)
assert(ab==nil or type(ab)=="string",`"Library.GetTheme". 'string' expected, got {typeof(ab)}`)

if ab==nil then
return self.CurrentTheme
end

local ac=self.Themes[ab]
assert(ac~=nil,`"Library.GetTheme". theme not found: {ab}`)
return ac
end

function n:SetTheme(ab)
assert(type(ab)=="string",`"Library.SetTheme". string extected, got {typeof(ab)}`)
local ac=self.Themes[ab]
assert(ac,`"Library.SetTheme". theme not found: {ab}`)

self.CurrentTheme=ac
self.WindowSettings.SelectedTheme=ac.Name

w:update()
end

function n:SetUIScale(ab)
local ac=v.MIN_SCALE
local ad=v.MAX_SCALE

assert(type(ab)=="number",`"Library.SetUIScale". 'number' expected, got {typeof(ab)}`)
assert(ab>=ac and ab<=ad,`"Library.SetUIScale". Min Scale: {ac}, Max Scale: {ad}`)

E.Scale.Scale=L(ab)
end

function n:GetMaxScale()
return v.MAX_SCALE
end

function n:GetMinScale()
return v.MIN_SCALE
end

function n:GetCurrentTheme()
if not self.LOADED_UI_LIBRARY then
return error("failed to get current theme: UI is not loaded",2)
end
return self.CurrentTheme
end

function n:Destroy()
for ab,ac in self.Connections do
ac:Disconnect()
end

if E and E:GetAttribute"UID"==self.SCREENGUI_UID then
pcall(E.Destroy,E)
end
end

function n:MakeWindow(ab)
if self.LOADED_UI_LIBRARY then
return error("you can create only 1 Window",2)
end

local ac=math.random()
E:SetAttribute("UID",ac)
self.SCREENGUI_UID=ac
E:ClearAllChildren()

local ad=y("UIScale","Scale",E,{
Scale=L(1)
})

local ae={
Title=ab[1]or ab.Name or ab.Title,
SubTitle=ab[2]or ab.SubName or ab.SubTitle,
ScriptFolder=ab[3]or ab.ScriptFolder or ab.FolderName
}

assert(type(ae.Title)=="string",`"Window.Title". 'string' expected, got {typeof(ae.Title)}`)
assert(type(ae.SubTitle)=="string",`"Window.SubTitle". 'string' expected, got {typeof(ae.SubTitle)}`)

if ae.ScriptFolder~=nil and type(ae.ScriptFolder)~="string"then
return error(`"Window.ScriptFolder". 'string', or nil expected, got {typeof(ae.ScriptFolder)}`,2)
end

if ae.ScriptFolder~=nil and string.find(ae.ScriptFolder,"/")then
return error("\"Window.ScriptFolder\" is not valid, unexpected char \"/\"",2)
end

local af=(function()
local af=ae.ScriptFolder
local ag=false local

ah, ai=pcall(function()
return af and f:JSONDecode(readfile(`{af}/LibrarySettings.json`))
end)

if type(ai)~="table"then
ai={}
end local aj=function()


ag=false

return pcall(function()
return writefile(`{af}/LibrarySettings.json`,f:JSONEncode(ai))
end)end local ak=function(


ak, al, am)
rawset(ai,al,am)

if af and not ag then
ag=true
task.delay(0.5,aj)
end end


return setmetatable({},{
__newindex=ak,
__index=ai
})
end)()

local ag=(function()
local ag=ae.ScriptFolder
local ah=false local

ai, aj=pcall(function()
return ag and f:JSONDecode(readfile(`{ag}/ScriptFlags.json`))
end)

if type(aj)~="table"then
aj={}
end local ak=function()


ah=false

return pcall(function()
writefile(`{ag}/ScriptFlags.json`,f:JSONEncode(aj))
end)end local al=function(


al, am, an)
rawset(aj,am,an)

if ag and not ah then
ah=true
task.delay(0.5,ak)
end end local am=function()



table.clear(aj)
return pcall(function()
return ag and(delfile or deletefile)(`{ag}/ScriptFlags.json`)
end)end


return setmetatable({},{
__newindex=al,
__call=am,
__index=aj
})
end)()

self.ThemesObjects=w
self.WindowSettings=af
self.Flags=ag

self.Icons=(function()
local ah=ae.ScriptFolder

local ai,aj=pcall(function()
return loadstring(readfile(`{ah}/Icons.lua`))()
end)

if ai and type(aj)=="table"then
return aj
end

local ak=`https://raw.githubusercontent.com/{self.Information.GitHubOwner}`
local al=`{ak}/Library/refs/heads/main/redz-V5-remake/Utils/Icons.lua`
local am local an=function()


return writefile(`{ah}/Icons.lua`,am)end


local ao,ap=pcall(function()
am=game:HttpGet(al)
return loadstring(am)()
end)

if ao and type(ap)=="table"then
if type(am)=="string"then
pcall(an)
end

return ap
end

return{}
end)()

if type(af.SelectedTheme)=="string"and self:IsValidTheme(af.SelectedTheme)then
self:SetTheme(af.SelectedTheme)
else
self:SetTheme(self.Default.Theme)
end

self.LOADED_UI_LIBRARY=true

local ah=self.Default.UISize

if af and type(af.UISize)=="table"then
local ak,al=unpack(af.UISize)

if type(ak)=="number"and type(al)=="number"then local _=
E.AbsoluteSize
ak=math.clamp(ak,430,1000)
al=math.clamp(al,200,500)
ah=UDim2.fromOffset(ak,al)
end
end

local ak=y("Frame","Window",E,{
Position=UDim2.new(0.5,-ah.X.Offset/2,0.5,-ah.Y.Offset/2),
Active=true,
Size=ah,
ThemeTag={
BackgroundTransparency="BackgroundTransparency"
},
Elements={
Corner=UDim.new(0,8),
Gradient={
Rotation=45,
ThemeTag={
Color="Colors.Background"
}
}
}
})

p(ak.Destroying,function()
self:Destroy()
end)

p(E:GetAttributeChangedSignal"UID",function()
self:Destroy()
ak:Destroy()
end)

x.Draggable(ak,ad,0.5)

local al=y("Folder","Components",ak)
local am=y("Folder","Dropdowns",E)

local an=y("Frame","TopBar",al,{
Size=UDim2.new(1,0,0,28),
BackgroundTransparency=1
})

local ao=y("TextLabel","Title",an,{
TextXAlignment=Enum.TextXAlignment.Left,
AutomaticSize=Enum.AutomaticSize.XY,
Position=UDim2.new(0,15,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
Text=ae.Title,
TextSize=12,
BackgroundTransparency=1,
ThemeTag={
TextColor3="Colors.Text.Default",
Font="Font.Bold"
},
Childs={
y("TextLabel","SubTitle",{
Size=UDim2.fromScale(0,1),
AutomaticSize="X",
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(1,5,0.9),
Text=ae.SubTitle,
BackgroundTransparency=1,
TextXAlignment="Left",
TextYAlignment="Bottom",
TextSize=8,
ThemeTag={
TextColor3="Colors.Text.Dark",
Font="Font.Normal"
}
})
}
})

local ap=y("Folder","Buttons",an,{
Childs={
y("ImageButton","Close",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-10,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,35,35),
AutoButtonColor=false,
ThemeTag={
Image="Icons.Close"
},
Elements={
Corner=UDim.new(0.2,0)
}
}),
y("ImageButton","Minimize",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-35,0.5),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
Image="rbxassetid://10734896206",
AutoButtonColor=false,
Elements={
Corner=UDim.new(0.2,0)
}
})
}
})

local aq=ap.Minimize
local ar=ap.Close

local as=setmetatable(ae,{
__index=N.Window
})

local at,au=aa(af,an)

at.Parent=al
au.Parent=al

local av=table.freeze{
ContainerHolder=au,
TabsContainer=at,
Components=al,
MainFrame=ak
}

function as:GetElements()
return av
end

local aw=y("Frame","ControlWindowSize",ak,{
Size=UDim2.new(0,35,0,35),
Position=ak.Size,
AnchorPoint=Vector2.new(0.8,0.8),
BackgroundTransparency=1,
Active=true,
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.OnPrimary"
}
})

local ax=y("Frame","ControlTabsSize",ak,{
Size=UDim2.new(0,16,0.75,-30),
Position=UDim2.new(0,at.Size.X.Offset,0.5,15),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
Elements={
Corner=UDim.new(0,6)
},
ThemeTag={
BackgroundColor3="Colors.OnPrimary"
}
})local ay=function(

ay)
local az=ay:GetAttribute"Resizing"
ay:SetAttribute("Resizing",tick())

if az and(tick()-az)<=0.1 then
return nil
end

F(ay,"BackgroundTransparency",0.5,0.3):Play()
while tick()-ay:GetAttribute"Resizing"<=0.1 do task.wait()end
F(ay,"BackgroundTransparency",1,0.4):Play()end


p(aw:GetPropertyChangedSignal"Position",function()
ay(aw)
local az=aw.Position
ak.Size=az
af.UISize={az.X.Offset,az.Y.Offset}
end)

p(ax:GetPropertyChangedSignal"Position",function()
ay(ax)
local az=ax.Position
at.Size=UDim2.new(0,az.X.Offset,1,-an.Size.Y.Offset)
au.Size=UDim2.new(1,-at.Size.X.Offset,1,-an.Size.Y.Offset)
af.TabSize=az.X.Offset
end)

x.Draggable(aw,ad,0.68,function(az,aA,aB,aC)
return UDim2.fromOffset(math.clamp(aA,430,1000),math.clamp(aC,200,500))
end)

x.Draggable(ax,ad,0.68,function(aA,aB)
return UDim2.new(0,math.clamp(aB,135,210),0.5,15)
end)

local aA={
Title="Close Window?",
Content="You Want Close UI?",
Options={
{
Title="Yes",
Callback=function()self:Destroy()end
},
{
Title="No"
}
}
}

p(aq.MouseEnter,function()aq.BackgroundTransparency=0.65 end)
p(aq.MouseLeave,function()aq.BackgroundTransparency=1.00 end)

p(ar.MouseEnter,function()ar.BackgroundTransparency=0.65 end)
p(ar.MouseLeave,function()ar.BackgroundTransparency=1.00 end)

as.SetUIScale=self.SetUIScale
as.SUBTITLE_LABEL=ao.SubTitle
as.TITLE_LABEL=ao

as:StartWindow{
Resizers={aw,ax},
MinimizeButton=aq,
Dropdowns=am,
MainFrame=ak,
TopBar=an,

SubTitle=ao.SubTitle,
Title=ao,

UIScale=ad,
Flags=ag
}

p(aq.Activated,function()
as:MinimizeButton()
end)

p(ar.Activated,function()
as:Dialog(aA)
end)

return as
end

return n
