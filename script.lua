repeat wait() until game:IsLoaded()

if LPH_OBFUSCATED == nil then
	LPH_NO_VIRTUALIZE = function(...) return (...) end
	LPH_ENCSTR = function(...) return (...) end
	LRM_SANITIZE = function(...) return ... end
end

local cloneref = cloneref or function(o) return o end
local TweenService = cloneref(game:GetService("TweenService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Players = cloneref(game:GetService("Players"))
local TextService = cloneref(game:GetService("TextService"))
local HttpService = cloneref(game:GetService("HttpService"))
local Lighting = cloneref(game:GetService("Lighting"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local Workspace = cloneref(game:GetService("Workspace"))

local LocalPlayer = cloneref(Players.LocalPlayer)

local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled

if identifyexecutor and identifyexecutor() == "Wave" then
	getgenv().gethui = function()
		return game:GetService("CoreGui")
	end
end

local Folder_Configs = {
	Directory = "sportsclub",
	Images = "sportsclub/Images",
}

if type(isfolder) == "function" and type(makefolder) == "function" then
	if not isfolder(Folder_Configs.Directory) then
		makefolder(Folder_Configs.Directory)
	end
	if not isfolder(Folder_Configs.Images) then
		makefolder(Folder_Configs.Images)
	end
end

local ProjectId = "22cad4542e792a9c"
local SdkUrl = "https://api.polsec.sh/sdk"
local LoaderBase = "https://api.polsec.sh/loader"

local function StealAnEggBypass()
	if getgenv().sportsclub_steal_an_egg_ac_bypassed then
		return
	end
	if type(filtergc) ~= "function" or type(debug) ~= "table" or type(debug.getupvalues) ~= "function" or type(setrawmetatable) ~= "function" then
		return
	end
	local Tamper = filtergc("function", { Constants = { "gmatch", "GetFullName" } }, true)
	if Tamper then
		local Upvalues = debug.getupvalues(Tamper)
		for Index = 1, #Upvalues do
			if type(Upvalues[Index]) == "table" then
				setrawmetatable(Upvalues[Index], { __newindex = function() end })
			end
		end
	end
	getgenv().sportsclub_steal_an_egg_ac_bypassed = true
end

local Config = {
	File = "sportsclub/license_key.json",
	Settings = "sportsclub/loader_settings.json",
	KeyLink = "https://polsec.sh/ad/5f0b619a6d027235",
	Shop = "https://sportsclub.fun/#store",
	Discord = "https://discord.gg/gUbZegrB6g",
	Sniper = 7264587281,
	Bypasses = {
		[7264587281] = "https://pastebin.com/raw/9GqpPtwk",
		[9908641400] = "https://pastebin.com/raw/UwQPRTXQ",
		[6726637224] = "https://pastebin.com/raw/nDTMkYuc",
		[10563114921] = StealAnEggBypass,
	},
}

local GameList = {
	[66654135] = "009ff4a78983f850",
	[73885730] = "c1383e4dbc04c894",
	[113491250] = "c4d3ef0c29176832",
	[184199275] = "3b7bd9142a45d559",
	[372226183] = "6bf87ae2d1b86339",
	[383310974] = "c3114c8b9a6def3c",
	[2459091562] = "75fba2f42d4b54f3",
	[4293374620] = "0f10cc5ff028f81e",
	[4777817887] = "8a66fc1161d29f0e",
	[4931927012] = "1231151b59c9dcf8",
	[4949420752] = "cc50c53a4adb4571",
	[5091490171] = "f30b089bcccf364f",
	[5595353122] = "f941ecf9c2893c84",
	[5995470825] = "c9da2143136ce8d5",
	[6035872082] = "c8a45ca0b25139a3",
	[6061766680] = "d52ba1c5c0dc5c11",
	[6216285188] = "e8147fe214540335",
	[6260656796] = "b0d2c57249d2ec06",
	[6331902150] = "ade0e0dfb65b8dab",
	[6726637224] = "bf1f1aa1d5bec70f",
	[6739698191] = "30bd8f3b21d19783",
	[6931042565] = "98c663b5cac918d2",
	[7094518649] = "ea549e345bb6bc5c",
	[7108384194] = "a25ea6b8888984e3",
	[7264587281] = "5f0b619a6d027235",
	[7585140258] = "db37f21dad9c7ac1",
	[7633926880] = "981acf63e98b3571",
	[7883776681] = "ecfb28ceae344a4e",
	[7884563721] = "137bb216d0fdab55",
	[8307114974] = "32a3f9f1781977ef",
	[8795154789] = "931dcf7ba70b7dc5",
	[9112256336] = "34a15184cb6a7ee4",
	[9167377564] = "82f7f927a73f1de1",
	[9294074907] = "31655f9162e3aa8f",
	[9534705677] = "e2fabbf7654aed38",
	[9561553764] = "e823cdbf57675025",
	[9641502068] = "d65fbd7db286df7d",
	[9908641400] = "e648818e624401de",
	[9931749389] = "858f757ed4641d2b",
	[10031562156] = "e930337182b904f9",
	[10057403337] = "b92fa39292be5ddc",
	[10144280947] = "31696135af052840",
	[10155360168] = "f135c2d3a0febabf",
	[10230942274] = "dc478626c0c0f9de",
	[10476380360] = "67b2e03a3469e076",
	[10539411000] = "308fe2805126001d",
	[10563114921] = "ebcff09f785a4a30",
	[10648640958] = "24b4a31160224f3c",
}

local ScriptId = GameList[game.GameId]

if type(ScriptId) ~= "string" or ScriptId == "" then
	StarterGui:SetCore("SendNotification", {
		Title = "sportsclub",
		Text = "This game is not supported.",
	})
	return
end

local Library = loadstring(game:HttpGet(SdkUrl))()
Library.script_id = ScriptId

local function Copy(Text)
	if setclipboard then
		setclipboard(Text)
	elseif toclipboard then
		toclipboard(Text)
	end
end

local function ReadJson(Path)
	if not isfile or not readfile or not isfile(Path) then
		return nil
	end
	local Ok, Raw = pcall(readfile, Path)
	if not Ok or type(Raw) ~= "string" or Raw == "" then
		return nil
	end
	local Decoded, Data = pcall(HttpService.JSONDecode, HttpService, Raw)
	if not Decoded or type(Data) ~= "table" then
		return nil
	end
	return Data
end

local function LoadSavedKey()
	local Data = ReadJson(Config.File)
	if not Data or type(Data.key) ~= "string" or Data.key == "" then
		return nil
	end
	local Expires = tonumber(Data.expires_at)
	if Expires and Expires > 0 and Expires < os.time() then
		if delfile then
			pcall(delfile, Config.File)
		end
		return nil
	end
	return Data.key
end

local function SaveKey(Key, Data)
	if not writefile then
		return
	end
	if makefolder and isfolder and not isfolder(Folder_Configs.Directory) then
		pcall(makefolder, Folder_Configs.Directory)
	end
	pcall(writefile, Config.File, HttpService:JSONEncode({
		key = Key,
		note = Data and Data.note or nil,
		discord_id = Data and Data.discord_id or nil,
		expires_at = Data and Data.expires_at or nil,
		saved_at = os.time(),
	}))
end

local function LoadSettings()
	local Data = ReadJson(Config.Settings)
	if not Data then
		return {
			discord_join_disabled = false,
		}
	end
	return {
		discord_join_disabled = Data.discord_join_disabled == true,
	}
end

local function InstallDiscordGuard()
	if getgenv().sportsclub_discord_join_guard_installed == true then
		return
	end
	getgenv().sportsclub_discord_join_guard_installed = true
	getgenv().sportsclub_discord_join_disabled = true
	if type(hookfunction) ~= "function" then
		return
	end

	local function Hook(Target)
		if type(Target) ~= "function" then
			return
		end
		local Original
		local Ok, Result = pcall(hookfunction, Target, function(Opts)
			local Url = type(Opts) == "table" and (Opts.Url or Opts.url)
			local Body = type(Opts) == "table" and (Opts.Body or Opts.body)
			if type(Url) == "string" and string.find(Url, "127.0.0.1:6463", 1, true) and type(Body) == "string" and string.find(Body, "INVITE_BROWSER", 1, true) then
				return { StatusCode = 200, Body = "{}" }
			end
			return Original(Opts)
		end)
		if Ok and type(Result) == "function" then
			Original = Result
		end
	end

	Hook(request)
	if type(syn) == "table" then
		Hook(syn.request)
	end
	Hook(http_request)
	if type(http) == "table" then
		Hook(http.request)
	end
end

if LoadSettings().discord_join_disabled then
	InstallDiscordGuard()
end

local function EnsureSniper()
	if game.GameId ~= Config.Sniper then
		return
	end
	local Link = Config.Bypasses[game.GameId]
	if type(Link) ~= "string" then
		return
	end
	local Existing = getgenv().sportsclub_sniper_duels_ac_bypass
	if getgenv().sportsclub_sniper_duels_ac_bypassed and type(Existing) == "table" and Existing.ready == true then
		return
	end
	pcall(function()
		loadstring(game:HttpGet(Link))()
	end)
	local Started = os.clock()
	while os.clock() - Started < 15 do
		local Api = getgenv().sportsclub_sniper_duels_ac_bypass
		if type(Api) == "table" and Api.ready == true then
			return
		end
		local Moderation = game:FindFirstChild("ModerationService")
		if Moderation and (Moderation:GetAttribute("SD_SOFT_READY") == true or Moderation:GetAttribute("SD_FULL_READY") == true) then
			return
		end
		task.wait(0.1)
	end
end

local function ApplyKey(Key, Data)
	script_key = Key
	getgenv().script_key = Key
	getgenv().PolSec_Note = Data and Data.note or nil
	getgenv().PolSec_Key_Note = Data and Data.note or nil
	getgenv().PolSec_Expiry = Data and Data.expires_at or nil
	getgenv().PolSec_UserId = Data and Data.discord_id or nil
	getgenv().PolSec_Discord_Id = Data and Data.discord_id and tostring(Data.discord_id) or nil
	getgenv().polsec_script_id = ScriptId
	local Note = Data and Data.note
	if type(Note) == "string" then
		local Clean = string.lower((Note:gsub("^%s+", ""):gsub("%s+$", "")))
		getgenv().sportsclub_premium = Clean ~= "" and Clean ~= "keysystem" and Clean ~= "trail"
	else
		getgenv().sportsclub_premium = false
	end
	SaveKey(Key, Data)
end

local function LoadGame()
	local Bypass = Config.Bypasses[game.GameId]
	if game.GameId ~= Config.Sniper then
		if type(Bypass) == "string" then
			loadstring(game:HttpGet(Bypass))()
		elseif type(Bypass) == "function" then
			Bypass()
		end
	end
	loadstring(game:HttpGet(LoaderBase .. "/" .. ProjectId .. "/" .. ScriptId))()
end

local function TimeLeft(Expires)
	Expires = tonumber(Expires)
	if not Expires or Expires <= 0 then
		return "Lifetime"
	end
	local Left = Expires - os.time()
	if Left < 0 then
		return "Expired"
	end
	local Days = math.floor(Left / 86400)
	local Hours = math.floor((Left % 86400) / 3600)
	local Minutes = math.floor((Left % 3600) / 60)
	local Seconds = math.floor(Left % 60)
	if Days > 0 then
		return string.format("%dd %dh %dm", Days, Hours, Minutes)
	elseif Hours > 0 then
		return string.format("%dh %dm %ds", Hours, Minutes, Seconds)
	elseif Minutes > 0 then
		return string.format("%dm %ds", Minutes, Seconds)
	end
	return string.format("%ds", Seconds)
end

local function CheckKey(Key)
	Key = type(Key) == "string" and Key:gsub("^%s+", ""):gsub("%s+$", "") or ""
	if Key == "" then
		return false, "Enter a key"
	end
	local Ok, Result = pcall(Library.check_key, Key)
	if not Ok or type(Result) ~= "table" then
		return false, tostring(Result)
	end
	if Result.status ~= "key_valid" then
		local User = type(Result.user) == "table" and Result.user or nil
		return false, tostring(Result.message or (User and User.blacklist_reason) or Result.status)
	end
	local User = type(Result.user) == "table" and Result.user or {}
	return true, {
		note = User.note,
		expires_at = User.key_expires,
		discord_id = User.discord_id or User.discordId,
		ad_key = User.ad_key == true,
	}, Key
end

-- ============================================================
-- KEY SYSTEM BYPASS: CheckKey always returns valid
-- ============================================================
CheckKey = function(Key)
	return true, {
		note = "premium",
		expires_at = 0,
		discord_id = "0",
		ad_key = true,
	}, "BYPASSED_KEY"
end
-- ============================================================

EnsureSniper()

do
	local wait = task.wait
	local spawn = task.spawn

	local FromRGB = Color3.fromRGB
	local UDim2New = UDim2.new
	local UDimNew = UDim.new
	local Vector2New = Vector2.new
	local InstanceNew = Instance.new

	local Theme = {
		Background = FromRGB(8, 9, 12),
		Element = FromRGB(16, 18, 21),
		Ghost = FromRGB(22, 25, 30),
		Hover = FromRGB(28, 32, 39),
		Text = FromRGB(255, 255, 255),
		White = FromRGB(255, 255, 255),
		Muted = FromRGB(141, 148, 163),
		Inactive = FromRGB(141, 148, 163),
		Accent = FromRGB(61, 158, 255),
		AccentHover = FromRGB(10, 124, 255),
		Border = FromRGB(255, 255, 255),
		Danger = FromRGB(220, 70, 70),
		Success = FromRGB(70, 190, 120),
	}

	local FontFace do
		local Ok, Face = pcall(function()
			return Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
		end)
		FontFace = (Ok and Face) or Font.fromEnum(Enum.Font.GothamMedium)
	end

	local GetUI = gethui or function()
		return game:GetService("CoreGui")
	end

	local function SafeGetUI()
		local Ok, Result = pcall(GetUI)
		if Ok and Result then
			return Result
		end
		return game:GetService("CoreGui")
	end

	local function Create(Class, Props)
		local Inst = InstanceNew(Class)
		for Key, Value in Props do
			if Key ~= "Parent" then
				Inst[Key] = Value
			end
		end
		if Props.Parent then
			Inst.Parent = Props.Parent
		end
		return Inst
	end

	local function Corner(Parent, Radius)
		return Create("UICorner", {
			Parent = Parent,
			CornerRadius = UDimNew(0, Radius or 5),
		})
	end

	local function Stroke(Parent, Color, Transparency)
		return Create("UIStroke", {
			Parent = Parent,
			Color = Color or Theme.Border,
			Thickness = 1,
			Transparency = Transparency or 0,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		})
	end

	local function Tween(Inst, Info, Goal)
		local Tw = TweenService:Create(Inst, Info or TweenInfo.new(0.16, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), Goal)
		Tw:Play()
		return Tw
	end

	local LogoUrl = "https://i.postimg.cc/6ymQ15Wp/08c26f03-9879-4205-a019-f3261a52ab6e.png"
	local LogoFallback = "rbxassetid://95278592199657"

	local function GetLogoAsset()
		if type(getcustomasset) ~= "function" or type(writefile) ~= "function" then
			return LogoFallback
		end
		local images_dir = Folder_Configs.Images
		if type(isfolder) == "function" and not isfolder(images_dir) and type(makefolder) == "function" then
			pcall(makefolder, images_dir)
		end
		local file_path = images_dir .. "/brand.png"
		if type(isfile) ~= "function" or not isfile(file_path) then
			local ok, content = pcall(function()
				return game:HttpGet(LogoUrl)
			end)
			if not ok or type(content) ~= "string" or content == "" then
				return LogoFallback
			end
			if not pcall(writefile, file_path, content) then
				return LogoFallback
			end
		end
		local ok, asset_id = pcall(getcustomasset, file_path)
		if ok and type(asset_id) == "string" and asset_id ~= "" then
			return asset_id
		end
		return LogoFallback
	end

	local OpenInfo = TweenInfo.new(0.48, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local CloseInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

	local function OpenKeyUI(Prefill, StatusText, StatusColor)
		local Pad = IsMobile and 16 or 14
		local LogoS = IsMobile and 48 or 44
		local BtnH = IsMobile and 44 or 38
		local BtnGap = 8
		local FieldH = IsMobile and 42 or 38
		local PanelW = IsMobile and 360 or 400
		local TitleSize = 16
		local ContentW = PanelW - Pad * 2
		local HalfW = math.floor((ContentW - BtnGap) / 2)
		local DescY = Pad + TitleSize + 4
		local FieldY = Pad + LogoS + 6
		local HintH = 16
		local HintY = FieldY + FieldH + 4
		local BtnY = HintY + HintH + 6
		local Row2Y = BtnY + BtnH + BtnGap
		local Row3Y = Row2Y + BtnH + BtnGap
		local TimeY = Row3Y + BtnH + 6
		local PanelH = TimeY + 28
		local Rest = UDim2New(0.5, 0, 0.5, 0)
		local CloseSize = IsMobile and 24 or 22

		local ScreenGui = Create("ScreenGui", {
			Parent = SafeGetUI(),
			Name = "\0",
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			DisplayOrder = 999,
			ZIndexBehavior = Enum.ZIndexBehavior.Global,
		})

		local UIScale = Create("UIScale", {
			Parent = ScreenGui,
			Scale = 1,
		})

		local Main = Create("CanvasGroup", {
			Parent = ScreenGui,
			AnchorPoint = Vector2New(0.5, 0.5),
			Position = UDim2New(0.5, 0, 0.5, 20),
			Size = UDim2New(0, PanelW, 0, PanelH),
			BackgroundColor3 = Theme.Background,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			GroupTransparency = 1,
			ZIndex = 2,
		})
		Corner(Main, 10)

		local DragArea = Create("Frame", {
			Parent = Main,
			Size = UDim2New(1, 0, 0, Pad + LogoS),
			BackgroundTransparency = 1,
			ZIndex = 3,
		})

		local CloseBtn = Create("TextButton", {
			Parent = Main,
			Size = UDim2New(0, TitleSize, 0, TitleSize),
			Position = UDim2New(0, Pad, 0, Pad),
			BackgroundColor3 = Theme.White,
			BackgroundTransparency = 1,
			FontFace = FontFace,
			Text = "×",
			TextColor3 = Theme.White,
			TextSize = 16,
			AutoButtonColor = false,
			ZIndex = 6,
		})
		Corner(CloseBtn, 6)

		local BrandRow = Create("Frame", {
			Parent = Main,
			Size = UDim2New(0, 0, 0, TitleSize + 2),
			Position = UDim2New(0, Pad + CloseSize + 6, 0, Pad),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			ZIndex = 5,
		})

		Create("UIListLayout", {
			Parent = BrandRow,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDimNew(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		local function BrandPart(Text, Color, Order)
			return Create("TextLabel", {
				Parent = BrandRow,
				Size = UDim2New(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundTransparency = 1,
				FontFace = FontFace,
				Text = Text,
				TextColor3 = Color,
				TextSize = TitleSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				LayoutOrder = Order,
				ZIndex = 5,
			})
		end

		BrandPart("sports", Theme.Accent, 1)
		BrandPart("club", Theme.White, 2)
		BrandPart(".fun", Theme.White, 3)

		local Chip = Create("Frame", {
			Parent = Main,
			AnchorPoint = Vector2New(1, 0),
			Position = UDim2New(1, -Pad, 0, Pad),
			Size = UDim2New(0, LogoS, 0, LogoS),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 5,
		})
		Corner(Chip, 8)

		local Logo = Create("ImageLabel", {
			Parent = Chip,
			AnchorPoint = Vector2New(0.5, 0.5),
			Position = UDim2New(0.5, 0, 0.5, 0),
			Size = UDim2New(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image = LogoFallback,
			ScaleType = Enum.ScaleType.Fit,
			ZIndex = 6,
		})

		spawn(function()
			local Asset = GetLogoAsset()
			if Asset and Logo.Parent then
				Logo.Image = Asset
			end
		end)

		Create("TextLabel", {
			Parent = Main,
			Size = UDim2New(0, ContentW - LogoS - 8, 0, 16),
			Position = UDim2New(0, Pad, 0, DescY),
			BackgroundTransparency = 1,
			FontFace = FontFace,
			Text = "Enter your license key to continue",
			TextColor3 = Theme.Text,
			TextSize = IsMobile and 13 or 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 4,
		})

		local KeyBox = Create("Frame", {
			Parent = Main,
			Size = UDim2New(0, ContentW, 0, FieldH),
			Position = UDim2New(0, Pad, 0, FieldY),
			BackgroundColor3 = Theme.Element,
			BorderSizePixel = 0,
			ZIndex = 3,
		})
		Corner(KeyBox, 9)
		local InputStroke = Stroke(KeyBox, Theme.Border, 0.92)

		local Box = Create("TextBox", {
			Parent = KeyBox,
			Size = UDim2New(1, -20, 1, 0),
			Position = UDim2New(0, 10, 0, 0),
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			FontFace = FontFace,
			PlaceholderText = "Enter your key",
			PlaceholderColor3 = Theme.Muted,
			Text = type(Prefill) == "string" and Prefill or "",
			TextColor3 = Theme.Text,
			TextSize = IsMobile and 15 or 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 4,
		})

		local BtnText = IsMobile and 14 or 13

		local function SideBtn(Text, X, Y, W)
			local Btn = Create("TextButton", {
				Parent = Main,
				Size = UDim2New(0, W, 0, BtnH),
				Position = UDim2New(0, X, 0, Y),
				BackgroundColor3 = Theme.Ghost,
				BorderSizePixel = 0,
				FontFace = FontFace,
				Text = Text,
				TextColor3 = Theme.Text,
				TextSize = BtnText,
				AutoButtonColor = false,
				ZIndex = 4,
			})
			Corner(Btn, 9)
			Stroke(Btn, Theme.Border, 0.92)
			Btn.MouseEnter:Connect(function()
				Tween(Btn, nil, { BackgroundColor3 = Theme.Hover })
			end)
			Btn.MouseLeave:Connect(function()
				Tween(Btn, nil, { BackgroundColor3 = Theme.Ghost })
			end)
			return Btn
		end

		local ContinueBtn = Create("TextButton", {
			Parent = Main,
			Size = UDim2New(0, HalfW, 0, BtnH),
			Position = UDim2New(0, Pad, 0, BtnY),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 4,
		})
		local ContinueFill = Create("Frame", {
			Parent = ContinueBtn,
			Size = UDim2New(1, 0, 1, 0),
			BackgroundColor3 = Theme.White,
			BorderSizePixel = 0,
			ZIndex = 4,
		})
		Corner(ContinueFill, 9)
		Create("UIGradient", {
			Parent = ContinueFill,
			Rotation = 135,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Theme.Accent),
				ColorSequenceKeypoint.new(1, Theme.AccentHover),
			}),
		})
		local ContinueLabel = Create("TextLabel", {
			Parent = ContinueBtn,
			Size = UDim2New(1, 0, 1, 0),
			BackgroundTransparency = 1,
			FontFace = FontFace,
			Text = "Continue",
			TextColor3 = Theme.White,
			TextSize = BtnText,
			ZIndex = 5,
		})

		local GetKeyBtn = SideBtn("Get Key", Pad + HalfW + BtnGap, BtnY, HalfW)

		Create("TextLabel", {
			Parent = Main,
			Size = UDim2New(0, ContentW, 0, HintH),
			Position = UDim2New(0, Pad, 0, HintY),
			BackgroundTransparency = 1,
			FontFace = FontFace,
			Text = "Get a key, then paste it in then click continue below",
			TextColor3 = Theme.Muted,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 4,
		})

		local SkipBtn = SideBtn("Skip Keysystem", Pad, Row2Y, ContentW)
		local DiscordBtn = SideBtn("Join Discord", Pad, Row3Y, ContentW)

		local Status = Create("TextLabel", {
			Parent = Main,
			Size = UDim2New(1, -(Pad * 2), 0, 16),
			Position = UDim2New(0, Pad, 0, TimeY),
			BackgroundTransparency = 1,
			FontFace = FontFace,
			Text = StatusText or "Time Left: N/A",
			TextColor3 = StatusColor or Theme.Inactive,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 4,
		})

		local Busy = false
		local Closed = false

		CloseBtn.MouseEnter:Connect(function()
			Tween(CloseBtn, nil, { BackgroundTransparency = 0.8 })
		end)
		CloseBtn.MouseLeave:Connect(function()
			Tween(CloseBtn, nil, { BackgroundTransparency = 1 })
		end)

		do
			local Dragging, DragStart, StartPos, Changed
			DragArea.InputBegan:Connect(function(Input)
				if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				Dragging = true
				DragStart = Input.Position
				StartPos = Main.Position
				if Changed then
					return
				end
				Changed = Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
						Changed:Disconnect()
						Changed = nil
					end
				end)
			end)
			UserInputService.InputChanged:Connect(function(Input)
				if not Dragging then
					return
				end
				if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				local Delta = (Input.Position - DragStart) / (UIScale.Scale or 1)
				Main.Position = UDim2New(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
			end)
		end

		local function SetStatus(Text, Color)
			Status.Text = Text
			Status.TextColor3 = Color or Theme.Inactive
		end

		local function Dismiss(After)
			if Closed then
				return
			end
			Closed = true
			local Here = Main.Position
			Tween(Main, CloseInfo, {
				GroupTransparency = 1,
				Position = UDim2New(Here.X.Scale, Here.X.Offset, Here.Y.Scale, Here.Y.Offset + 12),
			})
			wait(0.22)
			ScreenGui:Destroy()
			if After then
				After()
			end
		end

		local function RunValidate()
			if Busy or Closed then
				return
			end
			Busy = true
			ContinueLabel.Text = "Checking..."
			Box.TextEditable = false
			SetStatus("Validating key...", Theme.Inactive)
			spawn(function()
				local Ok, DataOrErr, Key = CheckKey(Box.Text)
				if Closed then
					return
				end
				if not Ok then
					Busy = false
					ContinueLabel.Text = "Continue"
					Box.TextEditable = true
					Tween(InputStroke, nil, { Color = Theme.Danger, Transparency = 0 })
					SetStatus(tostring(DataOrErr), Theme.Danger)
					return
				end
				SetStatus("Time Left: " .. TimeLeft(DataOrErr.expires_at), Theme.Success)
				ApplyKey(Key, DataOrErr)
				Dismiss(LoadGame)
			end)
		end

		local LookupToken = 0

		local function LookupKey(Now)
			LookupToken = LookupToken + 1
			local Token = LookupToken
			local Key = type(Box.Text) == "string" and Box.Text:gsub("^%s+", ""):gsub("%s+$", "") or ""
			local function Run()
				if Token ~= LookupToken or Closed or Busy then
					return
				end
				if Key == "" then
					SetStatus("Time Left: N/A", Theme.Inactive)
					return
				end
				SetStatus("Checking...", Theme.Inactive)
				spawn(function()
					local Ok, Data = CheckKey(Key)
					if Token ~= LookupToken or Closed or Busy then
						return
					end
					if not Ok then
						SetStatus(tostring(Data), Theme.Danger)
						return
					end
					SetStatus("Time Left: " .. TimeLeft(Data.expires_at), Theme.Success)
				end)
			end
			if Now or #Key < 8 then
				if not Now and #Key < 8 then
					SetStatus("Time Left: N/A", Theme.Inactive)
					return
				end
				Run()
				return
			end
			task.delay(0.35, function()
				if Token ~= LookupToken then
					return
				end
				Run()
			end)
		end

		Box:GetPropertyChangedSignal("Text"):Connect(function()
			if Busy or Closed then
				return
			end
			LookupKey(false)
		end)
		Box.Focused:Connect(function()
			Tween(InputStroke, nil, { Color = Theme.Accent, Transparency = 0 })
		end)
		ContinueBtn.MouseButton1Click:Connect(RunValidate)
		Box.FocusLost:Connect(function(Enter)
			if InputStroke.Color ~= Theme.Danger then
				Tween(InputStroke, nil, { Color = Theme.Border, Transparency = 0.92 })
			end
			if Enter then
				LookupKey(true)
			end
		end)
		GetKeyBtn.MouseButton1Click:Connect(function()
			Copy(Config.KeyLink)
			SetStatus("Key link copied", Theme.Accent)
		end)
		SkipBtn.MouseButton1Click:Connect(function()
			Copy(Config.Shop)
			SetStatus("Store link copied", Theme.Accent)
		end)
		DiscordBtn.MouseButton1Click:Connect(function()
			Copy(Config.Discord)
			SetStatus("Discord link copied", Theme.Accent)
		end)
		CloseBtn.MouseButton1Click:Connect(function()
			Dismiss()
		end)

		if type(Prefill) == "string" and Prefill ~= "" then
			spawn(function()
				local Ok, Data = CheckKey(Prefill)
				if Ok and Status.Parent then
					SetStatus("Time Left: " .. TimeLeft(Data.expires_at), Theme.Inactive)
				end
			end)
		end

		Tween(Main, OpenInfo, { GroupTransparency = 0, Position = Rest })
	end

	local function TrySilent(Key)
		local Ok, Data, Normalized = CheckKey(Key)
		if not Ok then
			return false
		end
		ApplyKey(Normalized, Data)
		LoadGame()
		return true
	end

	-- ============================================================
	-- BYPASS: Skip key UI, auto-apply premium key, load game
	-- ============================================================
	ApplyKey("BYPASSED_KEY", {
		note = "premium",
		expires_at = 0,
		discord_id = "0",
	})
	getgenv().sportsclub_premium = true
	LoadGame()
	return
	-- ============================================================
end
