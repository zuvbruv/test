local a
local aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, as, at =
	{
		function()
			local b, c, d = a(1)
			local e
			return (function(...)
				local f, g, h = game:GetService("HttpService"), game:GetService("UserInputService"), c
				local i, j = h.components, c.packages
				local k, l, m, n, o = d(j.fusion), d(j.states), d(j.damerau), d(j.cmdr), d(c.Elements)
				local p, q, r, s, t = k.Children, k.ForPairs, k.New, k.Observer, c.utils
				local u, v, w, x, y, z, A, B = d(t.unwrap), d(t.insertitem), d(i.commandbar.bar), d(i.commandbar.suggestions), d(i.commandbar.suggestion), d(c.storage.theme), d(c.commandbar), { Version = "1.0.0", States = l, Options = {}, Connections = {}, NotificationHolder = nil, Window = nil, Unloaded = false, MinimizeKey = Enum.KeyCode.LeftControl, MinimizeKeybind = nil, GUI = nil, SilentMode = false, OnDestroy = function() end }
				l.Library:set(B)
				local C = {}
				C.__index = C
				function C.__namecall(D, E, ...)
					if C[E] then
						return C[E](...)
					end
					error(string.format("Invalid method call: %s", E))
				end
				local D = function(D, E, F, G)
					D.Container = E
					D.Type = F
					D.ScrollFrame = G
					D.Library = B
				end
				for E, F in ipairs(o) do
					C["Add" .. F.__type] = function(G, H, I)
						D(F, G.Container, G.Type, G.ScrollFrame)
						return F:New(H, I)
					end
				end
				l.Elements:set(C)
				function B.CreateWindow(E, F)
					assert(F.Title, "[WINDOW] Missing Title")
					assert(F.Title, "[WINDOW] Missing Tag")
					if B.Window then
						error("Window already exists")
						return
					end
					if not B.GUI then
						if F.Debug then
							local G = r("Frame")({ Name = "Frame", BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1), Parent = F.Parent or game.CoreGui or game.PlayerGui, [p] = { w(), x(), q(l.Objects, function(G, H)
								return G, H
							end, k.cleanup) } })
							B.GUI = G
						else
							local G, H = protectgui or (syn and syn.protect_gui) or function() end, r("ScreenGui")({ Parent = game.CoreGui or F.Parent, IgnoreGuiInset = true, ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets, [p] = { w(), x(), q(l.Objects, function(G, H)
								return G, H
							end, k.cleanup) } })
							G(H)
							B.GUI = H
						end
					end
					local G = d(i.notification.notificationHolder)
					l.add("Objects", G, "NotificationHolder")
					B.MinimizeKey = F.MinimizeKey or Enum.KeyCode.LeftControl
					B.Theme = F.Theme or "Dark"
					l.Theme:set(B.Theme)
					local H = d(i.window.window)(F)
					B.Window = H
					A:Initialize()
					return H
				end
				function B.SetTheme(E, F)
					l.Theme:set(F)
				end
				function B.SetSilentMode(E, F)
					B.SilentMode = F
				end
				function B.GetThemes(E)
					return z.GetSupportedThemes()
				end
				local E = d(i.notification.notification)
				function B.Notify(F, G)
					E:New(G)
				end
				function B.Destroy(F)
					if B.Connections then
						for G, H in pairs(B.Connections) do
							H:Disconnect()
						end
					end
					B.Unloaded = true
					if B.Window ~= nil then
						B.Window.Root:Destroy()
						B.Window = nil
					end
					if B.GUI then
						B.GUI:Destroy()
						B.GUI = nil
					end
					B.OnDestroy()
				end
				local F = s(l.toDestroy)
				F:onChange(function()
					B:Destroy()
				end)
				function B.OnDestroy(G, H)
					B.OnDestroy = H
				end
				B.AddModule = A:SetupModuleSystem()
				pcall(function()
					getgenv().Therion = B
				end)
				return B
			end)()
		end,
		[3] = function()
			local b, c, d = a(3)
			local e
			return (function(...)
				return function(f, g)
					if typeof(f) == "table" and f.get then
						return f:get(g)
					end
					return f
				end
			end)()
		end,
		[4] = function()
			local b, c, d = a(4)
			local e
			return (function(...)
				return setmetatable({}, {
					__index = function(f, g)
						local h = game:GetService(g)
						f[g] = h
						return h
					end,
				})
			end)()
		end,
		[5] = function()
			local b, c, d = a(5)
			local e
			return (function(...)
				return function(f)
					local g, h = pcall(f)
					if not g then
						error(h)
					end
					return h
				end
			end)()
		end,
		[6] = function()
			local b, c, d = a(6)
			local e
			return (function(...)
				local f, g, h, i = {}, game:GetService("Players"), { "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso", "Head" }, function(f, g)
					if string.sub(f, 1, #g) == g then
						return true
					end
					return false
				end
				function f.getCharacter()
					local j = g.LocalPlayer
					local k = j.Character or j.CharacterAdded:Wait()
					return k
				end
				function f.others()
					local j, k = g:GetPlayers(), {}
					for l, m in j do
						if m ~= f.me() then
							table.insert(k, m)
						end
					end
					return k
				end
				function f.getByName(j)
					local k = g:GetPlayers()
					for l, m in k do
						if i(string.lower(m.Name), j) or i(string.lower(m.DisplayName), j) then
							return m
						end
					end
					return nil
				end
				function f.setPosition(j)
					local k = f.getCharacter()
					k:PivotTo(j)
				end
				function f.getRoot(j)
					for k, l in j.Character:GetChildren() do
						if table.find(h, l.Name) then
							return l
						end
					end
					return nil
				end
				function f.getHumanoid()
					return f.getCharacter():FindFirstChildWhichIsA("Humanoid")
				end
				return f
			end)()
		end,
		[7] = function()
			local b, c, d = a(7)
			local e
			return (function(...)
				local f = d(c.Parent.unwrap)
				return function(g, h)
					local i = f(g)
					table.insert(i, h)
					g:set(i)
				end
			end)()
		end,
		[8] = function()
			local b, c, d = a(8)
			local e
			return (function(...)
				local f = {}
				function f.darkenRGB(g, h)
					return Color3.fromRGB((g.R * 255) - h, (g.G * 255) - h, (g.B * 255) - h)
				end
				function f.lightenRGB(g, h)
					return Color3.fromRGB((g.R * 255) + h, (g.G * 255) + h, (g.B * 255) + h)
				end
				return f
			end)()
		end,
		[9] = function()
			local b, c, d = a(9)
			local e
			return (function(...)
				local f = d(c.Parent.Parent.packages.fusion)
				local g, h = f.Spring, f.Computed
				return function(i, j, k)
					return g(h(i), j, k)
				end
			end)()
		end,
		[11] = function()
			local b, c, d = a(11)
			local e
			return (function(...)
				local f = d(c.Parent.Parent.packages.fusion)
				local g, h, i, j = f.Computed, d(c.Parent.Parent.packages.states), d(c.Parent.Parent.utils.animate), { accent = { dark = Color3.fromRGB(0, 110, 230), twilight = Color3.fromRGB(115, 90, 235), shadow = Color3.fromRGB(60, 180, 200), dusk = Color3.fromRGB(235, 145, 48), obsidian = Color3.fromRGB(110, 60, 190), charcoal = Color3.fromRGB(70, 190, 220), slate = Color3.fromRGB(95, 170, 230), onyx = Color3.fromRGB(235, 125, 0), ash = Color3.fromRGB(120, 120, 230), granite = Color3.fromRGB(85, 180, 210), cobalt = Color3.fromRGB(35, 135, 225), aurora = Color3.fromRGB(85, 175, 210), mocha = Color3.fromRGB(170, 125, 225), midnight = Color3.fromRGB(65, 105, 225), marine = Color3.fromRGB(0, 150, 190), nightfall = Color3.fromRGB(95, 115, 215), dawnbreak = Color3.fromRGB(140, 160, 210), mist = Color3.fromRGB(130, 175, 185), starlight = Color3.fromRGB(150, 180, 255), eclipse = Color3.fromRGB(120, 90, 180), daybreak = Color3.fromRGB(255, 180, 140), storm = Color3.fromRGB(100, 140, 180), moonlight = Color3.fromRGB(180, 195, 255), oscura = Color3.fromRGB(170, 172, 80), crimson = Color3.fromRGB(216, 79, 104), azure = Color3.fromRGB(79, 143, 216), emerald = Color3.fromRGB(79, 216, 123), amethyst = Color3.fromRGB(147, 79, 216), amber = Color3.fromRGB(216, 159, 79) }, background = { dark = Color3.fromRGB(15, 15, 15), twilight = Color3.fromRGB(22, 22, 29), shadow = Color3.fromRGB(18, 20, 25), dusk = Color3.fromRGB(23, 21, 26), obsidian = Color3.fromRGB(22, 22, 29), charcoal = Color3.fromRGB(28, 28, 30), slate = Color3.fromRGB(30, 33, 36), onyx = Color3.fromRGB(24, 24, 26), ash = Color3.fromRGB(26, 26, 31), granite = Color3.fromRGB(25, 28, 32), cobalt = Color3.fromRGB(21, 25, 31), aurora = Color3.fromRGB(18, 25, 35), mocha = Color3.fromRGB(30, 30, 46), midnight = Color3.fromRGB(12, 15, 28), marine = Color3.fromRGB(10, 20, 30), nightfall = Color3.fromRGB(20, 22, 32), dawnbreak = Color3.fromRGB(25, 28, 35), mist = Color3.fromRGB(22, 26, 30), starlight = Color3.fromRGB(20, 25, 35), eclipse = Color3.fromRGB(18, 15, 25), daybreak = Color3.fromRGB(25, 22, 28), storm = Color3.fromRGB(22, 25, 30), moonlight = Color3.fromRGB(20, 22, 30), oscura = Color3.fromRGB(11, 11, 15), crimson = Color3.fromRGB(11, 11, 15), azure = Color3.fromRGB(11, 11, 15), emerald = Color3.fromRGB(11, 11, 15), amethyst = Color3.fromRGB(11, 11, 15), amber = Color3.fromRGB(11, 11, 15) }, secondary_background = { dark = Color3.fromRGB(18, 18, 18), twilight = Color3.fromRGB(26, 26, 34), shadow = Color3.fromRGB(22, 24, 30), dusk = Color3.fromRGB(27, 25, 31), obsidian = Color3.fromRGB(28, 28, 36), charcoal = Color3.fromRGB(35, 35, 37), slate = Color3.fromRGB(37, 40, 44), onyx = Color3.fromRGB(30, 30, 33), ash = Color3.fromRGB(31, 31, 37), granite = Color3.fromRGB(30, 33, 38), cobalt = Color3.fromRGB(26, 31, 38), aurora = Color3.fromRGB(22, 30, 42), mocha = Color3.fromRGB(35, 35, 51), midnight = Color3.fromRGB(16, 20, 35), marine = Color3.fromRGB(15, 25, 38), nightfall = Color3.fromRGB(24, 26, 38), dawnbreak = Color3.fromRGB(30, 33, 42), mist = Color3.fromRGB(26, 30, 35), starlight = Color3.fromRGB(25, 30, 42), eclipse = Color3.fromRGB(22, 19, 30), daybreak = Color3.fromRGB(30, 27, 33), storm = Color3.fromRGB(27, 30, 35), moonlight = Color3.fromRGB(25, 27, 35), oscura = Color3.fromRGB(18, 18, 24), crimson = Color3.fromRGB(18, 18, 24), azure = Color3.fromRGB(18, 18, 24), emerald = Color3.fromRGB(18, 18, 24), amethyst = Color3.fromRGB(18, 18, 24), amber = Color3.fromRGB(18, 18, 24) }, stroke = { dark = Color3.fromRGB(31, 31, 31), twilight = Color3.fromRGB(42, 42, 52), shadow = Color3.fromRGB(38, 40, 48), dusk = Color3.fromRGB(43, 41, 48), obsidian = Color3.fromRGB(45, 45, 55), charcoal = Color3.fromRGB(55, 55, 58), slate = Color3.fromRGB(58, 62, 66), onyx = Color3.fromRGB(50, 50, 54), ash = Color3.fromRGB(48, 48, 56), granite = Color3.fromRGB(52, 55, 60), cobalt = Color3.fromRGB(45, 50, 58), aurora = Color3.fromRGB(38, 48, 62), mocha = Color3.fromRGB(50, 50, 66), midnight = Color3.fromRGB(30, 35, 55), marine = Color3.fromRGB(25, 40, 55), nightfall = Color3.fromRGB(38, 42, 58), dawnbreak = Color3.fromRGB(45, 48, 58), mist = Color3.fromRGB(40, 45, 50), starlight = Color3.fromRGB(40, 45, 60), eclipse = Color3.fromRGB(35, 30, 45), daybreak = Color3.fromRGB(45, 40, 48), storm = Color3.fromRGB(42, 45, 50), moonlight = Color3.fromRGB(40, 42, 50), oscura = Color3.fromRGB(35, 36, 44), crimson = Color3.fromRGB(35, 36, 44), azure = Color3.fromRGB(35, 36, 44), emerald = Color3.fromRGB(35, 36, 44), amethyst = Color3.fromRGB(35, 36, 44), amber = Color3.fromRGB(35, 36, 44) }, text = { dark = Color3.fromRGB(255, 255, 255), twilight = Color3.fromRGB(240, 240, 245), shadow = Color3.fromRGB(235, 235, 240), dusk = Color3.fromRGB(250, 250, 255), obsidian = Color3.fromRGB(230, 230, 235), charcoal = Color3.fromRGB(240, 240, 245), slate = Color3.fromRGB(235, 238, 240), onyx = Color3.fromRGB(245, 245, 250), ash = Color3.fromRGB(238, 238, 243), granite = Color3.fromRGB(233, 236, 240), cobalt = Color3.fromRGB(235, 240, 245), aurora = Color3.fromRGB(235, 245, 255), mocha = Color3.fromRGB(205, 214, 244), midnight = Color3.fromRGB(220, 230, 255), marine = Color3.fromRGB(210, 235, 255), nightfall = Color3.fromRGB(235, 238, 245), dawnbreak = Color3.fromRGB(240, 242, 248), mist = Color3.fromRGB(235, 240, 242), starlight = Color3.fromRGB(235, 240, 255), eclipse = Color3.fromRGB(230, 225, 245), daybreak = Color3.fromRGB(250, 245, 240), storm = Color3.fromRGB(235, 240, 245), moonlight = Color3.fromRGB(240, 245, 255), oscura = Color3.fromRGB(230, 230, 230), crimson = Color3.fromRGB(230, 230, 230), azure = Color3.fromRGB(230, 230, 230), emerald = Color3.fromRGB(230, 230, 230), amethyst = Color3.fromRGB(230, 230, 230), amber = Color3.fromRGB(230, 230, 230) }, secondary_text = { dark = Color3.fromRGB(150, 150, 150), twilight = Color3.fromRGB(130, 135, 155), shadow = Color3.fromRGB(125, 130, 150), dusk = Color3.fromRGB(145, 150, 170), obsidian = Color3.fromRGB(180, 180, 190), charcoal = Color3.fromRGB(190, 190, 195), slate = Color3.fromRGB(185, 188, 190), onyx = Color3.fromRGB(195, 195, 200), ash = Color3.fromRGB(175, 175, 185), granite = Color3.fromRGB(170, 175, 180), cobalt = Color3.fromRGB(165, 170, 180), aurora = Color3.fromRGB(165, 180, 195), mocha = Color3.fromRGB(166, 173, 200), midnight = Color3.fromRGB(140, 160, 200), marine = Color3.fromRGB(130, 170, 200), nightfall = Color3.fromRGB(135, 145, 175), dawnbreak = Color3.fromRGB(150, 160, 180), mist = Color3.fromRGB(140, 155, 165), starlight = Color3.fromRGB(140, 150, 180), eclipse = Color3.fromRGB(130, 120, 160), daybreak = Color3.fromRGB(160, 150, 140), storm = Color3.fromRGB(130, 140, 150), moonlight = Color3.fromRGB(150, 160, 180), oscura = Color3.fromRGB(170, 170, 180), crimson = Color3.fromRGB(170, 170, 180), azure = Color3.fromRGB(170, 170, 180), emerald = Color3.fromRGB(170, 170, 180), amethyst = Color3.fromRGB(170, 170, 180), amber = Color3.fromRGB(170, 170, 180) }, tertiary_text = { dark = Color3.fromRGB(100, 100, 100), twilight = Color3.fromRGB(85, 90, 105), shadow = Color3.fromRGB(80, 85, 100), dusk = Color3.fromRGB(100, 105, 120), obsidian = Color3.fromRGB(130, 130, 140), charcoal = Color3.fromRGB(140, 140, 145), slate = Color3.fromRGB(135, 138, 140), onyx = Color3.fromRGB(145, 145, 150), ash = Color3.fromRGB(125, 125, 135), granite = Color3.fromRGB(120, 125, 130), cobalt = Color3.fromRGB(115, 120, 130), aurora = Color3.fromRGB(120, 130, 145), mocha = Color3.fromRGB(146, 158, 184), midnight = Color3.fromRGB(90, 110, 150), marine = Color3.fromRGB(80, 120, 150), nightfall = Color3.fromRGB(90, 100, 135), dawnbreak = Color3.fromRGB(105, 115, 140), mist = Color3.fromRGB(95, 110, 120), starlight = Color3.fromRGB(90, 100, 120), eclipse = Color3.fromRGB(85, 75, 105), daybreak = Color3.fromRGB(105, 95, 90), storm = Color3.fromRGB(85, 95, 105), moonlight = Color3.fromRGB(95, 105, 125), oscura = Color3.fromRGB(120, 120, 135), crimson = Color3.fromRGB(120, 120, 135), azure = Color3.fromRGB(120, 120, 135), emerald = Color3.fromRGB(120, 120, 135), amethyst = Color3.fromRGB(120, 120, 135), amber = Color3.fromRGB(120, 120, 135) }, danger = { dark = Color3.fromRGB(220, 50, 47), twilight = Color3.fromRGB(210, 55, 70), shadow = Color3.fromRGB(205, 60, 75), dusk = Color3.fromRGB(225, 65, 50), obsidian = Color3.fromRGB(215, 45, 65), charcoal = Color3.fromRGB(200, 55, 60), slate = Color3.fromRGB(210, 50, 55), onyx = Color3.fromRGB(225, 55, 45), ash = Color3.fromRGB(205, 50, 65), granite = Color3.fromRGB(200, 45, 55), cobalt = Color3.fromRGB(215, 40, 50), aurora = Color3.fromRGB(195, 55, 70), mocha = Color3.fromRGB(210, 45, 60), midnight = Color3.fromRGB(235, 45, 65), marine = Color3.fromRGB(230, 50, 70), nightfall = Color3.fromRGB(215, 55, 75), dawnbreak = Color3.fromRGB(220, 65, 80), mist = Color3.fromRGB(210, 60, 70), starlight = Color3.fromRGB(220, 50, 47), eclipse = Color3.fromRGB(210, 55, 70), daybreak = Color3.fromRGB(225, 65, 50), storm = Color3.fromRGB(215, 45, 65), moonlight = Color3.fromRGB(220, 50, 47), oscura = Color3.fromRGB(255, 92, 92), crimson = Color3.fromRGB(255, 92, 92), azure = Color3.fromRGB(255, 92, 92), emerald = Color3.fromRGB(255, 92, 92), amethyst = Color3.fromRGB(255, 92, 92), amber = Color3.fromRGB(255, 92, 92) }, warning = { dark = Color3.fromRGB(215, 153, 33), twilight = Color3.fromRGB(210, 145, 40), shadow = Color3.fromRGB(205, 150, 45), dusk = Color3.fromRGB(220, 155, 35), obsidian = Color3.fromRGB(215, 140, 45), charcoal = Color3.fromRGB(200, 145, 40), slate = Color3.fromRGB(210, 150, 35), onyx = Color3.fromRGB(225, 155, 30), ash = Color3.fromRGB(205, 145, 45), granite = Color3.fromRGB(200, 140, 35), cobalt = Color3.fromRGB(215, 135, 30), aurora = Color3.fromRGB(195, 150, 45), mocha = Color3.fromRGB(210, 140, 40), midnight = Color3.fromRGB(235, 165, 25), marine = Color3.fromRGB(240, 170, 30), nightfall = Color3.fromRGB(215, 155, 45), dawnbreak = Color3.fromRGB(225, 160, 50), mist = Color3.fromRGB(210, 155, 40), starlight = Color3.fromRGB(215, 153, 33), eclipse = Color3.fromRGB(210, 145, 40), daybreak = Color3.fromRGB(220, 155, 35), storm = Color3.fromRGB(215, 140, 45), moonlight = Color3.fromRGB(215, 153, 33), oscura = Color3.fromRGB(230, 180, 80), crimson = Color3.fromRGB(230, 180, 80), azure = Color3.fromRGB(230, 180, 80), emerald = Color3.fromRGB(230, 180, 80), amethyst = Color3.fromRGB(230, 180, 80), amber = Color3.fromRGB(230, 180, 80) }, success = { dark = Color3.fromRGB(50, 200, 70), twilight = Color3.fromRGB(65, 195, 85), shadow = Color3.fromRGB(60, 210, 90), dusk = Color3.fromRGB(55, 205, 75), obsidian = Color3.fromRGB(70, 190, 80), charcoal = Color3.fromRGB(55, 195, 85), slate = Color3.fromRGB(60, 200, 70), onyx = Color3.fromRGB(65, 210, 75), ash = Color3.fromRGB(55, 185, 90), granite = Color3.fromRGB(50, 195, 85), cobalt = Color3.fromRGB(45, 205, 80), aurora = Color3.fromRGB(55, 210, 95), mocha = Color3.fromRGB(70, 185, 85), midnight = Color3.fromRGB(40, 190, 95), marine = Color3.fromRGB(35, 195, 110), nightfall = Color3.fromRGB(60, 195, 95), dawnbreak = Color3.fromRGB(70, 200, 100), mist = Color3.fromRGB(65, 190, 95), starlight = Color3.fromRGB(50, 200, 70), eclipse = Color3.fromRGB(65, 195, 85), daybreak = Color3.fromRGB(55, 205, 75), storm = Color3.fromRGB(70, 190, 80), moonlight = Color3.fromRGB(50, 200, 70), oscura = Color3.fromRGB(100, 210, 130), crimson = Color3.fromRGB(100, 210, 130), azure = Color3.fromRGB(100, 210, 130), emerald = Color3.fromRGB(100, 210, 130), amethyst = Color3.fromRGB(100, 210, 130), amber = Color3.fromRGB(100, 210, 130) } }
				local k, l = h.Theme, {}
				for m, n in pairs(j) do
					if type(n) == "table" and type(n[next(n)]) == "table" then
						l[m] = {}
						for o, p in pairs(n) do
							l[m][o] = g(function()
								return p[k:get()]
							end)
						end
					else
						l[m] = i(function()
							return n[k:get()]
						end, 25, 1)
					end
				end
				local m = function()
					local m = {}
					for n, o in pairs(j.accent) do
						table.insert(m, n)
					end
					table.sort(m)
					return m
				end
				l.GetSupportedThemes = m
				return l
			end)()
		end,
		[13] = function()
			local b, c, d = a(13)
			local e
			return (function(...)
				local f = d(c.Parent.fusion)
				local g = f.Value
				local h = { Theme = g("amber"), Objects = g({}), Categorys = g({}), Tabs = g({}), UILayouts = g({}), Containers = g({}), CurrentTab = g(), Elements = g(), Options = g({}), Library = g(), MinimizeKeybind = g(), MinimizeKey = g(Enum.KeyCode.K), Notifications = g({}), Commands = g({}), CommandBarOpened = g(false), CommandBarPrefix = g(Enum.KeyCode.Semicolon), ToExecute = g(""), Suggestions = g({}), CommandBarText = g(""), FPSCheck = g(true), PingCheck = g(true), toDestroy = g(false), HasSelected = g(false), ChatMessages = g({}) }
				function h.add(i, j, k)
					if not h[i] then
						error("No global state named: " .. i)
					end
					local l = h[i]
					local m = table.clone(l:get())
					m[k] = j
					l:set(m)
				end
				return h
			end)()
		end,
		[14] = function()
			local b, c, d = a(14)
			local e
			return (function(...)
				local f, g = d(c.SnapdragonController), d(c.SnapdragonRef)
				local h, i, j = function(...)
					return f.new(...)
				end, function(h)
					return g.new(h)
				end
				j = { createDragController = h, SnapdragonController = f, createRef = i }
				j.default = j
				return j
			end)()
		end,
		[15] = function()
			local b, c, d = a(15)
			local e
			return (function(...)
				local f = typeof or type
				local g, h = function(g)
					return function(h)
						local i = f(h)
						if i == g then
							return true
						else
							return false, string.format("%s expected, got %s", g, i)
						end
					end
				end, {}
				function h.any(i)
					if i ~= nil then
						return true
					else
						return false, "any expected, got nil"
					end
				end
				h.boolean = g("boolean")
				h.thread = g("thread")
				h.callback = g("function")
				h.none = g("nil")
				h.string = g("string")
				h.table = g("table")
				h.userdata = g("userdata")
				function h.number(i)
					local j = f(i)
					if j == "number" then
						if i == i then
							return true
						else
							return false, "unexpected NaN value"
						end
					else
						return false, string.format("number expected, got %s", j)
					end
				end
				function h.nan(i)
					if i ~= i then
						return true
					else
						return false, "unexpected non-NaN value"
					end
				end
				h.Axes = g("Axes")
				h.BrickColor = g("BrickColor")
				h.CFrame = g("CFrame")
				h.Color3 = g("Color3")
				h.ColorSequence = g("ColorSequence")
				h.ColorSequenceKeypoint = g("ColorSequenceKeypoint")
				h.DockWidgetPluginGuiInfo = g("DockWidgetPluginGuiInfo")
				h.Faces = g("Faces")
				h.Instance = g("Instance")
				h.NumberRange = g("NumberRange")
				h.NumberSequence = g("NumberSequence")
				h.NumberSequenceKeypoint = g("NumberSequenceKeypoint")
				h.PathWaypoint = g("PathWaypoint")
				h.PhysicalProperties = g("PhysicalProperties")
				h.Random = g("Random")
				h.Ray = g("Ray")
				h.Rect = g("Rect")
				h.Region3 = g("Region3")
				h.Region3int16 = g("Region3int16")
				h.TweenInfo = g("TweenInfo")
				h.UDim = g("UDim")
				h.UDim2 = g("UDim2")
				h.Vector2 = g("Vector2")
				h.Vector3 = g("Vector3")
				h.Vector3int16 = g("Vector3int16")
				h.Enum = g("Enum")
				h.EnumItem = g("EnumItem")
				h.RBXScriptSignal = g("RBXScriptSignal")
				h.RBXScriptConnection = g("RBXScriptConnection")
				function h.literal(...)
					local i = select("#", ...)
					if i == 1 then
						local j = ...
						return function(k)
							if k ~= j then
								return false, string.format("expected %s, got %s", tostring(j), tostring(k))
							end
							return true
						end
					else
						local j = {}
						for k = 1, i do
							local l = select(k, ...)
							j[k] = h.literal(l)
						end
						return h.union(table.unpack(j, 1, i))
					end
				end
				h.exactly = h.literal
				function h.keyOf(i)
					local j, k = {}, 0
					for l in pairs(i) do
						k = k + 1
						j[k] = l
					end
					return h.literal(table.unpack(j, 1, k))
				end
				function h.valueOf(i)
					local j, k = {}, 0
					for l, m in pairs(i) do
						k = k + 1
						j[k] = m
					end
					return h.literal(table.unpack(j, 1, k))
				end
				function h.integer(i)
					local j, k = h.number(i)
					if not j then
						return false, k or ""
					end
					if i % 1 == 0 then
						return true
					else
						return false, string.format("integer expected, got %s", i)
					end
				end
				function h.numberMin(i)
					return function(j)
						local k, l = h.number(j)
						if not k then
							return false, l or ""
						end
						if j >= i then
							return true
						else
							return false, string.format("number >= %s expected, got %s", i, j)
						end
					end
				end
				function h.numberMax(i)
					return function(j)
						local k, l = h.number(j)
						if not k then
							return false, l
						end
						if j <= i then
							return true
						else
							return false, string.format("number <= %s expected, got %s", i, j)
						end
					end
				end
				function h.numberMinExclusive(i)
					return function(j)
						local k, l = h.number(j)
						if not k then
							return false, l or ""
						end
						if i < j then
							return true
						else
							return false, string.format("number > %s expected, got %s", i, j)
						end
					end
				end
				function h.numberMaxExclusive(i)
					return function(j)
						local k, l = h.number(j)
						if not k then
							return false, l or ""
						end
						if j < i then
							return true
						else
							return false, string.format("number < %s expected, got %s", i, j)
						end
					end
				end
				h.numberPositive = h.numberMinExclusive(0)
				h.numberNegative = h.numberMaxExclusive(0)
				function h.numberConstrained(i, j)
					assert(h.number(i) and h.number(j))
					local k, l = h.numberMin(i), h.numberMax(j)
					return function(m)
						local n, o = k(m)
						if not n then
							return false, o or ""
						end
						local p, q = l(m)
						if not p then
							return false, q or ""
						end
						return true
					end
				end
				function h.numberConstrainedExclusive(i, j)
					assert(h.number(i) and h.number(j))
					local k, l = h.numberMinExclusive(i), h.numberMaxExclusive(j)
					return function(m)
						local n, o = k(m)
						if not n then
							return false, o or ""
						end
						local p, q = l(m)
						if not p then
							return false, q or ""
						end
						return true
					end
				end
				function h.match(i)
					assert(h.string(i))
					return function(j)
						local k, l = h.string(j)
						if not k then
							return false, l
						end
						if string.match(j, i) == nil then
							return false, string.format("%q failed to match pattern %q", j, i)
						end
						return true
					end
				end
				function h.optional(i)
					assert(h.callback(i))
					return function(j)
						if j == nil then
							return true
						end
						local k, l = i(j)
						if k then
							return true
						else
							return false, string.format("(optional) %s", l or "")
						end
					end
				end
				function h.tuple(...)
					local i = { ... }
					return function(...)
						local j = { ... }
						for k, l in ipairs(i) do
							local m, n = l(j[k])
							if m == false then
								return false, string.format("Bad tuple index #%s:\n\t%s", k, n or "")
							end
						end
						return true
					end
				end
				function h.keys(i)
					assert(h.callback(i))
					return function(j)
						local k, l = h.table(j)
						if k == false then
							return false, l or ""
						end
						for m in pairs(j) do
							local n, o = i(m)
							if n == false then
								return false, string.format("bad key %s:\n\t%s", tostring(m), o or "")
							end
						end
						return true
					end
				end
				function h.values(i)
					assert(h.callback(i))
					return function(j)
						local k, l = h.table(j)
						if k == false then
							return false, l or ""
						end
						for m, n in pairs(j) do
							local o, p = i(n)
							if o == false then
								return false, string.format("bad value for key %s:\n\t%s", tostring(m), p or "")
							end
						end
						return true
					end
				end
				function h.map(i, j)
					assert(h.callback(i), h.callback(j))
					local k, l = h.keys(i), h.values(j)
					return function(m)
						local n, o = k(m)
						if not n then
							return false, o or ""
						end
						local p, q = l(m)
						if not p then
							return false, q or ""
						end
						return true
					end
				end
				function h.set(i)
					return h.map(i, h.literal(true))
				end
				do
					local i = h.keys(h.integer)
					function h.array(j)
						assert(h.callback(j))
						local k = h.values(j)
						return function(l)
							local m, n = i(l)
							if m == false then
								return false, string.format("[array] %s", n or "")
							end
							local o = 0
							for p in ipairs(l) do
								o = o + 1
							end
							for p in pairs(l) do
								if p < 1 or p > o then
									return false, string.format("[array] key %s must be sequential", tostring(p))
								end
							end
							local p, q = k(l)
							if not p then
								return false, string.format("[array] %s", q or "")
							end
							return true
						end
					end
					function h.strictArray(...)
						local j = { ... }
						assert(h.array(h.callback)(j))
						return function(k)
							local l, m = i(k)
							if l == false then
								return false, string.format("[strictArray] %s", m or "")
							end
							if #j < #k then
								return false, string.format("[strictArray] Array size exceeds limit of %d", #j)
							end
							for n, o in pairs(j) do
								local p, q = o(k[n])
								if not p then
									return false, string.format("[strictArray] Array index #%d - %s", n, q)
								end
							end
							return true
						end
					end
				end
				do
					local i = h.array(h.callback)
					function h.union(...)
						local j = { ... }
						assert(i(j))
						return function(k)
							for l, m in ipairs(j) do
								if m(k) then
									return true
								end
							end
							return false, "bad type for union"
						end
					end
					h.some = h.union
					function h.intersection(...)
						local j = { ... }
						assert(i(j))
						return function(k)
							for l, m in ipairs(j) do
								local n, o = m(k)
								if not n then
									return false, o or ""
								end
							end
							return true
						end
					end
					h.every = h.intersection
				end
				do
					local i = h.map(h.any, h.callback)
					function h.interface(j)
						assert(i(j))
						return function(k)
							local l, m = h.table(k)
							if l == false then
								return false, m or ""
							end
							for n, o in pairs(j) do
								local p, q = o(k[n])
								if p == false then
									return false, string.format("[interface] bad value for %s:\n\t%s", tostring(n), q or "")
								end
							end
							return true
						end
					end
					function h.strictInterface(j)
						assert(i(j))
						return function(k)
							local l, m = h.table(k)
							if l == false then
								return false, m or ""
							end
							for n, o in pairs(j) do
								local p, q = o(k[n])
								if p == false then
									return false, string.format("[interface] bad value for %s:\n\t%s", tostring(n), q or "")
								end
							end
							for n in pairs(k) do
								if not j[n] then
									return false, string.format("[interface] unexpected field %q", tostring(n))
								end
							end
							return true
						end
					end
				end
				function h.instanceOf(i, j)
					assert(h.string(i))
					local k
					if j ~= nil then
						k = h.children(j)
					end
					return function(l)
						local m, n = h.Instance(l)
						if not m then
							return false, n or ""
						end
						if l.ClassName ~= i then
							return false, string.format("%s expected, got %s", i, l.ClassName)
						end
						if k then
							local o, p = k(l)
							if not o then
								return false, p
							end
						end
						return true
					end
				end
				h.instance = h.instanceOf
				function h.instanceIsA(i, j)
					assert(h.string(i))
					local k
					if j ~= nil then
						k = h.children(j)
					end
					return function(l)
						local m, n = h.Instance(l)
						if not m then
							return false, n or ""
						end
						if not l:IsA(i) then
							return false, string.format("%s expected, got %s", i, l.ClassName)
						end
						if k then
							local o, p = k(l)
							if not o then
								return false, p
							end
						end
						return true
					end
				end
				function h.enum(i)
					assert(h.Enum(i))
					return function(j)
						local k, l = h.EnumItem(j)
						if not k then
							return false, l
						end
						if j.EnumType == i then
							return true
						else
							return false, string.format("enum of %s expected, got enum of %s", tostring(i), tostring(j.EnumType))
						end
					end
				end
				do
					local i = h.tuple(h.callback, h.callback)
					function h.wrap(j, k)
						assert(i(j, k))
						return function(...)
							assert(k(...))
							return j(...)
						end
					end
				end
				function h.strict(i)
					return function(...)
						assert(i(...))
					end
				end
				do
					local i = h.map(h.string, h.callback)
					function h.children(j)
						assert(i(j))
						return function(k)
							local l, m = h.Instance(k)
							if not l then
								return false, m or ""
							end
							local n = {}
							for o, p in ipairs(k:GetChildren()) do
								local q = p.Name
								if j[q] then
									if n[q] then
										return false, string.format("Cannot process multiple children with the same name %q", q)
									end
									n[q] = p
								end
							end
							for o, p in pairs(j) do
								local q, r = p(n[o])
								if not q then
									return false, string.format("[%s.%s] %s", k:GetFullName(), o, r or "")
								end
							end
							return true
						end
					end
				end
				return h
			end)()
		end,
		[16] = function()
			local b, c, d = a(16)
			local e
			return (function(...)
				local f = function(f, ...)
					local g = { ... }
					for h, i in pairs(g) do
						for j, k in pairs(i) do
							f[j] = k
						end
					end
					return f
				end
				return f
			end)()
		end,
		[17] = function()
			local b, c, d = a(17)
			local e
			return (function(...)
				local f = {}
				function f.named(g)
					assert(type(g) == "string", "Symbols must be created using a string name!")
					local h, i = newproxy(true), ("Symbol(%s)"):format(g)
					getmetatable(h).__tostring = function()
						return i
					end
					return h
				end
				return f
			end)()
		end,
		[18] = function()
			local b, c, d = a(18)
			local e
			return (function(...)
				local f, g = setmetatable({}, { __mode = "k" }), {}
				g.__index = g
				function g.new(h)
					local i = setmetatable({ current = h }, g)
					f[i] = i
					return i
				end
				function g.Update(h, i)
					h.current = i
				end
				function g.Get(h)
					return h.current
				end
				function g.is(h)
					return f[h] ~= nil
				end
				return g
			end)()
		end,
		[19] = function()
			local b, c, d = a(19)
			local e
			return (function(...)
				local f, g, h, i, j, k = game:GetService("UserInputService"), d(c.Parent.Maid), d(c.Parent.Signal), d(c.Parent.SnapdragonRef), d(c.Parent.objectAssign), d(c.Parent.t)
				local l, m, n, o = k.interface({ Vertical = k.optional(k.Vector2), Horizontal = k.optional(k.Vector2) }), k.literal("XY", "X", "Y"), k.literal("LayerCollector", "Parent"), k.literal("Offset", "Scale")
				local p, q = k.interface({ DragGui = k.union(k.instanceIsA("GuiObject"), i.is), DragThreshold = k.number, DragGridSize = k.number, SnapMargin = l, SnapMarginThreshold = l, SnapAxis = m, DragAxis = m, DragRelativeTo = n, SnapEnabled = k.boolean, Debugging = k.boolean, DragPositionMode = o }), {}
				q.__index = q
				local r = setmetatable({}, { __mode = "k" })
				function q.new(s, t)
					t = j({ DragGui = s, DragThreshold = 0, DragGridSize = 0, SnapMargin = {}, SnapMarginThreshold = {}, SnapEnabled = true, DragEndedResetsPosition = false, SnapAxis = "XY", DragAxis = "XY", Debugging = false, DragRelativeTo = "LayerCollector", DragPositionMode = "Scale" }, t)
					assert(p(t))
					local u, v = setmetatable({}, q), t.DragGui
					u.dragGui = v
					u.gui = s
					u.debug = t.Debugging
					u.originPosition = v.Position
					u.canDrag = t.CanDrag
					u.dragEndedResetsPosition = t.DragEndedResetsPosition
					u.snapEnabled = t.SnapEnabled
					u.snapAxis = t.SnapAxis
					u.dragAxis = t.DragAxis
					u.dragThreshold = t.DragThreshold
					u.dragRelativeTo = t.DragRelativeTo
					u.dragGridSize = t.DragGridSize
					u.dragPositionMode = t.DragPositionMode
					u._useAbsoluteCoordinates = false
					local w, x, y = h.new(), h.new(), h.new()
					u.DragEnded = w
					u.DragBegan = y
					u.DragChanged = x
					u.maid = g.new()
					u:SetSnapEnabled(t.SnapEnabled)
					u:SetSnapMargin(t.SnapMargin)
					u:SetSnapThreshold(t.SnapMarginThreshold)
					return u
				end
				function q.SetSnapEnabled(s, t)
					assert(k.boolean(t))
					s.snapEnabled = t
				end
				function q.SetSnapMargin(s, t)
					assert(l(t))
					local u, v = t.Vertical or Vector2.new(), t.Horizontal or Vector2.new()
					s.snapVerticalMargin = u
					s.snapHorizontalMargin = v
				end
				function q.SetSnapThreshold(s, t)
					assert(l(t))
					local u, v = t.Vertical or Vector2.new(), t.Horizontal or Vector2.new()
					s.snapThresholdVertical = u
					s.snapThresholdHorizontal = v
				end
				function q.GetDragGui(s)
					local t = s.dragGui
					if i.is(t) then
						return t:Get(), t
					else
						return t, t
					end
				end
				function q.GetGui(s)
					local t = s.gui
					if i.is(t) then
						return t:Get()
					else
						return t
					end
				end
				function q.ResetPosition(s)
					s.dragGui.Position = s.originPosition
				end
				function q.__bindControllerBehaviour(s)
					local t, u, v, w, x, y, z, A, B, C, D, E, F, G, H, I, J, K, L, M = s.maid, s.debug, s:GetGui(), s:GetDragGui(), s.snapEnabled, s.DragEnded, s.DragBegan, s.DragChanged, s.snapAxis, s.dragAxis, s.dragRelativeTo, s.dragGridSize, s.dragPositionMode, s._useAbsoluteCoordinates
					local aa = function(N)
						local O, P, Q, R, S, T = s.snapHorizontalMargin, s.snapVerticalMargin, s.snapThresholdVertical, s.snapThresholdHorizontal, workspace.CurrentCamera.ViewportSize, N.Position - K
						if C == "X" then
							T = Vector3.new(T.X, 0, 0)
						elseif C == "Y" then
							T = Vector3.new(0, T.Y, 0)
						end
						v = w or v
						H = { X = "Float", Y = "Float" }
						local U, V = v:FindFirstAncestorOfClass("ScreenGui") or v:FindFirstAncestorOfClass("PluginGui"), Vector2.new()
						if U and D == "LayerCollector" then
							S = U.AbsoluteSize
						elseif D == "Parent" then
							assert(v.Parent:IsA("GuiObject"), [[DragRelativeTo is set to Parent, but the parent is not a GuiObject!]])
							S = v.Parent.AbsoluteSize
						end
						if x then
							local W, X, Y, Z, _, aa = S.X * L.X.Scale, S.Y * L.Y.Scale, L.X.Offset + T.X, L.Y.Offset + T.Y, v.AbsoluteSize + Vector2.new(O.Y, P.Y + V.Y), Vector2.new(v.AbsoluteSize.X * v.AnchorPoint.X, v.AbsoluteSize.Y * v.AnchorPoint.Y)
							if B == "XY" or B == "X" then
								local ab, ac = O.X + aa.X, S.X - _.X + aa.X
								if (Y + W) > ac - R.Y then
									Y = ac - W
									H.X = "Max"
								elseif (Y + W) < ab + R.X then
									Y = -W + ab
									H.X = "Min"
								end
							end
							if B == "XY" or B == "Y" then
								local ab, ac = P.X + aa.Y, S.Y - _.Y + aa.Y
								if (Z + X) > ac - Q.Y then
									Z = ac - X
									H.Y = "Max"
								elseif (Z + X) < ab + Q.X then
									Z = -X + ab
									H.Y = "Min"
								end
							end
							if E > 0 then
								Y = math.floor(Y / E) * E
								Z = math.floor(Z / E) * E
							end
							if F == "Offset" then
								local ab = UDim2.new(L.X.Scale, Y, L.Y.Scale, Z)
								v.Position = ab
								A:Fire({ GuiPosition = ab })
							else
								local ab = UDim2.new(L.X.Scale + (Y / S.X), 0, L.Y.Scale + (Z / S.Y), 0)
								v.Position = ab
								A:Fire({ SnapAxis = B, GuiPosition = ab, DragPositionMode = F })
							end
						else
							if E > 0 then
								T = Vector2.new(math.floor(T.X / E) * E, math.floor(T.Y / E) * E)
							end
							local aa = UDim2.new(L.X.Scale, L.X.Offset + T.X, L.Y.Scale, L.Y.Offset + T.Y)
							v.Position = aa
							A:Fire({ GuiPosition = aa })
						end
					end
					t.guiInputBegan = v.InputBegan:Connect(function(ab)
						local ac = true
						if type(s.canDrag) == "function" then
							ac = s.canDrag()
						end
						if (ab.UserInputType == Enum.UserInputType.MouseButton1 or ab.UserInputType == Enum.UserInputType.Touch) and ac then
							I = true
							K = ab.Position
							local N = (w or v)
							L = G and UDim2.new(0, N.AbsolutePosition.X, 0, N.AbsolutePosition.Y) or N.Position
							M = N.Position
							z:Fire({ AbsolutePosition = (w or v).AbsolutePosition, InputPosition = K, GuiPosition = L })
							if u then
								print("[snapdragon]", "Drag began", ab.Position)
							end
						end
					end)
					t.guiInputEnded = v.InputEnded:Connect(function(ab)
						if I and ab.UserInputState == Enum.UserInputState.End and (ab.UserInputType == Enum.UserInputType.MouseButton1 or ab.UserInputType == Enum.UserInputType.Touch) then
							I = false
							local ac = (w or v)
							local N = ac.Position
							y:Fire({ InputPosition = ab.Position, GuiPosition = N, ReachedExtents = H, DraggedGui = w or v })
							if u then
								print("[snapdragon]", "Drag ended", ab.Position)
							end
							local O = s.dragEndedResetsPosition
							if O then
								ac.Position = M
							end
						end
					end)
					t.guiInputChanged = v.InputChanged:Connect(function(ab)
						if ab.UserInputType == Enum.UserInputType.MouseMovement or ab.UserInputType == Enum.UserInputType.Touch then
							J = ab
						end
					end)
					t.uisInputChanged = f.InputChanged:Connect(function(ab)
						if ab == J and I then
							aa(ab)
						end
					end)
				end
				function q.Connect(aa)
					if aa.locked then
						error("[SnapdragonController] Cannot connect locked controller!", 2)
					end
					local ab, ac = aa:GetDragGui()
					if not r[ac] or r[ac] == aa then
						r[ac] = aa
						aa:__bindControllerBehaviour()
					else
						error([[[SnapdragonController] This object is already bound to a controller]])
					end
					return aa
				end
				function q.Disconnect(aa)
					if aa.locked then
						error("[SnapdragonController] Cannot disconnect locked controller!", 2)
					end
					local ab, ac = aa:GetDragGui()
					local s = r[ac]
					if s then
						aa.maid:DoCleaning()
						r[ac] = nil
					end
				end
				function q.Destroy(aa)
					aa:Disconnect()
					aa.DragEnded:Destroy()
					aa.DragBegan:Destroy()
					aa.DragEnded = nil
					aa.DragBegan = nil
					aa.locked = true
				end
				return q
			end)()
		end,
		[20] = function()
			local aa, ab, ac = a(20)
			local b
			return (function(...)
				local c = {}
				c.__index = c
				function c.new()
					return setmetatable({ Bindable = Instance.new("BindableEvent") }, c)
				end
				function c.Connect(d, e)
					return d.Bindable.Event:Connect(function(f)
						e(f())
					end)
				end
				function c.Fire(d, ...)
					local e, f = { ... }, select("#", ...)
					d.Bindable:Fire(function()
						return unpack(e, 1, f)
					end)
				end
				function c.Wait(d)
					return d.Bindable.Event:Wait()()
				end
				function c.Destroy(d)
					d.Bindable:Destroy()
				end
				return c
			end)()
		end,
		[21] = function()
			local aa, ab, ac = a(21)
			local b
			return (function(...)
				local c = {}
				c.ClassName = "Maid"
				function c.new()
					local d = {}
					d._tasks = {}
					return setmetatable(d, c)
				end
				function c.__index(d, e)
					if c[e] then
						return c[e]
					else
						return d._tasks[e]
					end
				end
				function c.__newindex(d, e, f)
					if c[e] ~= nil then
						error(("'%s' is reserved"):format(tostring(e)), 2)
					end
					local g = d._tasks
					local h = g[e]
					g[e] = f
					if h then
						if type(h) == "function" then
							h()
						elseif typeof(h) == "RBXScriptConnection" then
							h:Disconnect()
						elseif h.Destroy then
							h:Destroy()
						end
					end
				end
				function c.GiveTask(d, e)
					assert(e, "Task cannot be false or nil")
					local f = #d._tasks + 1
					d[f] = e
					if type(e) == "table" and not e.Destroy then
						warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback())
					end
					return f
				end
				function c.GivePromise(d, e)
					if not e:IsPending() then
						return e
					end
					local f = e.resolved(e)
					local g = d:GiveTask(f)
					f:Finally(function()
						d[g] = nil
					end)
					return f
				end
				function c.DoCleaning(d)
					local e = d._tasks
					for f, g in pairs(e) do
						if typeof(g) == "RBXScriptConnection" then
							e[f] = nil
							g:Disconnect()
						end
					end
					local f, g = next(e)
					while g ~= nil do
						e[f] = nil
						if type(g) == "function" then
							g()
						elseif typeof(g) == "RBXScriptConnection" then
							g:Disconnect()
						elseif g.Destroy then
							g:Destroy()
						end
						f, g = next(e)
					end
				end
				c.Destroy = c.DoCleaning
				return c
			end)()
		end,
		[22] = function()
			local aa, ab, ac = a(22)
			local b
			return (function(...)
				local c = {}
				c.ClassName = "Maid"
				function c.new()
					return setmetatable({ _tasks = {} }, c)
				end
				function c.isMaid(d)
					return type(d) == "table" and d.ClassName == "Maid"
				end
				function c.__index(d, e)
					if c[e] then
						return c[e]
					else
						return d._tasks[e]
					end
				end
				function c.__newindex(d, e, f)
					if c[e] ~= nil then
						error(("'%s' is reserved"):format(tostring(e)), 2)
					end
					local g = d._tasks
					local h = g[e]
					if h == f then
						return
					end
					g[e] = f
					if h then
						if type(h) == "function" then
							h()
						elseif typeof(h) == "RBXScriptConnection" then
							h:Disconnect()
						elseif h.Destroy then
							h:Destroy()
						end
					end
				end
				function c.GiveTask(d, e)
					if not e then
						error("Task cannot be false or nil", 2)
					end
					local f = #d._tasks + 1
					d[f] = e
					return f
				end
				function c.GivePromise(d, e)
					if not e:IsPending() then
						return e
					end
					local f = e.resolved(e)
					local g = d:GiveTask(f)
					f:Finally(function()
						d[g] = nil
					end)
					return f
				end
				function c.DoCleaning(d)
					local e = d._tasks
					for f, g in pairs(e) do
						if typeof(g) == "RBXScriptConnection" then
							e[f] = nil
							g:Disconnect()
						end
					end
					local f, g = next(e)
					while g ~= nil do
						e[f] = nil
						if type(g) == "function" then
							g()
						elseif typeof(g) == "RBXScriptConnection" then
							g:Disconnect()
						elseif g.Destroy then
							g:Destroy()
						end
						f, g = next(e)
					end
				end
				c.Destroy = c.DoCleaning
				return c
			end)()
		end,
		[23] = function()
			local aa, ab, ac = a(23)
			local b
			return (function(...)
				local c, d, e = game:GetService("RunService"), (game:GetService("HttpService"))
				if c:IsServer() then
					local f, g = pcall(function()
						return d:GetAsync([[https://raw.githubusercontent.com/zuvbruv/test/refs/heads/main/Fusion.lua]])
					end)
					if f then
						e = loadstring(g)()
					else
						warn("Failed to fetch Fusion:", g)
						e = {}
					end
				else
					e = loadstring(game:HttpGet([[https://raw.githubusercontent.com/zuvbruv/test/refs/heads/main/Fusion.lua]]))()
				end
				return e
			end)()
		end,
		[24] = function()
			local aa, ab, ac = a(24)
			local b
			return (function(...)
				local c = {}
				local function d(e)
					local f, g = (type(e))
					if f == "table" then
						g = {}
						for h, i in next, e, nil do
							g[d(h)] = d(i)
						end
						setmetatable(g, d(getmetatable(e)))
					else
						g = e
					end
					return g
				end
				function c.raw(e, f)
					if #e > #f then
						e, f = f, e
					end
					local g, h, i, j = #e, #f, {}, {}
					for k = 1, h + 1 do
						i[k] = k - 1
						j[k] = 0
					end
					for k = 1, g do
						j[1] = k
						for l = 1, h do
							local m
							if e:sub(k, k) == f:sub(l, l) then
								m = 0
							else
								m = 1
							end
							local n, o, p = i[l + 1] + 1, j[l] + 1, i[l] + m
							j[l + 1] = math.min(n, o, p)
							if k > 1 and l > 1 and e:sub(k, k) == f:sub(l - 1, l - 1) and e:sub(k - 1, k - 1) == f:sub(l, l) then
								local q = i[l - 1] + m
								j[l + 1] = math.min(j[l + 1], q)
							end
						end
						for l = 1, h + 1 do
							i[l] = j[l]
						end
					end
					return j[h + 1]
				end
				function c.weighted(e, f)
					local g, h = #e, #f
					if g == 0 and h == 0 then
						return 0
					end
					return c.raw(e, f) / (g + h)
				end
				return c
			end)()
		end,
		[25] = function()
			local aa, ab, ac = a(25)
			local b
			return (function(...)
				local c = {}
				for d, e in ab.Parent:GetChildren() do
					if e.Name ~= "cmdr" then
						c[e.Name] = ac(e)
					end
				end
				local d = {}
				for e, f in ab.Parent.Parent.utils:GetChildren() do
					d[f.Name] = ac(f)
				end
				local e, f = {
					string = function(e)
						return e
					end,
					number = function(e)
						return tonumber(e) or 0
					end,
					integer = function(e)
						return math.floor(tonumber(e) or 0)
					end,
					bool = function(e)
						e = string.lower(e)
						return (e == "on" or e == "true" or e == "yes" or e == "1") or false
					end,
					url = function(e)
						return string.match(e, "^%a+://%S+")
					end,
					player = function(e)
						return e:lower()
					end,
					hex = function(e)
						return string.match(e, "^[A-Fa-f0-9]+$")
					end,
				}, {}
				do
					function f.charAt(g, h)
						return string.sub(g, h, h)
					end
					function f.startsWith(g, h)
						return string.sub(g, 1, #h) == h
					end
					function f.trim(g)
						return string.match(g, "^%s*(.-)%s*$")
					end
				end
				local g = {}
				do
					g.__index = g
					function g.new(h)
						local i = setmetatable({}, g)
						i.prefix = h.prefix or ""
						i.commands = {}
						return i
					end
					function g.newCommand(h, i)
						local j = { name = i.name, aliases = i.aliases, description = i.description, arguments = i.arguments, callback = i.callback }
						table.insert(h.commands, j)
					end
					function g.executeCommand(h, i)
						if f.startsWith(i, h.prefix) then
							i = i:sub(#h.prefix + 1)
						end
						local j = {}
						for k in string.gmatch(f.trim(i) or "", "%S+") do
							table.insert(j, k)
						end
						local k, l = j[1], {}
						for m = 2, #j do
							table.insert(l, j[m])
						end
						local m, n
						for o, p in h.commands do
							if p.name == k or table.find(p.aliases, k) then
								m = p.callback
								n = p
							end
						end
						if m == nil then
							ac(ab.Parent.states).Library:get():Notify({ Title = "Error", Description = "Could not find command <b>" .. k .. "</b>", Duration = 5, Type = "error" })
							return
						end
						local o = {}
						for p, q in n.arguments do
							local r = l[p]
							if r then
								local s = e[q.type](r)
								if s == nil then
									ac(ab.Parent.states).Library:get():Notify({ Title = "Error", Description = "There was an error validating argument: <b>" .. q.name .. "</b>", Duration = 5, Type = "error" })
								end
								o[q.name] = s
							else
								ac(ab.Parent.states).Library:get():Notify({ Title = "Error", Description = "Missing argument <b>" .. q.name .. "</b>", Duration = 5, Type = "error" })
							end
						end
						local p, q = pcall(m, c, d, o)
						if not p then
							error(q)
						end
					end
				end
				return table.freeze(g)
			end)()
		end,
		[26] = function()
			local aa, ab, ac = a(26)
			local b
			return (function(...)
				local c = { Sounds = { Key = "rbxassetid://8566613627", Enter = "rbxassetid://8566613567", Backspace = "rbxassetid://8566613459", NoType = "rbxassetid://8567221828" } }
				function c.Play(d, e)
					assert(d.Sounds[e], "Invalid sound name")
					local f = Instance.new("Sound")
					f.SoundId = d.Sounds[e]
					f.Parent = game.CoreGui
					f:Play()
					f.Ended:Connect(function()
						f:Destroy()
					end)
				end
				return c
			end)()
		end,
		[27] = function()
			local aa, ab, ac = a(27)
			local b
			return (function(...)
				return {}
			end)()
		end,
		[30] = function()
			local aa, ab, ac = a(30)
			local b
			return (function(...)
				local c = ab.Parent.Parent.Parent.utils
				local d, e, f = ac(c.animate), ac(c.unwrap), ab.Parent.Parent.Parent.packages
				local g, h, i, j = ac(f.fusion), ac(f.snapdragon), ac(f.states), ac(ab.Parent.Parent.Parent.storage.theme)
				local k, l, m, n, o, p, q, r, s, t = g.Children, g.Computed, g.ForPairs, g.OnEvent, g.Value, g.Ref, g.New, game:GetService("Workspace").CurrentCamera, game:GetService("UserInputService"), function(k)
					local l, m = (string.lower(k or ""))
					if l == "success" then
						m = j.success
					elseif l == "info" then
						m = j.accent
					elseif l == "warning" then
						m = j.warning
					elseif l == "danger" then
						m = j.danger
					end
					return m:get()
				end
				local u = function(u, v)
					return q("Frame")({ Name = u, LayoutOrder = 0, AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(0, 1), [k] = { q("Frame")({ Name = "IconStatus", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 5, 1, 0), [k] = { [k] = { q("UIPadding")({ Name = "UIPadding", PaddingTop = UDim.new(0, 2) }) }, q("Frame")({ Name = "IndicatorDot", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = l(function()
						return t(v.stateType:get())
					end), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0.5, -1), Size = UDim2.fromOffset(6, 6), [k] = { q("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(1, 0) }) } }) } }), q("UIListLayout")({ Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 10) }), q("TextLabel")({ Name = "StatusText", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = v.text, TextColor3 = j.secondary_text, TextSize = 12, AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(0, 1), [k] = { q("UIPadding")({ Name = "UIPadding", PaddingTop = UDim.new(0, 1) }) } }), q("Frame")({ Name = "Seperator", BackgroundColor3 = j.stroke, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, -1, 1, 0) }) } })
				end
				return function(v)
					local w, x, y, z, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P = e(i.Library), { Categorys = 1 }, o(false), o(false), o(UDim2.fromOffset(0, 0)), o(), o(), o(), o(), o({ X = v.Size.X.Offset, Y = v.Size.Y.Offset }), o(false), o(false), o(false), o(false), o(1), o(true), o(Vector2.new(v.Size.X.Offset, v.Size.Y.Offset)), o(false), o({}), false
					function x.Minimize(Q)
						y:set(not y:get())
						if not P then
							P = true
							local R = w.MinimizeKey and w.MinimizeKey.Name or "N/A"
							w:Notify({ Title = "Interface Minimized", Description = "Press " .. tostring(R) .. " to toggle the interface again.", Duration = 6, Type = "info" })
						end
					end
					local Q, R = function()
						local Q, R, S, T, U, V = r.ViewportSize.X, r.ViewportSize.Y, v.Size.X.Offset, v.Size.Y.Offset, 400, 300
						local W, X = math.min(S, Q * 0.85), math.min(T, R * 0.85)
						local Y, Z = math.max(U, W), math.max(V, X)
						F:set({ X = Y, Y = Z })
						return UDim2.fromOffset(Q / 2 - Y / 2, R / 2 - Z / 2)
					end, ac(ab.Parent.dialog)
					function x.Dialog(S, T)
						local U = R:Create(T)
						return U
					end
					x.Root = q("CanvasGroup")({ Name = "GUI", BackgroundColor3 = j.background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = Q(), Size = l(function()
						return UDim2.fromOffset(F:get().X, F:get().Y)
					end), Visible = y, Active = false, Interactable = true, GroupTransparency = d(function()
						if not y:get() then
							return 1
						end
						return N:get() and 0.1 or 0
					end, 30, 1.2), [k] = { q("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), q("UIStroke")({ Name = "UIStroke", Color = j.stroke, Thickness = 2.5, Transparency = d(function()
						if not y:get() then
							return 1
						end
						return N:get() and 0.7 or 0.6
					end, 30, 1.2) }), q("ImageLabel")({ Name = "Shadow", Image = "rbxassetid://9313765853", ImageColor3 = j.background, ImageTransparency = 0.45, ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(45, 45, 45, 45), SliceScale = 1.2, AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(27, 42, 53), ClipsDescendants = true, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, 75, 1, 75), ZIndex = -50 }), q("Frame")({
						[p] = C,
						Name = "ResizeFrame",
						AnchorPoint = Vector2.new(1, 1),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Position = UDim2.fromScale(1, 1),
						Size = UDim2.fromOffset(16, 16),
						[n("InputBegan")] = function(S)
							if S.UserInputType == Enum.UserInputType.MouseButton1 or S.UserInputType == Enum.UserInputType.Touch then
								D:set(true)
								E:set(S.Position)
								M:set(Vector2.new(F:get().X, F:get().Y))
							end
						end,
					}), q("Frame")({ [p] = B, Name = "Topbar", BackgroundColor3 = j.secondary_background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 45), ZIndex = 1, [k] = { q("Frame")({ Name = "Seperator", BackgroundColor3 = j.stroke, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 1, -1), Size = UDim2.new(1, 0, 0, 1) }), q("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), q("Frame")({ Name = "TextHolder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(15, 0), Size = UDim2.new(1, -15, 1, 0), [k] = { q("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal), Text = v.Title, TextColor3 = j.text, TextSize = 17, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(15, 0), Size = UDim2.new(0, 5, 1, 0) }), q("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 7), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), q("Frame")({ Name = "TagHolder", AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = j.accent, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromOffset(0, 15), [k] = { q("TextLabel")({ Name = "TagTitle", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = v.Tag, TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 12, AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 1) }), q("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5) }), q("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }) } }) } }), q("Frame")({ Name = "ButtonHolder", AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1, -15, 0, 0), Size = UDim2.new(1, -15, 1, 0), [k] = { q("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 10), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), q("ImageButton")({
						Name = "Minimize",
						Image = "rbxassetid://95268421208163",
						ImageColor3 = d(function()
							if H:get() then
								return j.secondary_text:get()
							end
							if G:get() then
								return j.text:get()
							end
							return j.tertiary_text:get()
						end, 25, 1),
						Active = false,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Position = UDim2.fromScale(0.5, 0.5),
						Selectable = false,
						Size = UDim2.fromOffset(22, 22),
						[n("InputEnded")] = function(S)
							if S.UserInputType == Enum.UserInputType.MouseButton1 or S.UserInputType == Enum.UserInputType.Touch then
								H:set(false)
								x:Minimize()
							end
						end,
						[n("InputBegan")] = function(S)
							if S.UserInputType == Enum.UserInputType.MouseButton1 or S.UserInputType == Enum.UserInputType.Touch then
								H:set(true)
							end
						end,
						[n("MouseEnter")] = function()
							G:set(true)
						end,
						[n("MouseLeave")] = function()
							G:set(false)
							H:set(false)
						end,
					}), q("ImageButton")({
						Name = "Close",
						Image = "rbxassetid://118425905671666",
						ImageColor3 = d(function()
							if J:get() then
								return j.secondary_text:get()
							end
							if I:get() then
								return j.text:get()
							end
							return j.tertiary_text:get()
						end, 25, 1),
						Active = false,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Position = UDim2.fromScale(0.5, 0.5),
						Selectable = false,
						Size = UDim2.fromOffset(22, 22),
						[n("InputEnded")] = function(S)
							if S.UserInputType == Enum.UserInputType.MouseButton1 or S.UserInputType == Enum.UserInputType.Touch then
								J:set(false)
								local T = x:Dialog({ Title = "EXIT SCRIPT", Description = "Are you sure you want to exit the script?" })
								T:AddButton({ Title = "Go Back", Style = "default" })
								T:AddButton({
									Title = "Exit Script",
									Style = "primary",
									Callback = function()
										i.toDestroy:set(true)
									end,
								})
							end
						end,
						[n("InputBegan")] = function(S)
							if S.UserInputType == Enum.UserInputType.MouseButton1 or S.UserInputType == Enum.UserInputType.Touch then
								J:set(true)
							end
						end,
						[n("MouseEnter")] = function()
							I:set(true)
						end,
						[n("MouseLeave")] = function()
							I:set(false)
							J:set(false)
						end,
					}) } }) } }), q("Frame")({ Name = "Tablist", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 45), Size = UDim2.new(0, 200, 1, -45), ZIndex = 5, [k] = { q("ScrollingFrame")({ Name = "Tablist", ScrollBarImageColor3 = Color3.fromRGB(32, 32, 44), ScrollBarThickness = 0, ScrollingDirection = Enum.ScrollingDirection.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Selectable = false, Size = UDim2.new(1, 0, 1, -15), AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(0, 0, 0, 0), [k] = { q("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }), q("UIPadding")({ Name = "UIPadding", PaddingTop = UDim.new(0, 5) }), m(i.Categorys, function(S, T)
						return S, T
					end, g.cleanup) } }), q("Frame")({ Name = "Seperator", BackgroundColor3 = j.stroke, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(1, 0), Size = UDim2.new(0, -1, 1, 0) }) } }), q("Frame")({ Name = "Containers", AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, ClipsDescendants = true, Position = UDim2.new(1, 0, 0, 45), Size = UDim2.new(1, -200, 1, -45), SelectionGroup = true, [k] = { q("Frame")({ Name = "StatusBar", AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = j.background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 25), [k] = { q("UIStroke")({ Name = "UIStroke", Color = j.stroke }), q("UIListLayout")({ Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 10) }), q("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) }), m(O, function(S, T)
						return S, u(S, T)
					end, g.cleanup) } }), m(i.Containers, function(S, T)
						return S, T
					end, g.cleanup) } }) } })
					i.add("Objects", q("ImageLabel")({ Name = "Cursor", Image = "rbxassetid://125451561960633", ImageColor3 = j.accent, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = A, Size = UDim2.fromOffset(24, 24), Visible = z, ZIndex = 9999 }), "Cursor")
					table.insert(
						e(i.Library).Connections,
						s.InputChanged:Connect(function(S)
							if S.UserInputType == Enum.UserInputType.MouseMovement then
								local T = s:GetMouseLocation()
								local U, V = T.X - 7, T.Y
								A:set(UDim2.fromOffset(U, V))
							end
						end)
					)
					table.insert(
						e(i.Library).Connections,
						r:GetPropertyChangedSignal("ViewportSize"):Connect(function()
							if not N:get() and not D:get() then
								x.Root.Position = Q()
							end
						end)
					)
					table.insert(
						e(i.Library).Connections,
						x.Root.MouseEnter:Connect(function()
							s.MouseIconEnabled = false
							z:set(true)
						end)
					)
					table.insert(
						e(i.Library).Connections,
						x.Root.MouseLeave:Connect(function()
							s.MouseIconEnabled = true
							z:set(false)
						end)
					)
					table.insert(
						e(i.Library).Connections,
						s.InputChanged:Connect(function(S)
							if (S.UserInputType == Enum.UserInputType.MouseMovement or S.UserInputType == Enum.UserInputType.Touch) and D:get() then
								local T, U, V = M:get(), E:get(), S.Position
								local W = V - U
								local X = T + Vector2.new(W.X, W.Y)
								local Y = Vector2.new(math.clamp(X.X, 600, 2048), math.clamp(X.Y, 400, 2048))
								F:set({ X = Y.X, Y = Y.Y })
							end
						end)
					)
					table.insert(
						e(i.Library).Connections,
						s.InputEnded:Connect(function(S)
							if (S.UserInputType == Enum.UserInputType.MouseButton1 or S.UserInputType == Enum.UserInputType.Touch) and D:get() then
								D:set(false)
							end
						end)
					)
					function x.Init(S)
						if not e(i.Library).SilentMode then
							y:set(true)
						end
					end
					local S = ac(ab.Parent.category)
					function x.AddCategory(T, U)
						local V = S({ Title = U.Title, Order = x.Categorys })
						i.add("Categorys", V.Root, U.Title)
						x.Categorys += 1
						return V
					end
					function x.SetScale(T, U)
						K:set(U)
					end
					function x.AddTag(T, U)
						local V, W = q("Frame")({ Name = "TagHolder", AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = j.accent, BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromOffset(0, 15), [k] = { q("TextLabel")({ Name = "TagTitle", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = U or "TAG", TextColor3 = j.tertiary_text, TextSize = 12, AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 1) }), q("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5) }), q("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), q("UIStroke")({ Name = "UIStroke", Color = j.stroke, Thickness = 1.75 }) } }), e(B).TextHolder
						V.Parent = W
						return V
					end
					local T = { success = true, info = true, warning = true, danger = true }
					function x.AddStatus(U, V, W, X)
						assert(type(V) == "string" and V ~= "", "AddStatus requires a non-empty string key.")
						assert(type(W) == "string", "AddStatus requires initialText string.")
						local Y = string.lower(X or "info")
						assert(T[Y], ([[AddStatus received invalid stateType: %s. Valid types: success, info, warning, danger.]]):format(tostring(X)))
						local Z = O:get()
						if Z[V] then
							warn(([[Status with key '%s' already exists. Overwriting is not directly supported, returning existing controls.]]):format(V))
							local _ = Z[V]
							return {
								SetText = function(ad, ae)
									_.text:set(ae)
								end,
								SetState = function(ad, ae)
									local af = string.lower(ae or "info")
									if T[af] then
										_.stateType:set(af)
									else
										warn(("SetState received invalid stateType: %s"):format(tostring(ae)))
									end
								end,
							}
						end
						local ad, ae, af = o(W), o(Y), {}
						for _, ag in pairs(Z) do
							af[_] = ag
						end
						af[V] = { text = ad, stateType = ae }
						O:set(af)
						return {
							SetText = function(ag, _)
								assert(type(_) == "string", "SetText requires a string.")
								ad:set(_)
							end,
							SetState = function(ag, _)
								local ah = string.lower(_ or "info")
								assert(T[ah], ([[SetState received invalid stateType: %s. Valid types: success, info, warning, danger.]]):format(tostring(_)))
								ae:set(ah)
							end,
							Destroy = function(ag)
								local ah = O:get()
								if ah[V] then
									local _ = {}
									for ai, aj in pairs(ah) do
										if ai ~= V then
											_[ai] = aj
										end
									end
									O:set(_)
								end
							end,
						}
					end
					i.add("Objects", x.Root, v.Title)
					local ad = h.createDragController(e(B), { DragGui = e(x.Root), SnapEnabled = true })
					ad:Connect()
					ad.DragBegan:Connect(function()
						N:set(true)
					end)
					ad.DragEnded:Connect(function()
						N:set(false)
					end)
					table.insert(
						e(i.Library).Connections,
						s.InputEnded:Connect(function(ae)
							if type(w.MinimizeKeybind) == "table" and w.MinimizeKeybind.Type == "Keybind" and not s:GetFocusedTextBox() then
								if ae.KeyCode.Name == w.MinimizeKeybind.Value then
									x:Minimize()
								end
							elseif ae.KeyCode == w.MinimizeKey and not s:GetFocusedTextBox() then
								x:Minimize()
							end
						end)
					)
					R:init(x.Root)
					return x
				end
			end)()
		end,
		[31] = function()
			local aa, ab, ac = a(31)
			local ad
			return (function(...)
				local ae = ac(ab.Parent.Parent.Parent.packages.fusion)
				local af, ag, ah, ai, aj, b, c, d, e, f, g = ae.New, ae.Children, ae.Value, ae.Computed, ae.Observer, ae.Ref, ac(ab.Parent.Parent.Parent.packages.states), game:GetService("UserInputService"), game:GetService("RunService"), ac(ab.Parent.Parent.Parent.utils.unwrap), ac(ab.Parent.Parent.Parent.storage.theme)
				local h = function(h)
					local i, j, k, l, m = ah(false), ah(UDim2.new()), ah(), ah(Vector2.new(100, 22)), ah()
					local n, o, p, q, r = af("TextLabel")({ [b] = m, Text = h.Text or "Tooltip", TextSize = 12, FontFace = Font.new("rbxassetid://12187365364"), Size = UDim2.fromOffset(0, 0), Position = UDim2.fromOffset(0, 0), TextWrapped = false, Visible = false, Parent = ai(function()
						return f(c.Library).GUI
					end, ae.cleanup) }), af("Frame")({ [b] = k, BackgroundTransparency = 0, BackgroundColor3 = g.background, BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2.fromOffset(0, 0), Position = ai(function()
						local n, o, p = j:get(), workspace.CurrentCamera.ViewportSize, l:get()
						local q, r = math.min(n.X.Offset, o.X - p.X - 10), math.min(math.max(10, n.Y.Offset - 30), o.Y - p.Y - 10)
						return UDim2.new(0, q, 0, r)
					end), Visible = ai(function()
						return i:get()
					end), ZIndex = 1000, Parent = ai(function()
						return f(c.Library).GUI
					end, ae.cleanup), [ag] = { af("TextLabel")({ Text = h.Text or "Tooltip", TextColor3 = g.secondary_text, TextSize = 12, FontFace = Font.new("rbxassetid://12187365364"), BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.None, Size = UDim2.new(1, 0, 1, 0), TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Center, TextWrapped = true }), af("UIPadding")({ PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), PaddingTop = UDim.new(0, 3), PaddingBottom = UDim.new(0, 3) }), af("UISizeConstraint")({ MinSize = Vector2.new(0, 16), MaxSize = Vector2.new(300, 200) }), af("UICorner")({ CornerRadius = UDim.new(0, 3) }), af("UIStroke")({ Color = g.stroke, Thickness = 1, Transparency = 0 }) } }), function()
						local n = d:GetMouseLocation()
						j:set(UDim2.new(0, n.X, 0, n.Y))
						local o = f(m)
						if o then
							o.Text = h.Text or "Tooltip"
							local p, q, r = game:GetService("TextService"):GetTextSize(o.Text, o.TextSize, Enum.Font.Gotham, Vector2.new(300, 10000)), #(h.Text or "Tooltip")
							if q <= 3 then
								r = 12
							elseif q <= 10 then
								r = 15
							else
								r = 20
							end
							local s, t = p.X + r, f(k)
							if t then
								t.Size = UDim2.new(0, s, 0, p.Y + 8)
							end
							o.Size = UDim2.fromOffset(s, p.Y)
						end
						local p = f(k)
						if p then
							l:set(p.AbsoluteSize)
						end
					end, (aj(i))
					q:onChange(function()
						if i:get() then
							if not r then
								p()
								r = e.RenderStepped:Connect(p)
							end
						else
							if r then
								r:Disconnect()
								r = nil
							end
						end
					end)
					local s = function()
						if r then
							r:Disconnect()
						end
						if o then
							o:Destroy()
						end
						if n then
							n:Destroy()
						end
						q:Destroy()
					end
					return {
						instance = o,
						set_visible = function(t)
							i:set(t)
						end,
						destroy = s,
					}
				end
				return h
			end)()
		end,
		[32] = function()
			local aa, ab, ac = a(32)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah, ai = ac(ae.animate), ac(ae.unwrap), ac(ae.insertitem), ab.Parent.Parent.Parent.packages
				local aj, b = ac(ai.fusion), ac(ai.states)
				local c, d, e, f, g, h = aj.Children, aj.ForPairs, aj.OnEvent, aj.Value, aj.New, ac(ab.Parent.Parent.Parent.storage.theme)
				return function(i)
					local j, k = { Selected = f(false), Sections = f({}), nSections = 0 }, ag(b.Elements)
					local l = g("ScrollingFrame")({ Name = i.Title, ScrollBarImageColor3 = h.secondary_text, ScrollBarThickness = 2, ScrollingDirection = Enum.ScrollingDirection.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, ClipsDescendants = true, Selectable = false, Size = UDim2.new(1, 0, 1, -31), AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(0, 0, 0, 0), Visible = j.Selected, [c] = { g("UIPadding")({ Name = "UIPadding", PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8) }), g("UIListLayout")({ Name = "UIListLayout", HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10) }), d(j.Sections, function(l, m)
						return l, m
					end, aj.cleanup) } })
					j.Root = g("TextButton")({
						Name = i.Title,
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 0),
						[c] = { g("TextLabel")({ Name = "TextLabel", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = i.Title, TextColor3 = af(function()
							if j.Selected:get() then
								return ag(h.text)
							else
								return ag(h.tertiary_text)
							end
						end, 25, 1), TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(15, 0), Size = UDim2.new(1, -15, 0, -10) }), g("Frame")({ Name = "Indicator", BackgroundColor3 = h.accent, BackgroundTransparency = af(function()
							if j.Selected:get() then
								return 0
							end
							return 1
						end, 25, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 15, 1, 0), Size = af(function()
							if j.Selected:get() then
								return UDim2.fromOffset(15, 4)
							else
								return UDim2.fromOffset(0, 4)
							end
						end, 20, 1), Visible = j.Selected, [c] = { g("UICorner")({ Name = "UICorner" }) } }), g("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }), g("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 15) }) },
						[e("MouseButton1Click")] = function()
							j:SetValue(true)
						end,
					})
					b.add("Tabs", j, i.Title)
					b.add("Containers", l, i.Title)
					function j.SetValue(m, n)
						for o, p in pairs(ag(b.Tabs)) do
							p.Selected:set(false)
						end
						j.Selected:set(n)
					end
					local m = ac(ab.Parent.section)
					function j.AddSection(n, o)
						local p = {}
						p.Component = m({ Title = o.Title, Order = j.nSections })
						p.Container = p.Component.Components
						ah(j.Sections, p.Component.Root)
						j.nSections += 1
						setmetatable(p, k)
						return p
					end
					return j
				end
			end)()
		end,
		[33] = function()
			local aa, ab, ac = a(33)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.packages
				local af, ag = ac(ae.fusion), ab.Parent.Parent.Parent.utils
				local ah, ai, aj, b, c, d, e, f = ac(ag.animate), ac(ag.unwrap), af.Children, af.ForPairs, af.Value, af.New, af.OnEvent, ac(ab.Parent.Parent.Parent.storage.theme)
				return function(g)
					local h = { Components = c({}), Collapsed = c(g.Collapsed or false) }
					h.Root = d("Frame")({ Name = "Section", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = f.secondary_background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, -15, 0, 0), ClipsDescendants = true, [aj] = { d("UIStroke")({ Name = "UIStroke", Color = f.stroke }), d("UIListLayout")({ Name = "UIListLayout", SortOrder = Enum.SortOrder.LayoutOrder }), d("Frame")({ Name = "Header", BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 40), [aj] = { d("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal), Text = g.Title, TextColor3 = f.tertiary_text, TextSize = 18, TextXAlignment = Enum.TextXAlignment.Left, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.X, Size = UDim2.new(0, 0, 1, 0) }), d("ImageButton")({
						Name = "Collapse",
						Image = "rbxassetid://107640924738262",
						ImageColor3 = f.tertiary_text,
						AnchorPoint = Vector2.new(1, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Position = UDim2.new(1, -15, 0.5, 0),
						Size = UDim2.fromOffset(20, 20),
						Rotation = ah(function()
							if h.Collapsed:get() then
								return 180
							end
							return 0
						end, 25, 1),
						[e("MouseButton1Click")] = function()
							h.Collapsed:set(not h.Collapsed:get())
						end,
					}) } }), d("TextLabel")({ Name = "CollapsedMessage", LayoutOrder = 1, Visible = af.Computed(function()
						return h.Collapsed:get()
					end), FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium), Text = [[Click the arrow to expand this section and view all elements...]], TextColor3 = f.tertiary_text, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y }), d("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 15), PaddingLeft = UDim.new(0, 15), PaddingTop = UDim.new(0, 5) }), d("Frame")({ Name = "Holder", Visible = af.Computed(function()
						return not h.Collapsed:get()
					end), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [aj] = { d("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom }), d("UIPadding")({ Name = "UIPadding", PaddingRight = UDim.new(0, 15), PaddingBottom = UDim.new(0, 0) }), b(h.Components, function(i, j)
						return i, j
					end, af.cleanup) } }) } })
					return h
				end
			end)()
		end,
		[34] = function()
			local aa, ab, ac = a(34)
			local ad
			return (function(...)
				local ae, af, ag = game:GetService("UserInputService"), game:GetService("Workspace").CurrentCamera, ab.Parent.Parent.Parent.utils
				local ah, ai, aj, b, c, d = ac(ag.animate), ac(ag.color3), ac(ag.unwrap), ac(ag.insertitem), ac(ag.safecallback), ab.Parent.Parent.Parent.packages
				local e, f = ac(d.fusion), ac(d.states)
				local g, h, i, j, k, l, m, n, o, p, q, r, s = e.Children, e.Computed, e.ForPairs, e.ForValues, e.Observer, e.OnChange, e.OnEvent, e.Value, e.Tween, e.Ref, e.New, ac(ab.Parent.Parent.Parent.storage.theme), { Window = nil }
				function s.init(t, u)
					s.Window = u
				end
				function s.Create(t, u)
					local v, w = { Opened = n(false), Buttons = n({}), Connection = nil }, n()
					v.Root = q("TextButton")({ Name = "Modal", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = ah(function()
						if v.Opened:get() then
							return 0.5
						end
						return 1
					end, 40, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1), ZIndex = 10, Parent = s.Window, [g] = { q("Frame")({ [p] = w, Name = "Canvas", AnchorPoint = Vector2.new(0.5, 0.5), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = r.secondary_background, BackgroundTransparency = ah(function()
						if v.Opened:get() then
							return 0
						end
						return 1
					end, 40, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(500, 0), [g] = { q("Frame")({ Name = "Holder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 1), [g] = { q("Frame")({ Name = "TextHolder", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [g] = { q("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder }), q("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 20), PaddingTop = UDim.new(0, 20) }), q("TextLabel")({ Name = "TextLabel", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = u.Title, TextColor3 = r.secondary_text, TextSize = 17, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(15, 0), TextTransparency = ah(function()
						if v.Opened:get() then
							return 0
						end
						return 1
					end, 40, 1) }), q("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364"), RichText = true, Text = u.Description, TextColor3 = r.tertiary_text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0), TextTransparency = ah(function()
						if v.Opened:get() then
							return 0
						end
						return 1
					end, 40, 1) }) } }), q("Frame")({ Name = "Buttons", AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 40), [g] = { q("Frame")({ Name = "Seperator", BackgroundTransparency = ah(function()
						if v.Opened:get() then
							return 0
						end
						return 1
					end, 40, 1), BackgroundColor3 = r.stroke, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 0), Size = UDim2.new(1, 0, 0, 1) }), q("Frame")({ Name = "Holder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 1), [g] = { q("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), q("UIPadding")({ Name = "UIPadding", PaddingRight = UDim.new(0, 10) }), i(v.Buttons, function(x, y)
						return x, y
					end, e.cleanup) } }) } }), q("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 15), SortOrder = Enum.SortOrder.LayoutOrder }) } }), q("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), q("UIStroke")({ Name = "UIStroke", Color = r.stroke, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Transparency = ah(function()
						if v.Opened:get() then
							return 0
						end
						return 1
					end, 40, 1) }) } }) } })
					function v.AddButton(x, y)
						local z, A = n(false), n(false)
						local B = q("TextButton")({
							Name = "Frame",
							FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
							Text = y.Title,
							AutomaticSize = Enum.AutomaticSize.X,
							TextColor3 = ah(function()
								local B = y.Style
								if B == "default" then
									if aj(z) and not aj(A) then
										return ai.lightenRGB(r.tertiary_text:get(), 15)
									end
									return r.tertiary_text:get()
								elseif B == "primary" then
									if aj(z) and not aj(A) then
										return ai.lightenRGB(r.text:get(), 15)
									end
									return r.text:get()
								end
							end, 40, 1),
							TextSize = 14,
							BackgroundTransparency = ah(function()
								if v.Opened:get() then
									return 0
								end
								return 1
							end, 40, 1),
							BackgroundColor3 = ah(function()
								local B = y.Style
								if B == "default" then
									if aj(z) and not aj(A) then
										return ai.darkenRGB(r.background:get(), 5)
									end
									return r.background:get()
								elseif B == "primary" then
									if aj(z) and not aj(A) then
										return ai.darkenRGB(r.accent:get(), 15)
									end
									return r.accent:get()
								end
							end, 40, 1),
							TextTransparency = ah(function()
								if v.Opened:get() then
									return 0
								end
								return 1
							end, 40, 1),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.fromOffset(0, 28),
							[g] = { q("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = r.stroke, Transparency = ah(function()
								if v.Opened:get() then
									return 0
								end
								return 1
							end, 40, 1) }), q("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), q("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) }) },
							[m("InputEnded")] = function(B)
								if B.UserInputType == Enum.UserInputType.MouseButton1 or B.UserInputType == Enum.UserInputType.Touch then
									A:set(false)
									c(function()
										if y.Callback ~= nil and typeof(y.Callback) == "function" then
											y.Callback()
										end
									end)
									v:Close()
								end
							end,
							[m("InputBegan")] = function(B)
								if B.UserInputType == Enum.UserInputType.MouseButton1 or B.UserInputType == Enum.UserInputType.Touch then
									A:set(true)
								end
							end,
							[m("MouseEnter")] = function()
								z:set(true)
							end,
							[m("MouseLeave")] = function()
								z:set(false)
								A:set(false)
							end,
						})
						b(v.Buttons, B)
					end
					function v.Close(x)
						v.Opened:set(false)
						task.wait(0.25)
						v.Root:Destroy()
						v.Connection:Disconnect()
					end
					v.Connection = ae.InputBegan:Connect(function(x)
						if aj(w) == nil then
							v.Connection:Disconnect()
						end
						if x.UserInputType == Enum.UserInputType.MouseButton1 or x.UserInputType == Enum.UserInputType.Touch then
							local y, z = aj(w).AbsolutePosition, aj(w).AbsoluteSize
							if ae:GetMouseLocation().X < y.X or ae:GetMouseLocation().X > y.X + z.X or ae:GetMouseLocation().Y < (y.Y - 20 - 1) or ae:GetMouseLocation().Y > y.Y + z.Y then
								v:Close()
							end
						end
					end)
					table.insert(aj(f.Library).Connections, v.Connection)
					v.Opened:set(true)
					return v
				end
				return s
			end)()
		end,
		[35] = function()
			local aa, ab, ac = a(35)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah, ai, aj, b = ac(ae.animate), ac(ae.color3), ac(ae.unwrap), ac(ae.insertitem), ac(ae.safecallback), ab.Parent.Parent.Parent.packages
				local c, d = ac(b.fusion), ac(b.states)
				local e, f, g, h, i, j, k, l, m, n, o = c.Children, c.Computed, c.ForPairs, c.Observer, c.OnChange, c.OnEvent, c.Value, c.Tween, c.Ref, c.New, ac(ab.Parent.Parent.Parent.storage.theme)
				return function(p)
					local q, r = { Tabs = k({}), Collapsed = k(false), ExpandedHeight = k(0) }, k()
					q.Root = n("Frame")({ Name = "Section", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, LayoutOrder = p.Order, Size = af(function()
						return q.Collapsed:get() and UDim2.new(1, 0, 0, 40) or UDim2.new(1, 0, 0, ah(q.ExpandedHeight) + 45)
					end, 50, 1), ClipsDescendants = true, [e] = { n("Frame")({ Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 40), [e] = { n("TextLabel")({ Name = "TextLabel", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = p.Title, TextColor3 = o.secondary_text, TextSize = 17, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(14, 0), Size = UDim2.fromScale(0, 1) }), n("ImageButton")({
						Name = "Collapse",
						Image = "rbxassetid://107640924738262",
						ImageColor3 = o.tertiary_text,
						AnchorPoint = Vector2.new(1, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Position = UDim2.new(1, -15, 0.5, -1),
						Size = UDim2.fromOffset(20, 20),
						Rotation = af(function()
							if q.Collapsed:get() then
								return 180
							end
							return 0
						end, 25, 1),
						[j("MouseButton1Click")] = function()
							q.Collapsed:set(not q.Collapsed:get())
						end,
					}) } }), n("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder }), n("Frame")({ Name = "Holder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [e] = { n("UIListLayout")({
						[m] = r,
						Name = "UIListLayout",
						Padding = UDim.new(0, 13),
						SortOrder = Enum.SortOrder.LayoutOrder,
						[i("AbsoluteContentSize")] = function(s)
							q.ExpandedHeight:set(s.Y)
						end,
					}), g(q.Tabs, function(s, t)
						return s, t
					end, c.cleanup) } }) } })
					function q.AddTab(s, t)
						local u = ac(ab.Parent.tab)({ Title = t.Title })
						ai(q.Tabs, u.Root)
						if not d.HasSelected:get() then
							d.HasSelected:set(true)
							u.Selected:set(true)
						end
						return u
					end
					q.ExpandedHeight:set(ah(r).AbsoluteContentSize.Y)
					return q
				end
			end)()
		end,
		[37] = function()
			local aa, ab, ac = a(37)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.packages
				local af, ag = ac(ae.fusion), ac(ae.states)
				local ah, ai, aj = af.New, af.Children, af.ForPairs
				return ah("Frame")({ Name = "NotificationHolder", AnchorPoint = Vector2.new(1, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(1, 1), Size = UDim2.new(0, 360, 1, 0), ZIndex = 100, [ai] = { ah("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 7), HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Bottom }), ah("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) }), aj(ag.Notifications, function(b, c)
					return b, c
				end, af.cleanup) } })
			end)()
		end,
		[38] = function()
			local aa, ab, ac = a(38)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah, ai, aj = ac(ae.unwrap), ac(ae.insertitem), ac(ae.animate), ac(ae.color3), ab.Parent.Parent.Parent.packages
				local b, c = ac(aj.fusion), ac(aj.states)
				local d, e, f, g, h, i, j, k, l = b.Children, b.Computed, b.Value, b.Tween, b.Ref, b.New, ac(ab.Parent.Parent.Parent.storage.theme), { success = "rbxassetid://102565000975009", error = "rbxassetid://119383425349619", warning = "rbxassetid://106245602962145", info = "rbxassetid://80390185288503" }, {}
				function l.New(m, n)
					n.Duration = n.Duration or 5
					local o, p, q, r = f(UDim2.new(1, 15, 0, 0)), f(UDim2.new(0, 0, 0, 0)), f(UDim2.new(1, 15, 0, 3)), f()
					local s = i("Frame")({ Name = "Notification", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = ah(function()
						return af(p)
					end, 20, 1.2), [d] = { i("CanvasGroup")({ [h] = r, Name = "Object", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = j.secondary_background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromOffset(298, 0), Position = ah(function()
						return af(o)
					end, 30, 1.2), [d] = { i("UICorner")({ Name = "UICorner" }), i("Frame")({ Name = "Holder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(55, 0), Size = UDim2.new(1, -60, 1, 0), [d] = { i("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }), i("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal), RichText = true, Text = n.Title, TextColor3 = j.text, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), ZIndex = 3 }), i("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), RichText = true, Text = n.Description, TextColor3 = j.secondary_text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), ZIndex = 3 }) } }), i("Frame")({ Name = "Circle", AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = e(function()
						return ai.lightenRGB(af(j.secondary_background), 8)
					end), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 15, 0.5, 0), Size = UDim2.fromOffset(30, 30), [d] = { i("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(1, 0) }), i("ImageLabel")({ Name = "Icon", Image = k[n.Type], ImageColor3 = e(function()
						local s, t = n.Type
						if s == "info" then
							t = af(j.accent)
						elseif s == "error" then
							t = af(j.danger)
						elseif s == "warning" then
							t = af(j.warning)
						elseif s == "success" then
							t = af(j.success)
						end
						return t
					end), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(20, 20), [d] = { i("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(1, 0) }) } }) } }), i("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 15), PaddingRight = UDim.new(0, 15), PaddingTop = UDim.new(0, 15) }), i("Frame")({ Name = "Frame", AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = e(function()
						local s, t = n.Type
						if s == "info" then
							t = af(j.accent)
						elseif s == "error" then
							t = af(j.danger)
						elseif s == "warning" then
							t = af(j.warning)
						elseif s == "success" then
							t = af(j.success)
						end
						return t
					end), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 1, 15), Size = g(
						e(function()
							return af(q)
						end),
						TweenInfo.new(n.Duration, Enum.EasingStyle.Linear)
					) }), i("UIStroke")({ Name = "UIStroke", Color = Color3.fromRGB(50, 50, 50), Thickness = 2.5, Transparency = 0.6 }) } }) } })
					if not af(c.Library).SilentMode then
						ag(c.Notifications, s)
					end
					task.wait(0.1)
					task.spawn(function()
						p:set(UDim2.fromOffset(300, af(r).AbsoluteSize.Y))
						task.delay(0.2, function()
							o:set(UDim2.fromScale(0, 0))
							q:set(UDim2.new(0, 0, 0, 3))
							task.wait(n.Duration)
							o:set(UDim2.new(1, 20, 0, 0))
							task.wait(0.3)
							p:set(UDim2.fromOffset(300, -12))
							task.wait(0.5)
							s:Destroy()
						end)
					end)
					return s
				end
				return l
			end)()
		end,
		[40] = function()
			local aa, ab, ac = a(40)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah = ac(ae.animate), ac(ae.unwrap), ab.Parent.Parent.Parent.packages
				local ai, aj, b = ac(ah.fusion), ac(ah.states), ac(ab.Parent.Parent.Parent.storage.theme)
				local c, d, e, f, g = ai.Children, ai.Value, ai.Ref, ai.New, ai.ForPairs
				return function()
					local h, i, j, k, l = d(0), d(), d(), af(function()
						if #ag(aj.Suggestions) <= 0 then
							return 1
						end
						if ag(aj.CommandBarOpened) and #ag(aj.CommandBarText) > 1 then
							return 0.02
						else
							return 1
						end
					end, 45, 1.2), af(function()
						if #ag(aj.Suggestions) <= 0 then
							return 1
						end
						if ag(aj.CommandBarOpened) and #ag(aj.CommandBarText) > 1 then
							return 0.6
						else
							return 1
						end
					end, 45, 1.2)
					local m = f("CanvasGroup")({ [e] = i, Name = "Suggestions", AnchorPoint = Vector2.new(0.5, 0), BackgroundColor3 = b.background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = af(function()
						if #ag(aj.Suggestions) <= 0 then
							return UDim2.new(0.5, 0, 0, 200)
						end
						if ag(aj.CommandBarOpened) and #ag(aj.CommandBarText) > 1 then
							return UDim2.new(0.5, 0, 0, 180)
						else
							return UDim2.new(0.5, 0, 0, 200)
						end
					end, 45, 1.2), Size = af(function()
						return UDim2.fromOffset(517, math.clamp(ag(h), 72, 765))
					end, 35, 1.2), GroupTransparency = k, [c] = { f("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 10) }), f("UIStroke")({ Name = "UIStroke", Color = b.stroke, Thickness = 2.5, Transparency = l }), f("UIScale")({ Name = "UIScale" }), f("Frame")({ Name = "Holder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 1), [c] = { f("Frame")({ [e] = j, Name = "Sizing", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [c] = { f("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }), f("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingTop = UDim.new(0, 8) }), g(aj.Suggestions, function(m, n)
						return m, n
					end, ai.cleanup) } }) } }) } })
					ag(j):GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
						h:set(ag(j).AbsoluteSize.Y)
					end)
					return m
				end
			end)()
		end,
		[41] = function()
			local aa, ab, ac = a(41)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah = ac(ae.animate), ac(ae.unwrap), ab.Parent.Parent.Parent.packages
				local ai, aj, b = ac(ah.fusion), ac(ah.states), ac(ab.Parent.Parent.Parent.storage.theme)
				local c, d, e, f, g, h, i, j, k, l = ai.Children, ai.OnEvent, ai.Value, ai.Ref, ai.New, ai.OnChange, ai.Observer, ai.ForPairs, ai.Computed, { string = { color = b.accent, icon = "rbxassetid://14080619136" }, boolean = { color = b.warning, icon = "rbxassetid://14080668232" }, number = { color = b.success, icon = "rbxassetid://14080652058" } }
				return function(m)
					local n = g("Frame")({ Name = "Suggestion", BackgroundColor3 = b.secondary_background, BorderColor3 = Color3.fromRGB(37, 40, 44), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 55), BackgroundTransparency = k(function()
						return m.top and 0 or 0.7
					end), [c] = { g("UIStroke")({ Name = "UIStroke", Color = Color3.fromRGB(48, 52, 56) }), g("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 6) }), g("Frame")({ Name = "TextHolder", AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(0, 1), [c] = { g("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 1), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), g("TextLabel")({ Name = "TextLabel", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal), Text = m.name, TextColor3 = b.secondary_text, TextSize = 16, AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0 }), g("TextLabel")({ Name = "TextLabel", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = m.description, TextColor3 = b.tertiary_text, TextSize = 14, AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0 }), g("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 10) }) } }), g("Frame")({ Name = "Types", AnchorPoint = Vector2.new(1, 0), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1, -10, 0, 0), Size = UDim2.fromScale(0, 1), [c] = { g("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 7), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), j(m.types, function(n, o)
						return n, g("Frame")({ Name = "TYPE", AutomaticSize = Enum.AutomaticSize.XY, BackgroundColor3 = l[o.type].color, BackgroundTransparency = 0.9, BorderSizePixel = 0, Size = UDim2.fromOffset(0, 0), [c] = { g("TextLabel")({ Name = "TypeText", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Text = string.upper(o.name), TextColor3 = l[o.type].color, TextSize = 13, AutomaticSize = Enum.AutomaticSize.XY, BackgroundTransparency = 1, Size = UDim2.fromScale(0, 0), TextXAlignment = Enum.TextXAlignment.Center }), g("UICorner")({ CornerRadius = UDim.new(0, 4) }), g("UIPadding")({ PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 6) }), g("UIStroke")({ Color = l[o.type].color, Transparency = 0.2, Thickness = 1.5 }) } })
					end, ai.cleanup) } }) } })
					return n
				end
			end)()
		end,
		[42] = function()
			local aa, ab, ac = a(42)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah = ac(ae.animate), ac(ae.unwrap), ab.Parent.Parent.Parent.packages
				local ai, aj, b, c = ac(ah.fusion), ac(ah.states), ac(ah.audio), ac(ab.Parent.Parent.Parent.storage.theme)
				local d, e, f, g, h, i, j = ai.Children, ai.OnEvent, ai.Value, ai.Ref, ai.New, ai.OnChange, ai.Observer
				return function()
					local k, l, m, n, o = f(UDim2.new(0.5, 0, 0, 100)), f(), f(), f(1), j(aj.CommandBarOpened)
					o:onChange(function()
						if ag(aj.CommandBarOpened) then
							n:set(1)
							k:set(UDim2.new(0.5, 0, 0, 130))
							ag(l):CaptureFocus()
						else
							ag(l):ReleaseFocus()
						end
					end)
					local p = h("CanvasGroup")({ [g] = m, Name = "Command Bar", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = c.background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = af(function()
						return k:get()
					end, 30, 1.2), Size = UDim2.fromOffset(517, 80), GroupTransparency = af(function()
						return ag(aj.CommandBarOpened) and 0 or 1
					end, 30, 1.2), [d] = { h("UIScale")({ Name = "UIScale", Scale = n }), h("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 10) }), h("UIStroke")({ Name = "UIStroke", Color = c.stroke, Thickness = 2.5, Transparency = af(function()
						return ag(aj.CommandBarOpened) and 0.6 or 1
					end, 30, 1.2) }), h("Frame")({ Name = "Top", BackgroundColor3 = c.secondary_background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 40), [d] = { h("Frame")({ Name = "Seperator", AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = c.stroke, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 1) }), h("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Text = "Command Bar", TextColor3 = c.text, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(15, 0), Size = UDim2.fromScale(0, 1) }), h("TextLabel")({ Name = "TextLabel", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = "Therion - v.1.0.0", TextColor3 = c.secondary_text, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Right, AnchorPoint = Vector2.new(1, 0), AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1, -15, 0, 0), Size = UDim2.fromScale(0, 1) }) } }), h("TextBox")({
						[g] = l,
						Name = "TextBox",
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
						PlaceholderColor3 = c.tertiary_text,
						PlaceholderText = "Type a command or search...",
						Text = "",
						TextColor3 = c.secondary_text,
						TextSize = 14,
						TextXAlignment = Enum.TextXAlignment.Left,
						AnchorPoint = Vector2.new(0, 1),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Position = UDim2.fromScale(0, 1),
						Size = UDim2.new(1, 0, 1, -40),
						[d] = { h("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 1), PaddingLeft = UDim.new(0, 40) }) },
						[i("Text")] = function()
							local p = ag(l)
							local q, r = p.Text, aj.CommandBarText:get()
							if #q > #r then
								b:Play("Key")
							elseif #q < #r then
								task.wait()
								if p:IsFocused() then
									b:Play("Backspace")
								end
							end
							aj.CommandBarText:set(q)
						end,
						[e("FocusLost")] = function()
							b:Play("Enter")
							aj.ToExecute:set(ag(l).Text)
							ag(l).Text = ""
							aj.CommandBarOpened:set(false)
							k:set(UDim2.new(0.5, 0, 0, 160))
							task.wait(0.2)
							n:set(0)
							k:set(UDim2.new(0.5, 0, 0, 100))
						end,
					}), h("ImageLabel")({ Name = "ImageLabel", Image = "rbxassetid://74833786606286", ImageColor3 = c.accent, AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 15, 0.75, 0), Size = UDim2.fromOffset(16, 16) }) } })
					return p
				end
			end)()
		end,
		[44] = function()
			local aa, ab, ac = a(44)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah = ac(ae.animate), ac(ae.unwrap), ab.Parent.Parent.Parent.packages
				local ai, aj, b = ac(ah.fusion), ac(ah.states), ac(ab.Parent.Parent.Parent.storage.theme)
				local c, d, e, f, g = ai.Children, ai.Computed, ai.New, ai.Value, function(c)
					local d = os.date("*t", c)
					return string.format("%02d:%02d", d.hour, d.min)
				end
				return function(h)
					local i, j, k = h.Message, h.LayoutOrder or 0, aj.CurrentUser:get()
					local l = i.user and i.user.name == k.name
					if i.type == "system" then
						return e("Frame")({ Name = "SystemMessage", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 30), LayoutOrder = j, [c] = { e("TextLabel")({ Name = "Content", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Italic), Text = i.content, TextColor3 = b.tertiary_text, TextSize = 14, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Center, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }) } })
					end
					return e("Frame")({ Name = "UserMessage", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, LayoutOrder = j, [c] = { e("Frame")({ Name = "MessageContainer", AnchorPoint = l and Vector2.new(1, 0) or Vector2.new(0, 0), BackgroundColor3 = l and b.accent or b.secondary_background, Position = l and UDim2.fromScale(1, 0) or UDim2.fromScale(0, 0), Size = UDim2.new(0.8, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, [c] = { e("UICorner")({ CornerRadius = UDim.new(0, 8) }), e("UIPadding")({ PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }), not l and e("Frame")({ Name = "UserInfo", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24), [c] = { e("TextLabel")({ Name = "Username", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Text = i.user.name, TextColor3 = l and b.background or b.text, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }) } }) or nil, e("TextLabel")({ Name = "Content", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal), Text = i.content, TextColor3 = l and b.background or b.text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, not l and 30 or 0), Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y }) } }) } })
				end
			end)()
		end,
		[45] = function()
			local aa, ab, ac = a(45)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah = ac(ae.animate), ac(ae.unwrap), ab.Parent.Parent.Parent.packages
				local ai, aj, b, c = ac(ah.fusion), ac(ah.states), ac(ah.audio), ac(ab.Parent.Parent.Parent.storage.theme)
				local d, e, f, g, h, i, j = ai.Children, ai.OnEvent, ai.Value, ai.Ref, ai.New, ai.OnChange, ac(ab.Parent.Parent.Parent.chat)
				return function(k)
					k = k or {}
					local l, m, n, o = k.Position or UDim2.new(0, 0, 1, -50), k.Size or UDim2.new(1, 0, 0, 50), f(), f("")
					local p = function()
						local p = o:get()
						if p and p:len() > 0 then
							j:SendMessage(p)
							o:set("")
							if n:get() then
								ag(n).Text = ""
								ag(n):CaptureFocus()
							end
						end
					end
					return h("Frame")({ Name = "ChatInput", BackgroundColor3 = c.secondary_background, Position = l, Size = m, [d] = { h("UIPadding")({ PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15) }), h("UICorner")({ CornerRadius = UDim.new(0, 8) }), h("Frame")({ Name = "TopCover", BackgroundColor3 = c.secondary_background, BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 8) }), h("TextBox")({
						Name = "InputField",
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
						PlaceholderColor3 = c.tertiary_text,
						PlaceholderText = "Type a message...",
						Text = "",
						TextColor3 = c.text,
						TextSize = 15,
						TextXAlignment = Enum.TextXAlignment.Left,
						BackgroundColor3 = c.background,
						Position = UDim2.fromOffset(0, 0),
						Size = UDim2.new(1, -80, 1, 0),
						ClipsDescendants = true,
						[g] = n,
						[d] = { h("UICorner")({ CornerRadius = UDim.new(0, 6) }), h("UIPadding")({ PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }), h("UIStroke")({ Color = c.stroke, Thickness = 1 }) },
						[i("Text")] = function()
							local q = ag(n)
							local r, s = q.Text, o:get()
							if #r > #s then
								b:Play("Key")
							elseif #r < #s then
								if q:IsFocused() then
									b:Play("Backspace")
								end
							end
							o:set(r)
						end,
						[e("FocusLost")] = function(q)
							if q then
								p()
								b:Play("Enter")
							end
						end,
					}), h("TextButton")({
						Name = "SendButton",
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
						Text = "Send",
						TextColor3 = c.background,
						TextSize = 14,
						BackgroundColor3 = c.accent,
						Position = UDim2.new(1, -70, 0, 0),
						Size = UDim2.fromOffset(70, 34),
						[d] = { h("UICorner")({ CornerRadius = UDim.new(0, 6) }), h("UIStroke")({ Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Transparency = 0.8 }) },
						[e("Activated")] = function()
							p()
							b:Play("Enter")
						end,
					}) } })
				end
			end)()
		end,
		[46] = function()
			local aa, ab, ac = a(46)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.Parent.utils
				local af, ag, ah = ac(ae.animate), ac(ae.unwrap), ab.Parent.Parent.Parent.packages
				local ai, aj, b = ac(ah.fusion), ac(ah.states), ac(ab.Parent.Parent.Parent.storage.theme)
				local c, d, e, f, g, h, i, j, k, l, m, n, o = ai.Children, ai.OnEvent, ai.Value, ai.Computed, ai.Ref, ai.New, ai.OnChange, ai.Observer, ai.ForValues, ai.ForPairs, game:GetService("UserInputService"), ac(ab.Parent.message), ac(ab.Parent.input)
				return function(p)
					p = p or {}
					local q, r, s, t, u, v, w, x, y = e(), e(), e(), p.Visible ~= nil and e(p.Visible) or e(true), p.Position ~= nil and e(p.Position) or e(UDim2.new(0.5, -200, 0.2, 0)), p.Size ~= nil and e(p.Size) or e(UDim2.fromOffset(400, 500)), e(false), e(Vector2.new(0, 0)), j(aj.ChatMessages)
					y:onChange(function()
						task.wait()
						if r:get() then
							local z = ag(r)
							z.CanvasPosition = Vector2.new(0, z.CanvasSize.Y.Offset)
						end
					end)
					local z, A, B, C, D = function(z)
						local A, B = ag(s), ag(q)
						if not A or not B then
							return
						end
						local C, D = Vector2.new(z.Position.X, z.Position.Y), A.AbsolutePosition
						x:set(C - D)
						w:set(true)
					end, function(z)
						if not w:get() then
							return
						end
						local A, B = Vector2.new(z.Position.X, z.Position.Y), ag(s)
						if B then
							local C = UDim2.new(0, A.X - x:get().X, 0, A.Y - x:get().Y)
							u:set(C)
						end
					end, function()
						w:set(false)
					end, {}, j(s)
					D:onChange(function()
						for E, F in ipairs(C) do
							F:Disconnect()
						end
						C = {}
						local E = ag(s)
						if E then
							table.insert(
								C,
								E.InputBegan:Connect(function(F)
									if F.UserInputType == Enum.UserInputType.MouseButton1 then
										z(F)
									end
								end)
							)
							table.insert(
								C,
								m.InputChanged:Connect(function(F)
									if F.UserInputType == Enum.UserInputType.MouseMovement then
										A(F)
									end
								end)
							)
							table.insert(
								C,
								m.InputEnded:Connect(function(F)
									if F.UserInputType == Enum.UserInputType.MouseButton1 then
										B()
									end
								end)
							)
						end
					end)
					return h("Frame")({ Name = "ChatWindow", AnchorPoint = Vector2.new(0, 0), BackgroundColor3 = b.background, Size = v, Position = u, Visible = t, [g] = q, [c] = { h("UICorner")({ CornerRadius = UDim.new(0, 8) }), h("UIStroke")({ Color = b.stroke, Thickness = 1 }), h("ImageLabel")({ Name = "Shadow", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, 24, 1, 24), ZIndex = -1, Image = "rbxassetid://6014261993", ImageColor3 = Color3.fromRGB(0, 0, 0), ImageTransparency = 0.6, ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(49, 49, 450, 450) }), h("Frame")({ Name = "Header", BackgroundColor3 = b.secondary_background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 40), [g] = s, [c] = { h("UICorner")({ CornerRadius = UDim.new(0, 8) }), h("Frame")({ Name = "BottomCover", AnchorPoint = Vector2.new(0, 1), BackgroundColor3 = b.secondary_background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 8) }), h("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Text = "Global Chat", TextColor3 = b.text, TextSize = 18, TextXAlignment = Enum.TextXAlignment.Left, AnchorPoint = Vector2.new(0, 0.5), BackgroundTransparency = 1, Position = UDim2.new(0, 15, 0.5, 0), Size = UDim2.new(0, 200, 0, 20) }), h("TextLabel")({ Name = "DragHint", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Italic), Text = "Drag to move", TextColor3 = b.tertiary_text, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Right, AnchorPoint = Vector2.new(1, 0.5), BackgroundTransparency = 1, Position = UDim2.new(1, -15, 0.5, 0), Size = UDim2.new(0, 100, 0, 20) }), h("Frame")({ Name = "StatusIndicator", AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = f(function()
						return aj.ChatConnected:get() and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(239, 83, 80)
					end), Position = UDim2.new(1, -125, 0.5, 0), Size = UDim2.fromOffset(8, 8), [c] = { h("UICorner")({ CornerRadius = UDim.new(1, 0) }), h("UIStroke")({ Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Transparency = 0.8 }) } }), h("TextLabel")({ Name = "StatusText", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal), Text = f(function()
						return aj.ChatConnected:get() and "Connected" or "Disconnected"
					end), TextColor3 = f(function()
						return aj.ChatConnected:get() and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(239, 83, 80)
					end), TextSize = 12, TextXAlignment = Enum.TextXAlignment.Right, AnchorPoint = Vector2.new(1, 0.5), BackgroundTransparency = 1, Position = UDim2.new(1, -140, 0.5, 0), Size = UDim2.new(0, 80, 0, 20) }) } }), h("ScrollingFrame")({ Name = "Messages", BackgroundColor3 = b.background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0, 40), Size = UDim2.new(1, 0, 1, -90), CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollBarThickness = 6, ScrollBarImageColor3 = b.accent, ScrollingDirection = Enum.ScrollingDirection.Y, VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, [g] = r, [c] = { h("UIPadding")({ PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15) }), h("UIListLayout")({ Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }), k(aj.ChatMessages, function(E, F)
						return n({ Message = E, LayoutOrder = F })
					end, ai.cleanup) } }), o({ Position = UDim2.new(0, 0, 1, -50), Size = UDim2.new(1, 0, 0, 50) }) } })
				end
			end)()
		end,
		[47] = function()
			local aa, ab, ac = a(47)
			local ad
			return (function(...)
				local ae, af = game:GetService("UserInputService"), ab.Parent
				local ag, ah = af.components, af.packages
				local ai, aj, b, c = ac(ah.fusion), ac(ah.states), ac(ah.damerau), ac(ah.cmdr)
				local d, e, f, g, h = ai.Observer, ac(ag.commandbar.bar), ac(ag.commandbar.suggestions), ac(ag.commandbar.suggestion), {}
				function h.Initialize(i)
					ae.InputBegan:Connect(function(j, k)
						if k then
							return
						end
						if j.KeyCode == aj.CommandBarPrefix:get() then
							task.wait()
							aj.CommandBarOpened:set(true)
						end
					end)
				end
				function h.SetupModuleSystem(i)
					local j = i:BuildTree()
					local k, l, m = i:BuildNames(j), c.new({}), d(aj.CommandBarText)
					m:onChange(function()
						local n, o = {}, aj.CommandBarText:get()
						for p, q in k do
							local r, s = j[q], b.raw(o, q)
							if r.aliases then
								for t, u in ipairs(r.aliases) do
									local v = b.raw(o, u)
									if v < s then
										s = v
									end
								end
							end
							n[q] = s
						end
						local p = {}
						for q in n do
							table.insert(p, q)
						end
						table.sort(p, function(q, r)
							return n[q] < n[r]
						end)
						local q = {}
						for r, s in p do
							if n[s] < 5 then
								local t, u = j[s], s
								if t.aliases and #t.aliases > 0 then
									u = u .. " / " .. table.concat(t.aliases, " / ")
								end
								table.insert(q, g({ name = u, description = t.description, types = t.arguments, top = r == 1 and true or false }))
							end
						end
						aj.Suggestions:set(q)
					end)
					local n = d(aj.ToExecute)
					n:onChange(function()
						task.wait()
						local o = aj.ToExecute:get()
						if o == "" then
							return
						end
						l:executeCommand(o)
						aj.ToExecute:set("")
					end)
					return function(o, p)
						assert(type(p) == "table", "Module data must be a table")
						assert(type(p.name) == "string", "Module must have a name")
						assert(type(p.description) == "string", "Module must have a description")
						assert(type(p.callback) == "function", "Module must have a callback function")
						if not p.arguments then
							p.arguments = {}
						end
						j[p.name] = p
						table.insert(k, p.name)
						l:newCommand({ name = p.name, aliases = p.aliases or {}, description = p.description, arguments = p.arguments or {}, callback = p.callback })
						aj.add("Commands", p, p.name)
					end
				end
				function h.BuildTree(i)
					local j, k = {}, af.modules:GetChildren()
					for l, m in k do
						local n = ac(m)
						j[n.name] = n
					end
					return j
				end
				function h.BuildNames(i, j)
					local k = {}
					for l, m in j do
						table.insert(k, m.name)
					end
					return k
				end
				return h
			end)()
		end,
		[48] = function()
			local aa, ab, ac = a(48)
			local ad
			return (function(...)
				local ae = {}
				for af, ag in next, ab:GetChildren() do
					table.insert(ae, ac(ag))
				end
				return ae
			end)()
		end,
		[49] = function()
			local aa, ab, ac = a(49)
			local ad
			return (function(...)
				local ae, af, ag = game:GetService("GuiService"), game:GetService("UserInputService"), ab.Parent.Parent.utils
				local ah, ai, aj, b, c = ac(ag.animate), ac(ag.unwrap), ac(ag.insertitem), ac(ag.safecallback), ab.Parent.Parent.packages
				local d, e = ac(c.fusion), ac(c.states)
				local f, g, h, i, j, k, l, m, n, o, p = d.Children, d.Computed, d.Observer, d.OnEvent, d.Value, d.New, d.Ref, d.OnChange, ac(ab.Parent.Parent.storage.theme), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)
				local q, r, s, t, u, v, w, x, y = p, UDim2.fromOffset(0, 0), Vector2.new(0.5, 0.5), UDim.new(0, 4), UDim.new(0, 2), { BackgroundTransparency = 1, BorderSizePixel = 0 }, { AutomaticSize = Enum.AutomaticSize.Y }, { ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Enabled = true }, {}
				y.__index = y
				y.__type = "Toggle"
				local z, A, B, C, D, E, F = function() end, function(z)
					return z.UserInputType == Enum.UserInputType.MouseButton1 or z.UserInputType == Enum.UserInputType.Touch
				end, function(z)
					return z.UserInputType == Enum.UserInputType.Keyboard
				end, function(...)
					local z = {}
					for A = 1, select("#", ...) do
						local B = select(A, ...)
						if B then
							for C, D in pairs(B) do
								z[C] = D
							end
						end
					end
					return z
				end, function(z)
					return k("UICorner")({ Name = "UICorner", CornerRadius = z or t })
				end, function(z)
					return k("UIStroke")({ Name = "UIStroke", Color = z })
				end, {}
				local G = function(G, H, I)
					H = H or Enum.FontWeight.Regular
					I = I or Enum.FontStyle.Normal
					local J = G .. "_" .. tostring(H) .. "_" .. tostring(I)
					if not F[J] then
						F[J] = Font.new(G, H, I)
					end
					return F[J]
				end
				function y.New(H, I, J)
					local K, L, M, N = J.Default or false, J.Callback or z, G("rbxassetid://12187365364", Enum.FontWeight.Medium), G("rbxassetid://12187365364")
					local O, P, Q, R, S, T, U, V, W, X, Y, Z, _, ak = {
						Value = K,
						Callback = L,
						Type = "Toggle",
						Changed = function(O)
							return O
						end,
						Connections = {},
						Keybind = nil,
					}, j(false), j(K), j(), j(false), j(), j(false), n.accent, n.text, n.secondary_text, n.tertiary_text, n.background, n.stroke, n.secondary_background
					local al, am = function()
						U:set(true)
					end, function()
						U:set(false)
					end
					function O.SetValue(an, ao)
						O.Value = ao
						Q:set(ao)
					end
					function O.GetValue(an)
						return O.Value
					end
					function O.OnChanged(an, ao)
						O.Changed = ao
						ao(O.Value)
					end
					local an, ao, ap = ah(function()
						if U:get() or Q:get() then
							return Q:get() and 0.15 or 1
						end
						return 1
					end, 40, 1), ah(function()
						return Q:get() and V:get() or Y:get()
					end, 40, 1), j(false)
					local aq, ar, as, at, au, av, aw, ax = function()
						ap:set(true)
					end, function()
						ap:set(false)
					end, ah(function()
						return ap:get() and X:get() or Y:get()
					end, 40, 1), ah(function()
						return Q:get() and W:get() or X:get()
					end, 40, 1), ah(function()
						return Q:get() and V:get() or Z:get()
					end, 40, 1), ah(function()
						return Q:get() and 0 or 1
					end, 15, 1), g(function()
						return not Q:get()
					end), function()
						O:SetValue(not Q:get())
					end
					local ay, az, aA = function(ay)
						if A(ay) then
							ax()
						end
					end, C(v, { Name = "Title", FontFace = M, Text = J.Title, TextColor3 = at, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0) }), J.Description and C(v, { Name = "Description", FontFace = N, RichText = true, Text = J.Description, TextColor3 = Y, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0), Visible = true })
					O.Root = k("Frame")(C(v, w, { Name = J.Title, Size = UDim2.new(1, 0, 0, 0), [f] = { k("Frame")(C(v, { Name = "Addons", Position = UDim2.fromScale(1, 0), Size = UDim2.fromScale(0, 1), [f] = { k("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 12), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), g(function()
						if P:get() then
							return k("ImageButton")(C(v, {
								[l] = R,
								Name = "ImageButton",
								Image = "rbxassetid://86391022976797",
								ImageColor3 = as,
								Size = UDim2.fromOffset(16, 16),
								LayoutOrder = -1,
								[i("MouseEnter")] = aq,
								[i("MouseLeave")] = ar,
								[i("InputEnded")] = function(aB)
									if A(aB) then
										S:set(not S:get())
									end
								end,
							}))
						end
						return
					end, d.cleanup), k("Frame")(C(v, { Name = "Checkbox", AnchorPoint = Vector2.new(1, 0.5), LayoutOrder = 1, Position = UDim2.fromScale(1, 0.5), Size = UDim2.fromOffset(24, 24), [f] = { D(u), k("UIStroke")({ [l] = T, Name = "UIStroke", Color = ao, Thickness = 2, Transparency = an }), k("ImageButton")({ Name = "Main", AnchorPoint = s, BackgroundColor3 = au, BorderSizePixel = 0, LayoutOrder = 1, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(20, 20), [f] = { D(u), k("UIStroke")({ Name = "UIStroke", Color = _, Enabled = aw }), k("ImageLabel")(C(v, { Name = "ImageLabel", Image = "rbxassetid://128735638309771", ImageColor3 = p, ImageTransparency = av, AnchorPoint = s, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(14, 14) })) }, [i("MouseEnter")] = al, [i("MouseLeave")] = am, [i("InputEnded")] = ay }) } })) } })), k("Frame")(C(v, w, { Name = "TextHolder", Size = UDim2.new(1, -80, 1, 0), [f] = { k("TextLabel")(C(w, az)), k("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), aA and k("TextLabel")(C(w, aA)) or nil }, [i("MouseEnter")] = al, [i("MouseLeave")] = am, [i("InputEnded")] = ay })) } }))
					do
						function O.AddKeybind(aB, aC)
							local aD = I .. "_Keybind"
							P:set(true)
							local aE = aC.Default or ". . ."
							local aF = {
								Value = aE,
								Toggled = O.Value,
								Mode = aC.Type or "Toggle",
								Type = "Keybind",
								Callback = aC.Callback or z,
								Changed = function(aF)
									return aF
								end,
								Clicked = function(aF)
									return aF
								end,
								SyncState = aC.SyncState or false,
							}
							O.Keybind = aF
							aF.Toggle = O.Value
							h(Q):onChange(function()
								local aG = Q:get()
								aF.Toggle = aG
								aF.Toggled = aG
							end)
							local aG, aH, aI, aJ, aK, aL = j(aF.Mode), j(), j(), j(), j(), j(false)
							local aM, aN = function()
								local aM = ai(R)
								if not aM then
									return
								end
								local aN, aO, aP = aM.AbsolutePosition, aM.AbsoluteSize, ai(aJ)
								if not aP then
									return
								end
								local aQ = ae:GetGuiInset()
								aP.Position = UDim2.fromOffset(aN.X, aN.Y + aO.Y + 10 + aQ.Y)
							end, {}
							local aO, aP = function()
								for aO, aP in ipairs(aN) do
									aP:Disconnect()
								end
								table.clear(aN)
							end, function(aO)
								table.insert(aN, aO)
								return aO
							end
							local aQ = function()
								local aQ = ai(aK)
								if not aQ then
									return
								end
								aL:set(true)
								aQ.Text = "..."
								task.spawn(function()
									task.wait(0.2)
									local aR, aS, aT = false
									aS = aP(af.InputBegan:Connect(function(aU)
										if aR then
											return
										end
										local aV
										if B(aU) and aU.KeyCode.Name ~= "Escape" then
											aV = aU.KeyCode.Name
										elseif aU.UserInputType == Enum.UserInputType.MouseButton1 then
											aV = "MouseLeft"
										elseif aU.UserInputType == Enum.UserInputType.MouseButton2 then
											aV = "MouseRight"
										else
											return
										end
										aR = true
										aT = aP(af.InputEnded:Connect(function(aW)
											if (aU.KeyCode and aW.KeyCode.Name == aV) or (aV == "MouseLeft" and aW.UserInputType == Enum.UserInputType.MouseButton1) or (aV == "MouseRight" and aW.UserInputType == Enum.UserInputType.MouseButton2) then
												aL:set(false)
												aQ.Text = aV
												aF.Value = aV
												if aF.Changed ~= z then
													b(function()
														aF.Changed(aU.KeyCode or aU.UserInputType)
													end)
												end
												aO()
											end
										end))
									end))
								end)
							end
							h(S):onChange(function()
								aO()
								if S:get() then
									local aR = ai(R)
									if not aR then
										return
									end
									aP(aR:GetPropertyChangedSignal("AbsolutePosition"):Connect(aM))
									aM()
									aP(af.InputBegan:Connect(function(aS)
										if not A(aS) then
											return
										end
										local aT = ai(aJ)
										if not aT or not S:get() then
											return
										end
										local aU, aV, aW = aT.AbsolutePosition, aT.AbsoluteSize, af:GetMouseLocation()
										if aW.X < aU.X or aW.X > aU.X + aV.X or aW.Y < aU.Y - 20 then
											S:set(false)
										end
									end))
									local aS = ai(e.Library)
									if aS and aS.Connections then
										for aT, aU in ipairs(aN) do
											table.insert(aS.Connections, aU)
										end
									end
								end
							end)
							local aR, aS, aT, aU = ah(function()
								return aG:get() == "Toggle" and W:get() or X:get()
							end, 40, 1), ah(function()
								return aG:get() == "Toggle" and V:get() or ak:get()
							end, 40, 1), ah(function()
								return aG:get() == "Hold" and W:get() or X:get()
							end, 40, 1), ah(function()
								return aG:get() == "Hold" and V:get() or ak:get()
							end, 40, 1)
							local aV, aW = C({
								Name = "TextButton",
								FontFace = M,
								Text = "Toggle",
								TextColor3 = aR,
								TextSize = 14,
								AutoButtonColor = false,
								BackgroundColor3 = aS,
								BackgroundTransparency = 0,
								BorderSizePixel = 0,
								Size = UDim2.fromOffset(106, 25),
								[f] = { D(), k("UIStroke")(C({ Name = "UIStroke", Color = _ }, x)) },
								[i("MouseButton1Click")] = function()
									aF.Mode = "Toggle"
									aG:set("Toggle")
								end,
							}), C({
								Name = "Hold",
								FontFace = M,
								Text = "Hold",
								TextColor3 = aT,
								TextSize = 14,
								AutoButtonColor = false,
								BackgroundColor3 = aU,
								BorderSizePixel = 0,
								Size = UDim2.fromOffset(106, 25),
								[f] = { D(), k("UIStroke")(C({ Name = "UIStroke", Color = _ }, x)) },
								[i("MouseButton1Click")] = function()
									aF.Mode = "Hold"
									aG:set("Hold")
								end,
							})
							O.KeybindMenu = k("Frame")({ [l] = aJ, Name = "Contexual Menu", BackgroundColor3 = ak, BorderSizePixel = 0, Size = g(function()
								return UDim2.new(0, 235, 0, aI:get())
							end), Visible = S, Parent = ai(e.Library).GUI, ZIndex = 9999, Interactable = true, Active = true, [f] = { D(), E(_), k("Frame")(C(v, w, {
								[l] = aH,
								Name = "Holder",
								Size = UDim2.fromScale(1, 0),
								[f] = { k("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), k("Frame")(C(w, { Name = "Keybind", BackgroundColor3 = ak, BorderSizePixel = 0, Size = UDim2.new(1, -10, 0, 0), [f] = { D(), E(_), k("Frame")(C(v, w, { Name = "Picker", Size = UDim2.fromScale(1, 0), [f] = { k("TextButton")(C(v, {
									[l] = aK,
									Name = "Interact",
									FontFace = M,
									Text = aE,
									TextColor3 = Y,
									TextSize = 14,
									AnchorPoint = Vector2.new(1, 0.5),
									AutomaticSize = Enum.AutomaticSize.X,
									Position = UDim2.new(1, -10, 0.5, 0),
									Size = UDim2.fromOffset(0, 25),
									[i("InputBegan")] = function(aX)
										if A(aX) then
											aQ()
										end
									end,
								})), k("Frame")(C(v, { Name = "Text", AutomaticSize = Enum.AutomaticSize.XY, [f] = { k("TextLabel")(C(v, { Name = "TextLabel", FontFace = M, Text = "Keybind", TextColor3 = X, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.XY, Position = UDim2.fromOffset(10, 0) })), k("ImageLabel")(C(v, { Name = "ImageLabel", Image = "rbxassetid://95416489678224", ImageColor3 = Y, LayoutOrder = -1, Size = UDim2.fromOffset(16, 16) })), k("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 7), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), k("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 8) }) } })) } })), k("Frame")(C(v, { Name = "Types", Size = UDim2.new(1, 0, 0, 30), [f] = { k("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 4), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), k("TextButton")(aV), k("TextButton")(aW) } })), k("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }), k("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 10), PaddingTop = UDim.new(0, 10) }) } })), k("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) }) },
								[m("AbsoluteSize")] = function()
									aI:set(ai(aH).AbsoluteSize.Y)
								end,
							})), k("ImageLabel")(C({ Name = "EShadow", Image = "rbxassetid://9313765853", ImageColor3 = Z, ImageTransparency = 0.5, ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(45, 45, 45, 45), SliceScale = 1.2, AnchorPoint = s, BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(27, 42, 53), ClipsDescendants = true, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, 75, 1, 75), ZIndex = -1 })) } })
							local aX, aY, aZ = {}, 0, 0.05
							local a_ = function(a_)
								local a0 = os.clock()
								if a0 - aY > aZ then
									table.clear(aX)
									aY = a0
								end
								if aX[a_] == nil then
									if a_ == "MouseLeft" then
										aX[a_] = af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
									elseif a_ == "MouseRight" then
										aX[a_] = af:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
									else
										aX[a_] = af:IsKeyDown(Enum.KeyCode[a_])
									end
								end
								return aX[a_]
							end
							function aF.GetState(a0)
								if af:GetFocusedTextBox() and aF.Mode ~= "Always" then
									return false
								end
								if aF.Mode == "Always" then
									return true
								elseif aF.Mode == "Hold" then
									if aF.Value == "None" then
										return false
									end
									return a_(aF.Value)
								else
									return aF.Toggled
								end
							end
							function aF.SetValue(a0, a1, a2)
								a1 = a1 or aF.Value
								a2 = a2 or aF.Mode
								local a3 = ai(aK)
								if a3 then
									a3.Text = a1 or ". . ."
								end
								aF.Value = a1
								aF.Mode = a2
							end
							function aF.OnClick(a0, a1)
								aF.Clicked = a1
							end
							function aF.OnChanged(a0, a1)
								aF.Changed = a1
								a1(aF.Value)
							end
							function aF.DoClick(a0)
								b(function()
									aF.Callback(aF.Toggled)
								end)
								if aF.Clicked ~= z then
									b(function()
										aF.Clicked(aF.Toggled)
									end)
								end
							end
							local a0 = ai(e.Library)
							if a0 then
								local a1, a2 = function(a1)
									if aL:get() or af:GetFocusedTextBox() then
										return
									end
									local a2, a3 = aF.Value, false
									if a2 == "MouseLeft" and a1.UserInputType == Enum.UserInputType.MouseButton1 then
										a3 = true
									elseif a2 == "MouseRight" and a1.UserInputType == Enum.UserInputType.MouseButton2 then
										a3 = true
									elseif B(a1) and a1.KeyCode.Name == a2 then
										a3 = true
									end
									if a3 then
										if aF.Mode == "Toggle" then
											aF.Toggled = not aF.Toggled
											if aC.SyncState then
												O:SetValue(aF.Toggled)
											end
											aF:DoClick()
										elseif aF.Mode == "Hold" then
											if aC.SyncState then
												O:SetValue(true)
											end
											aF:DoClick()
										end
									end
								end, function(a1)
									if aL:get() or af:GetFocusedTextBox() or aF.Mode ~= "Hold" then
										return
									end
									local a2, a3 = aF.Value, false
									if a2 == "MouseLeft" and a1.UserInputType == Enum.UserInputType.MouseButton1 then
										a3 = true
									elseif a2 == "MouseRight" and a1.UserInputType == Enum.UserInputType.MouseButton2 then
										a3 = true
									elseif B(a1) and a1.KeyCode.Name == a2 then
										a3 = true
									end
									if a3 then
										if aC.SyncState then
											O:SetValue(false)
										end
										aF:DoClick()
									end
								end
								if a0.Connections then
									table.insert(a0.Connections, af.InputBegan:Connect(a1))
									table.insert(a0.Connections, af.InputEnded:Connect(a2))
								end
							end
							if a0 and a0.Options then
								a0.Options[aD] = aF
							end
						end
					end
					h(Q):onChange(function()
						local aB = Q:get()
						b(function()
							O.Callback(aB)
							if O.Changed ~= z then
								O.Changed(aB)
							end
						end)
					end)
					if K ~= O.Value then
						O:SetValue(O.Value)
					end
					aj(H.Container, O.Root)
					local aB = ai(e.Library)
					if aB and aB.Options then
						aB.Options[I] = O
					end
					return O
				end
				return y
			end)()
		end,
		[50] = function()
			local aa, ab, ac = a(50)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.utils
				local af, ag = ac(ae.insertitem), ab.Parent.Parent.packages
				local ah = ac(ag.fusion)
				local ai, aj, ak, al, am, an = ah.Children, ah.Computed, ah.Value, ah.New, ac(ab.Parent.Parent.storage.theme), {}
				an.__index = an
				an.__type = "Text"
				function an.New(ao, ap)
					local aq = { Title = ap.Title ~= nil and ak(ap.Title) or nil, Description = ap.Description ~= nil and ak(ap.Description) or nil }
					aq.Root = al("Frame")({ Name = "Text", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0), [ai] = { al("Frame")({ Name = "TextHolder", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, -80, 1, 0), [ai] = { aj(function()
						if aq.Title ~= nil then
							return al("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = aq.Title:get(), TextColor3 = am.secondary_text, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0) })
						end
						return
					end, ah.cleanup), al("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), aj(function()
						if aq.Description ~= nil then
							return al("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364"), RichText = true, Text = aq.Description:get(), TextColor3 = am.tertiary_text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0), Visible = true })
						end
						return
					end, ah.cleanup) } }) } })
					function aq.SetTitle(ar, as)
						aq.Title:set(as)
					end
					function aq.SetDescription(ar, as)
						aq.Description:set(as)
					end
					af(ao.Container, aq.Root)
					return aq
				end
				return an
			end)()
		end,
		[51] = function()
			local aa, ab, ac = a(51)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.utils
				local af, ag, ah, ai = ac(ae.unwrap), ac(ae.animate), ac(ae.insertitem), ab.Parent.Parent.packages
				local aj, ak = ac(ai.fusion), ac(ai.states)
				local al, am, an, ao, ap, aq, ar, as, at, au, av, aw, ax, ay, az, aA = aj.Children, aj.Computed, aj.ForPairs, aj.Value, aj.Observer, aj.Ref, aj.New, aj.OnEvent, aj.Tween, ac(ab.Parent.Parent.storage.theme), { BackgroundTransparency = 1, BorderSizePixel = 0 }, { AutomaticSize = Enum.AutomaticSize.Y }, { Size = UDim2.fromScale(1, 1) }, { TextXAlignment = Enum.TextXAlignment.Left }, { TextXAlignment = Enum.TextXAlignment.Center }, {}
				local aB, aC, aD, aE, aF = function(aB, aC, aD)
					aC = aC or Enum.FontWeight.Regular
					aD = aD or Enum.FontStyle.Normal
					local aE = aB .. "_" .. tostring(aC) .. "_" .. tostring(aD)
					if not aA[aE] then
						aA[aE] = Font.new(aB, aC, aD)
					end
					return aA[aE]
				end, function(...)
					local aB, aC = {}, select("#", ...)
					for aD = 1, aC do
						local aE = select(aD, ...)
						if aE then
							for aF, aG in pairs(aE) do
								aB[aF] = aG
							end
						end
					end
					return aB
				end, function(aB)
					return ar("UIStroke")({ Name = "UIStroke", Color = aB })
				end, function(aB)
					return ar("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, aB or 10) })
				end, {}
				aF.__index = aF
				aF.__type = "Table"
				function aF.New(aG, aH, aI)
					local aJ, aK, aL, aM, aN, aO, aP, aQ = aB("rbxassetid://12187365364", Enum.FontWeight.Medium), aB("rbxassetid://12187365364"), { Type = "Table" }, ao(aI.Headers or {}), ao(aI.Rows or {}), ao(), ao(aI.ItemsPerPage or 10), ao(1)
					local aR, aS, aT, aU, aV, aW, aX, aY = am(function()
						return math.ceil(#af(aN) / af(aP))
					end), am(function()
						local aR, aS, aT = af(aN), af(aQ), af(aP)
						local aU = (aS - 1) * aT + 1
						local aV, aW = math.min(aU + aT - 1, #aR), {}
						for aX = aU, aV do
							aW[#aW + 1] = { OriginalIndex = aX, Data = aR[aX] }
						end
						return aW
					end), ao(nil), ao(false), ao(UDim2.fromOffset(0, 0)), ao(UDim2.fromOffset(0, 0)), (aC(av, ay, aw, { FontFace = aJ, TextSize = 15, Position = UDim2.fromOffset(0, 0), LayoutOrder = 1, Size = UDim2.fromScale(1, 0) }))
					if aI.Description then
						aY = aC(av, ay, aw, { Name = "Description", FontFace = aK, RichText = true, Text = aI.Description, TextColor3 = au.tertiary_text, TextSize = 15, TextWrapped = true, Position = UDim2.fromOffset(0, 0), LayoutOrder = 2, Size = UDim2.fromScale(1, 0), Visible = true })
					end
					local aZ = am(function()
						local aZ = af(aM)
						if #aZ == 0 then
							return UDim2.new(1, 0, 1, 0)
						end
						return UDim2.new(1 / #aZ, 0, 1, 0)
					end)
					local a_, a0, a1, a2, a3, b, c, d, e, f, g, h, i, j, k, l, m = aC(av, { Name = "Header", Size = aZ }), { Name = "UIStroke", BackgroundColor3 = au.stroke, Size = UDim2.new(0, 1, 1, 0), Position = UDim2.fromScale(1, 0) }, aC(av, ay, ax, { Name = "Title", FontFace = aJ, TextColor3 = au.secondary_text, TextSize = 14, TextTruncate = Enum.TextTruncate.AtEnd }), aC(av, { Name = "Entry", Size = aZ }), aC(av, ay, ax, { Name = "Title", FontFace = aJ, TextColor3 = au.secondary_text, TextSize = 14, TextTruncate = Enum.TextTruncate.AtEnd, ClearTextOnFocus = false }), aC(av, az, { FontFace = aJ, TextColor3 = au.secondary_text, TextSize = 14, AutoButtonColor = false, Size = UDim2.fromOffset(30, 25) }), aC(av, az, { FontFace = aJ, TextColor3 = au.secondary_text, TextSize = 14, Size = UDim2.fromOffset(30, 25) }), aC(av, aw, { Name = "TextHolder", Size = UDim2.new(1, 0, 0, 0), LayoutOrder = 1 }), aC(aX, { Name = "Title", Text = aI.Title, TextColor3 = au.secondary_text }), { Name = "UIListLayout", Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Top, HorizontalAlignment = Enum.HorizontalAlignment.Left, SortOrder = Enum.SortOrder.LayoutOrder }, { Name = "UIListLayout", Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, aC(aw, { Name = "Holder", BackgroundColor3 = au.secondary_background, BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), LayoutOrder = 2, Position = UDim2.new(0, 0, 0, 0) }), { Name = "Top", BackgroundColor3 = au.background, BorderSizePixel = 0, LayoutOrder = -1, Size = UDim2.new(1, 0, 0, 30) }, { Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder }, aC(av, aw, { Name = "Entry", Size = UDim2.new(1, 0, 0, 30) }), aC(av, { Name = "Pagination", LayoutOrder = 999, Size = UDim2.new(1, 0, 0, 35) }), aI.Description and ar("TextLabel")(aY) or nil
					local n, o, p = ar("Frame")(aC(d, { [al] = { ar("UIListLayout")(f), ar("TextLabel")(e), m } })), function(n)
						if not n then
							aU:set(false)
							return
						end
						local o, p = n.AbsolutePosition, n.AbsoluteSize
						local q, r = UDim2.fromOffset(o.X, o.Y), UDim2.fromOffset(p.X, p.Y)
						aV:set(q)
						aW:set(r)
						aU:set(true)
					end, ar("Frame")(aC(i, { [aq] = aO, [al] = { aD(au.stroke), ar("UIListLayout")(j), an(aM, function(n, o)
						return n, ar("Frame")(aC(a_, { [al] = { ar("Frame")(a0), ar("TextLabel")(aC(a1, { Text = o.Name, [al] = { aE(10) } })) } }))
					end, aj.cleanup) } }))
					local q = ar("Frame")(aC(k, { [al] = { ar("UIListLayout")({ Name = "UIListLayout", SortOrder = Enum.SortOrder.LayoutOrder }), an(aS, function(q, r)
						local s, t, u = r.Data, r.OriginalIndex, ao(q % 2 == 0 and aI.AlternateBackground or false)
						local v = am(function()
							return u:get() and au.background:get() or au.secondary_background:get()
						end)
						return q, ar("Frame")({ Name = "Row", BackgroundColor3 = v, BorderSizePixel = 0, LayoutOrder = q, Size = UDim2.new(1, 0, 0, 30), [al] = { aD(au.stroke), ar("UIListLayout")({ Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder }), an(aM, function(w, x)
							local y, z = ao(), ao()
							return w, ar("Frame")(aC(a2, { [aq] = y, [al] = { ar("Frame")(a0), ar("TextBox")(aC(a3, {
								[aq] = z,
								Text = tostring(s[x.Key] or ""),
								Interactable = x.Editable or false,
								[al] = { aE(10) },
								[as("Focused")] = function()
									if x.Editable then
										aT:set(af(y))
										o(af(y))
									end
								end,
								[as("FocusLost")] = function(A, B)
									aT:set(nil)
									aU:set(false)
									if aI.OnRowUpdate then
										local C = table.clone(s)
										C[x.Key] = af(z).Text
										aI.OnRowUpdate(t, C)
									end
								end,
							})) } }))
						end, aj.cleanup) } })
					end, aj.cleanup) } }))
					local r, s = ar("Frame")(aC(h, { [al] = { aD(au.stroke), ar("UIListLayout")({ Name = "UIListLayout", SortOrder = Enum.SortOrder.LayoutOrder }), p, q } })), ar("Frame")({ Name = "SelectionHighlight", BackgroundTransparency = 1, Size = aW, Position = aV, BorderSizePixel = 0, ZIndex = 50, Visible = aU, Parent = af(ak.Library).GUI, [al] = { ar("Frame")({ Name = "TopBorder", BackgroundColor3 = au.accent, Size = UDim2.new(1, 0, 0, 2), Position = UDim2.fromOffset(0, 0), BorderSizePixel = 0, ZIndex = 1 }), ar("Frame")({ Name = "LeftBorder", BackgroundColor3 = au.accent, Size = UDim2.new(0, 2, 1, 0), Position = UDim2.fromOffset(0, 0), BorderSizePixel = 0, ZIndex = 1 }), ar("Frame")({ Name = "RightBorder", BackgroundColor3 = au.accent, Size = UDim2.new(0, 2, 1, 0), Position = UDim2.new(1, -2, 0, 0), BorderSizePixel = 0, ZIndex = 1 }), ar("Frame")({ Name = "BottomBorder", BackgroundColor3 = au.accent, Size = UDim2.new(1, 0, 0, 2), Position = UDim2.new(0, 0, 1, -2), BorderSizePixel = 0, ZIndex = 1 }) } })
					aL.Root = ar("Frame")(aC(av, aw, { Name = "Table", Size = UDim2.fromScale(1, 0), [al] = { ar("UIListLayout")(g), n, r } }))
					local t = ap(aT):onChange(function()
						o(af(aT))
					end)
					function aL.UpdateHeaders(u, v)
						aM:set(v)
					end
					function aL.UpdateRows(u, v)
						aN:set(v)
						aQ:set(1)
					end
					function aL.SetPage(u, v)
						local w = af(aR)
						v = math.max(1, math.min(v, w))
						aQ:set(v)
						if aI.OnPageChange then
							aI.OnPageChange(v)
						end
					end
					function aL.NextPage(u)
						u:SetPage(af(aQ) + 1)
					end
					function aL.PrevPage(u)
						u:SetPage(af(aQ) - 1)
					end
					function aL.SetItemsPerPage(u, v)
						aP:set(v)
						aQ:set(1)
					end
					function aL.GetPageInfo(u)
						return { CurrentPage = af(aQ), TotalPages = af(aR), ItemsPerPage = af(aP), TotalItems = #af(aN) }
					end
					function aL.Destroy(u)
						t:disconnect()
					end
					if not aI.DisablePagination then
						local u = am(function()
							return af(aR) > 1
						end)
						local v = ar("Frame")({ Name = "PaginationHolder", Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 0, 5), AnchorPoint = Vector2.new(0, 0), BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 999, Parent = aL.Root, Visible = u })
						ar("UIListLayout")({ Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Left, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5), Parent = v })
						local w, x, y = ar("TextButton")({
							Name = "PrevButton",
							Text = "previous",
							LayoutOrder = 1,
							BackgroundColor3 = au.background,
							BorderSizePixel = 0,
							Size = UDim2.fromOffset(80, 25),
							FontFace = aJ,
							TextColor3 = au.tertiary_text,
							TextSize = 14,
							Parent = v,
							[al] = { ar("UIStroke")({ Color = au.stroke, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }) },
							[as("MouseButton1Click")] = function()
								if af(aQ) > 1 then
									aL:SetPage(af(aQ) - 1)
								end
							end,
						}), ar("TextLabel")({ Name = "PageInfo", LayoutOrder = 2, Size = UDim2.fromOffset(50, 25), BackgroundColor3 = au.background, BorderSizePixel = 0, FontFace = aJ, TextSize = 14, Text = am(function()
							return af(aQ) .. "/" .. af(aR)
						end), TextColor3 = au.accent, Parent = v, [al] = { ar("UIStroke")({ Color = au.stroke, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }) } }), ar("TextButton")({
							Name = "NextButton",
							Text = "next",
							LayoutOrder = 3,
							BackgroundColor3 = au.background,
							BorderSizePixel = 0,
							Size = UDim2.fromOffset(80, 25),
							FontFace = aJ,
							TextColor3 = au.tertiary_text,
							TextSize = 14,
							Parent = v,
							[al] = { ar("UIStroke")({ Color = au.stroke, Thickness = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }) },
							[as("MouseButton1Click")] = function()
								if af(aQ) < af(aR) then
									aL:SetPage(af(aQ) + 1)
								end
							end,
						})
					end
					ah(aG.Container, aL.Root)
					return aL
				end
				return aF
			end)()
		end,
		[52] = function()
			local aa, ab, ac = a(52)
			local ad
			return (function(...)
				local ae, af, ag = game:GetService("UserInputService"), game:GetService("RunService"), ab.Parent.Parent.utils
				local ah, ai, aj, ak, al = ac(ag.animate), ac(ag.unwrap), ac(ag.insertitem), ac(ag.safecallback), ab.Parent.Parent.packages
				local am, an = ac(al.fusion), ac(al.states)
				local ao, ap, aq, ar, as, at, au, av, aw = am.Children, am.Computed, am.Observer, am.OnEvent, am.Value, am.Ref, am.New, ac(ab.Parent.Parent.storage.theme), {}
				aw.__index = aw
				aw.__type = "Slider"
				local ax = function(ax, ay)
					if ax == nil then
						return 0
					end
					local az = 10 ^ (ay or 0)
					return math.floor(ax * az + 0.5) / az
				end
				function aw.New(ay, az, aA)
					local aB, aC, aD, aE, aF = aA.Default or aA.Min, aA.Min or 0, aA.Max or 100, aA.Rounding or 0, aA.Suffix or ""
					if aC == nil then
						aC = 0
					end
					if aD == nil then
						aD = 100
					end
					if aC >= aD then
						aD = aC + 1
					end
					aB = math.clamp(aB or aC, aC, aD)
					local aG, aH, aI, aJ, aK, aL, aM, aN, aO, aP, aQ, aR = { Title = aA.Title, Suffix = aF, Default = aB, Min = aC, Max = aD, Value = aB, Rounding = aE, Type = "Slider", Callback = aA.Callback or function() end, Changed = function(aG) end }, aD - aC, as(), as(false), as(false), as(false), as(ax(aB, aE)), as(), as(), as(false), 0.1
					local aS = function(aS)
						if aH <= 0 then
							return 0
						end
						return (aS - aC) / aH
					end
					local aT = as(UDim2.fromScale(aS(aB), 1))
					local aU, aV = function(aU)
						if aU == nil then
							aU = aC
						end
						aU = ax(aU, aE)
						aU = math.clamp(aU, aC, aD)
						if aM:get() ~= aU then
							aM:set(aU)
							aG.Value = aU
							aT:set(UDim2.fromScale(aS(aU), 1))
						end
						return aU
					end, function(aU)
						if aR then
							task.cancel(aR)
							aR = nil
						end
						ak(function()
							aG.Callback(aU)
							aG.Changed(aU)
						end)
					end
					local aW, aX = function(aW)
						local aX = aU(aW)
						if aR then
							task.cancel(aR)
						end
						aR = task.delay(aQ, function()
							aR = nil
							aV(aX)
						end)
					end, function(aW)
						if aW == nil then
							return
						end
						aW = ax(aW, aE)
						if aM:get() ~= aW then
							aM:set(aW)
							aG.Value = aW
							local aX = math.clamp(aW, aC, aD)
							aT:set(UDim2.fromScale(aS(aX), 1))
							aV(aW)
						end
					end
					local aY, aZ, a_ = function(aY)
						if not aY then
							return
						end
						local aZ
						aZ = tonumber(aY)
						if not aZ and aF ~= "" then
							local a_ = string.gsub(aY, aF .. "$", "")
							aZ = tonumber(a_)
						end
						if aZ then
							aX(aZ)
						end
					end, 0, 1.6666666666666665E-2
					local a0, a1 = function(a0)
						local a1 = tick()
						if a1 - aZ < a_ then
							return
						end
						aZ = a1
						local a2 = aI:get()
						if not a2 then
							return
						end
						local a3, b = a2.AbsolutePosition.X, a2.AbsoluteSize.X
						if b <= 0 then
							return
						end
						local c = a0.X
						local d = c - a3
						local e = math.clamp(d / b, 0, 1)
						local f = aC + (e * aH)
						aW(f)
					end
					local a2, a3, b, c, d = function()
						if aL:get() or aP:get() then
							return
						end
						aJ:set(true)
						if a1 then
							a1:Disconnect()
							a1 = nil
						end
						a0(ae:GetMouseLocation())
						a1 = af.RenderStepped:Connect(function()
							a0(ae:GetMouseLocation())
						end)
					end, function()
						aJ:set(false)
						if a1 then
							a1:Disconnect()
							a1 = nil
						end
						if aR then
							task.cancel(aR)
							aR = nil
							local a2 = aM:get()
							aV(a2)
						end
					end, "%." .. aE .. "f", ap(function()
						return aK:get() and UDim2.fromOffset(15, 15) or UDim2.fromOffset(12, 12)
					end), ap(function()
						return aJ:get() and av.text:get() or av.secondary_text:get()
					end)
					local e, f = ap(function()
						local e = aM:get()
						local f = string.format(b, e)
						return f .. aF
					end), {}
					aG.Root = au("Frame")({
						Name = "Slider",
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 0),
						[ao] = { au("UIListLayout")({ Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }), au("Frame")({
							[at] = aI,
							Name = "Bar",
							BackgroundColor3 = av.secondary_background,
							BorderSizePixel = 0,
							LayoutOrder = 2,
							Position = UDim2.fromScale(0, 0.6),
							Size = UDim2.new(1, 0, 0, 5),
							[ao] = { au("UIStroke")({ Color = av.stroke }), au("UICorner")({ CornerRadius = UDim.new(0, 2) }), au("Frame")({ Name = "Progress", AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = av.accent, BorderSizePixel = 0, Position = UDim2.fromScale(0, 0.5), Size = ah(function()
								return aT:get()
							end, 40, 1), [ao] = { au("UIStroke")({ Color = av.stroke }), au("UICorner")({ CornerRadius = UDim.new(0, 2) }), au("Frame")({
								Name = "Drag",
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = av.text,
								BorderSizePixel = 0,
								Position = UDim2.fromScale(1, 0.5),
								Size = ah(function()
									return c:get()
								end, 40, 1),
								[ao] = { au("UICorner")({ CornerRadius = UDim.new(1, 0) }) },
								[ar("MouseEnter")] = function()
									aK:set(true)
								end,
								[ar("MouseLeave")] = function()
									aK:set(false)
								end,
							}) } }) },
							[ar("InputBegan")] = function(g)
								if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
									a2()
								end
							end,
						}), au("Frame")({ Name = "TextHolder", AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 1, Size = UDim2.fromScale(1, 0), [ao] = { au("Frame")({ Name = "Text", AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [ao] = { au("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = aA.Title, TextColor3 = ah(function()
							return d:get()
						end, 40, 1), TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0) }), ap(function()
							if aA.Description then
								return au("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364"), RichText = true, Text = aA.Description, TextColor3 = av.tertiary_text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.new(1, -50, 0, 0) })
							end
							return nil
						end, am.cleanup), au("UIListLayout")({ Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }) } }), ap(function()
							if aL:get() then
								return au("TextBox")({
									[at] = aN,
									Name = "ValueInput",
									FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
									Text = tostring(aM:get()),
									TextColor3 = av.text,
									TextSize = 15,
									TextXAlignment = Enum.TextXAlignment.Right,
									AnchorPoint = Vector2.new(1, 0.5),
									AutomaticSize = Enum.AutomaticSize.XY,
									BackgroundTransparency = 0.9,
									BackgroundColor3 = av.secondary_background,
									BorderSizePixel = 0,
									Position = UDim2.fromScale(1, 0.5),
									ClearTextOnFocus = false,
									[ar("FocusLost")] = function(g)
										local h = aN:get()
										if h and g then
											aY(h.Text)
										end
										task.delay(0.05, function()
											aL:set(false)
											aP:set(false)
										end)
									end,
									[ar("Focused")] = function()
										local g = aN:get()
										if g then
											g.CursorPosition = #g.Text + 1
											g.SelectionStart = 1
										end
									end,
									[ar("InputBegan")] = function(g)
										if g.KeyCode == Enum.KeyCode.Escape then
											aL:set(false)
											aP:set(false)
										end
									end,
								})
							else
								return au("TextButton")({
									[at] = aO,
									Name = "Value",
									FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
									Text = e,
									TextColor3 = ah(function()
										return d:get()
									end, 40, 1),
									TextSize = 15,
									TextXAlignment = Enum.TextXAlignment.Right,
									AnchorPoint = Vector2.new(1, 0.5),
									AutomaticSize = Enum.AutomaticSize.XY,
									BackgroundTransparency = 0.9,
									BackgroundColor3 = av.secondary_background,
									BorderSizePixel = 0,
									Position = UDim2.fromScale(1, 0.5),
									AutoButtonColor = false,
									[ar("Activated")] = function()
										aP:set(true)
										aL:set(true)
										task.spawn(function()
											af.Heartbeat:Wait()
											local g = aN:get()
											if g then
												g:CaptureFocus()
											end
										end)
									end,
								})
							end
						end, am.cleanup) } }) },
						[ar("InputBegan")] = function(g)
							if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
								a2()
							end
						end,
						[ar("InputEnded")] = function(g)
							if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
								a3()
							end
						end,
					})
					table.insert(
						f,
						ae.InputEnded:Connect(function(g)
							if (g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch) and aJ:get() then
								a3()
							end
						end)
					)
					table.insert(
						f,
						ae.WindowFocusReleased:Connect(function()
							if aL:get() then
								aL:set(false)
								aP:set(false)
							end
						end)
					)
					table.insert(
						f,
						ae.InputBegan:Connect(function(g, h)
							if h then
								return
							end
							if g.UserInputType == Enum.UserInputType.MouseButton1 and aL:get() then
								local i, j = ae:GetMouseLocation(), aN:get()
								if j then
									local k, l = j.AbsolutePosition, j.AbsoluteSize
									if i.X < k.X or i.Y < k.Y or i.X > k.X + l.X or i.Y > k.Y + l.Y then
										aL:set(false)
										aP:set(false)
									end
								end
							end
						end)
					)
					for g, h in ipairs(f) do
						table.insert(ai(an.Library).Connections, h)
					end
					ak(function()
						aG.Callback(aM:get())
					end)
					function aG.OnChanged(g, h)
						aG.Changed = h
						h(aM:get())
					end
					function aG.SetValue(g, h)
						local i = aU(h)
						aV(i)
					end
					function aG.UpdateMin(g, h)
						aG.Min = h
						aH = aG.Max - aG.Min
						local i = aU(aM:get())
						aV(i)
					end
					function aG.UpdateMax(g, h)
						aG.Max = h
						aH = aG.Max - aG.Min
						local i = aU(aM:get())
						aV(i)
					end
					aj(ay.Container, aG.Root)
					ai(an.Library).Options[az] = aG
					return aG
				end
				return aw
			end)()
		end,
		[53] = function()
			local aa, ab, ac = a(53)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.utils
				local af, ag = ac(ae.insertitem), ab.Parent.Parent.packages
				local ah = ac(ag.fusion)
				local ai, aj, ak, al = ah.Children, ah.New, ac(ab.Parent.Parent.storage.theme), {}
				al.__index = al
				al.__type = "Seperator"
				function al.New(am)
					local an = {}
					an.Root = aj("Frame")({ Name = "Seperator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Interactable = false, Size = UDim2.new(1, 0, 0, 0), [ai] = { aj("Frame")({ Name = "Frame", AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = ak.stroke, BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0, 0.5), Size = UDim2.new(1, 0, 0, 0), [ai] = { aj("UIStroke")({ Name = "UIStroke", Color = ak.stroke }) } }) } })
					af(am.Container, an.Root)
					return an
				end
				return al
			end)()
		end,
		[54] = function()
			local aa, ab, ac = a(54)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.utils
				local af, ag, ah, ai, aj, ak = ac(ae.animate), ac(ae.color3), ac(ae.unwrap), ac(ae.insertitem), ac(ae.safecallback), ab.Parent.Parent.packages
				local al, am = ac(ak.fusion), ac(ak.states)
				local an, ao, ap, aq, ar, as, at, au, av, aw, ax, ay = al.Children, al.Computed, al.ForPairs, al.Observer, al.OnChange, al.OnEvent, al.Value, al.Tween, al.Ref, al.New, ac(ab.Parent.Parent.storage.theme), {}
				ay.__index = ay
				ay.__type = "Radio"
				function ay.New(az, aA, aB)
					local aC = { Title = aB.Title, Options = aB.Options, Default = aB.Default or aB.Options[1], Callback = aB.Callback or function() end, Changed = function() end }
					local aD = at(aC.Default)
					aC.Root = aw("Frame")({ Name = "RadioGroup", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [an] = { aw("TextLabel")({ Name = "Title", Text = aC.Title, FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), TextColor3 = ax.text, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0) }), aw("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }), ap(aC.Options, function(aE, aF)
						return aE, aw("TextButton")({
							Name = "RadioButton",
							Text = aF,
							FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
							TextColor3 = af(function()
								if ah(aD) == aF then
									return ax.text:get()
								end
								return ax.secondary_text:get()
							end, 40, 1),
							TextSize = 15,
							TextXAlignment = Enum.TextXAlignment.Left,
							AutomaticSize = Enum.AutomaticSize.Y,
							BackgroundColor3 = ax.background,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.fromScale(1, 0),
							[an] = { aw("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }), aw("UIStroke")({ Name = "UIStroke", Color = ax.stroke, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }), aw("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 11) }), aw("ImageLabel")({ Name = "RadioIcon", Image = "rbxassetid://128735638309771", ImageColor3 = af(function()
								if ah(aD) == aF then
									return ax.accent:get()
								end
								return ax.background:get()
							end, 40, 1), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromOffset(20, 20), Position = UDim2.fromScale(0, 0.5), AnchorPoint = Vector2.new(0, 0.5) }) },
							[as("Activated")] = function()
								aD:set(aF)
								aj(function()
									aC.Callback(aF)
									aC.Changed(aF)
								end)
							end,
						})
					end) } })
					function aC.OnChanged(aE, aF)
						aC.Changed = aF
						aF(ah(aD))
					end
					function aC.SetValue(aE, aF)
						aD:set(aF)
					end
					ai(az.Container, aC.Root)
					ah(am.Library).Options[aA] = aC
					return aC
				end
				return ay
			end)()
		end,
		[55] = function()
			local aa, ab, ac = a(55)
			local ad
			return (function(...)
				local ae, af = game:GetService("UserInputService"), ab.Parent.Parent.utils
				local ag, ah, ai, aj, ak, al = ac(af.animate), ac(af.color3), ac(af.unwrap), ac(af.insertitem), ac(af.safecallback), ab.Parent.Parent.packages
				local am, an = ac(al.fusion), ac(al.states)
				local ao, ap, aq, ar, as, at, au, av, aw, ax, ay, az = am.Children, am.Computed, am.ForPairs, am.Observer, am.OnChange, am.OnEvent, am.Value, am.Tween, am.Ref, am.New, ac(ab.Parent.Parent.storage.theme), {}
				az.__index = az
				az.__type = "Keybind"
				function az.New(aA, aB, aC)
					local aD, aE = { Value = aC.Default or "None", Toggled = false, Mode = aC.Mode or "Toggle", Type = "Keybind", Callback = aC.Callback or function(aD) end, Changed = function(aD) end, Clicked = function(aD) end }, au(false)
					local aF, aG, aH, aI, aJ = au(aD.Value), au(), function(aF, aG)
						if aG == "None" then
							return false
						elseif aG == "MouseLeft" then
							return aF.UserInputType == Enum.UserInputType.MouseButton1
						elseif aG == "MouseRight" then
							return aF.UserInputType == Enum.UserInputType.MouseButton2
						elseif aF.UserInputType == Enum.UserInputType.Keyboard then
							return aF.KeyCode.Name == aG
						end
						return false
					end, ap(function()
						return aE:get() and ay.text:get() or ay.secondary_text:get()
					end), aC.Description and ax("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364"), RichText = true, Text = aC.Description, TextColor3 = ay.tertiary_text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0), Visible = true })
					local aK = ax("TextButton")({
						[aw] = aG,
						Name = "Interact",
						FontFace = Font.new("rbxassetid://12187365364"),
						Text = aF:get(),
						TextColor3 = ay.secondary_text,
						TextSize = 15,
						TextXAlignment = Enum.TextXAlignment.Left,
						Active = false,
						AnchorPoint = Vector2.new(1, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = ay.background,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						ClipsDescendants = true,
						LayoutOrder = 1,
						Position = UDim2.fromScale(1, 0.5),
						Selectable = false,
						Size = UDim2.fromOffset(0, 25),
						[ao] = { ax("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }), ax("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = ay.stroke }), ax("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 11), PaddingRight = UDim.new(0, 10) }) },
						[at("InputBegan")] = function(aK)
							if aK.UserInputType == Enum.UserInputType.MouseButton1 or aK.UserInputType == Enum.UserInputType.Touch then
								local aL = ai(aG)
								if not aL then
									return
								end
								aE:set(true)
								aL.Text = "..."
								task.wait(0.2)
								local aM, aN
								aM = ae.InputBegan:Connect(function(aO)
									local aP
									if aO.UserInputType == Enum.UserInputType.Keyboard and aO.KeyCode == Enum.KeyCode.Escape then
										aE:set(false)
										aL.Text = "None"
										aF:set("None")
										aD.Value = "None"
										ak(function()
											aD.Changed("None")
										end)
										if aM then
											aM:Disconnect()
											aM = nil
										end
										if aN then
											aN:Disconnect()
											aN = nil
										end
										return
									end
									if aO.UserInputType == Enum.UserInputType.Keyboard then
										aP = aO.KeyCode.Name
									elseif aO.UserInputType == Enum.UserInputType.MouseButton1 then
										aP = "MouseLeft"
									elseif aO.UserInputType == Enum.UserInputType.MouseButton2 then
										aP = "MouseRight"
									else
										return
									end
									aN = ae.InputEnded:Connect(function(aQ)
										if aH(aQ, aP) then
											aE:set(false)
											aL.Text = aP
											aF:set(aP)
											aD.Value = aP
											ak(function()
												aD.Changed(aO.KeyCode or aO.UserInputType)
											end)
											if aM then
												aM:Disconnect()
												aM = nil
											end
											if aN then
												aN:Disconnect()
												aN = nil
											end
										end
									end)
								end)
								ar(aE):onChange(function()
									if not aE:get() and aM then
										aM:Disconnect()
										aM = nil
										if aN then
											aN:Disconnect()
											aN = nil
										end
									end
								end)
							end
						end,
					})
					ar(aF):onChange(function()
						local aL = ai(aG)
						if aL then
							aL.Text = aF:get()
						end
					end)
					aD.Root = ax("Frame")({ Name = "Keybind", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [ao] = { ax("Frame")({ Name = "Addons", AnchorPoint = Vector2.new(1, 0), AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(1, 0), Size = UDim2.fromScale(0, 1), [ao] = { ax("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 15), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), aK } }), ax("Frame")({ Name = "TextHolder", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, -80, 1, 0), [ao] = { ax("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = aC.Title, TextColor3 = av(aI, TweenInfo.new(0.2)), TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0) }), ax("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), aJ } }) } })
					function aD.GetState(aL)
						if ae:GetFocusedTextBox() and aD.Mode ~= "Always" then
							return false
						end
						if aD.Mode == "Always" then
							return true
						end
						if aD.Mode == "Hold" then
							local aM = aD.Value
							if aM == "None" then
								return false
							end
							if aM == "MouseLeft" then
								return ae:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
							elseif aM == "MouseRight" then
								return ae:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
							else
								return ae:IsKeyDown(Enum.KeyCode[aM])
							end
						end
						return aD.Toggled
					end
					function aD.SetValue(aL, aM, aN)
						aM = aM or aD.Value
						aN = aN or aD.Mode
						aF:set(aM)
						aD.Value = aM
						aD.Mode = aN
					end
					function aD.OnClick(aL, aM)
						aD.Clicked = aM
					end
					function aD.OnChanged(aL, aM)
						aD.Changed = aM
						aM(aD.Value)
					end
					function aD.DoClick(aL)
						local aM = aD.Toggled
						ak(function()
							aD.Callback(aM)
						end)
						ak(function()
							aD.Clicked(aM)
						end)
					end
					function aD.Destroy(aL)
						aD.Root:Destroy()
						ai(an.Library).Options[aB] = nil
					end
					local aL = ae.InputBegan:Connect(function(aL)
						if aE:get() or ae:GetFocusedTextBox() then
							return
						end
						if aD.Mode ~= "Toggle" then
							return
						end
						local aM = aD.Value
						if aH(aL, aM) then
							aD.Toggled = not aD.Toggled
							aD:DoClick()
						end
					end)
					table.insert(ai(an.Library).Connections, aL)
					aj(aA.Container, aD.Root)
					ai(an.Library).Options[aB] = aD
					return aD
				end
				return az
			end)()
		end,
		[56] = function()
			local aa, ab, ac = a(56)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.utils
				local af, ag, ah, ai, aj = ac(ae.animate), ac(ae.unwrap), ac(ae.insertitem), ac(ae.safecallback), ab.Parent.Parent.packages
				local ak, al, am = ac(aj.fusion), ac(aj.states), ac(aj.audio)
				local an, ao, ap, aq, ar, as, at, au, av, aw = ak.Children, ak.Computed, ak.OnEvent, ak.Value, ak.Ref, ak.New, ak.cleanup, ak.Spring, ac(ab.Parent.Parent.storage.theme), {}
				aw.__index = aw
				aw.__type = "Input"
				function aw.New(ax, ay, az)
					local aA, aB, aC, aD, aE = aq(az.Default or ""), aq(false), aq(), { Value = az.Default or "", Numeric = az.Numeric or false, Finished = az.Finished or false, Callback = az.Callback or function() end, Placeholder = az.Placeholder or "...", Type = "Input", Changed = function(aA) end }, aq(Color3.fromRGB(175, 175, 175))
					local aF, aG, aH, aI = ao(function()
						local aF = aB:get()
						aE:set(aF and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(175, 175, 175))
						return nil
					end), au(aE, 60, 1.2), ao(function()
						if not az.Description then
							return nil
						end
						local aF = (type(av.tertiary_text) == "table" and av.tertiary_text.get and av.tertiary_text:get()) or Color3.fromRGB(125, 125, 125)
						return as("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364"), RichText = true, Text = az.Description, TextColor3 = aF, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0) }, at)
					end, at), ao(function()
						return aB:get() and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(175, 175, 175)
					end)
					function aD.SetValue(aJ, aK)
						if aD.Numeric and aK:len() > 0 and not tonumber(aK) then
							aK = aD.Value
						end
						aD.Value = aD.Numeric and tonumber(aK) or aK
						aA:set(aK)
						ai(function()
							aD.Callback(aD.Value)
							aD.Changed(aD.Value)
						end)
					end
					aD.Root = as("Frame")({ Name = "Textbox", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [an] = { as("Frame")({ Name = "Addons", AnchorPoint = Vector2.new(1, 0), AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(1, 0), Size = UDim2.fromScale(0, 1), [an] = { as("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 15), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), as("Frame")({ Name = "Holder", AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = av.background, BackgroundTransparency = 0, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, ClipsDescendants = true, Size = UDim2.fromScale(0, 1), [an] = { as("TextBox")({
						[ar] = aC,
						Name = "Input",
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
						PlaceholderText = aD.Placeholder,
						Text = ao(function()
							return aA:get()
						end),
						TextColor3 = (type(av.secondary_text) == "table" and av.secondary_text.get and av.secondary_text:get()) or Color3.fromRGB(175, 175, 175),
						TextSize = 14,
						AutomaticSize = Enum.AutomaticSize.X,
						TextXAlignment = Enum.TextXAlignment.Left,
						BackgroundColor3 = Color3.fromRGB(0, 0, 0),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						ClipsDescendants = true,
						LayoutOrder = 1,
						Size = UDim2.new(0, 0, 0, 25),
						ZIndex = 2,
						[an] = { as("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 10) }), as("UISizeConstraint")({ Name = "UISizeConstraint", MaxSize = Vector2.new(200, math.huge) }) },
						[ap("Focused")] = function()
							aB:set(true)
						end,
						[ap("FocusLost")] = function(aJ)
							aB:set(false)
							if aD.Finished and aJ then
								aD:SetValue(ag(aC).Text)
							end
						end,
					}), as("UIListLayout")({ Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), as("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = av.stroke }), as("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }), as("UIPadding")({ Name = "UIPadding", PaddingRight = UDim.new(0, 10) }) } }) } }), as("Frame")({ Name = "TextHolder", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, -80, 1, 0), [an] = { as("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = az.Title, TextColor3 = aI, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0), TextTruncate = Enum.TextTruncate.None }), as("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), aH } }) } })
					local aJ = {}
					if not aD.Finished then
						local aK = ag(aC):GetPropertyChangedSignal("Text"):Connect(function()
							local aK = ag(aC)
							local aL, aM = aK.Text, aD.Value
							if #aL > #aM then
								am:Play("Key")
							elseif #aL < #aM and aK:IsFocused() then
								task.delay(0, function()
									am:Play("Backspace")
								end)
							end
							aD:SetValue(aL)
						end)
						table.insert(aJ, aK)
						table.insert(ag(al.Library).Connections, aK)
					end
					function aD.OnChanged(aK, aL)
						aD.Changed = aL
						aL(aD.Value)
						return aK
					end
					function aD.Destroy(aK)
						for aL, aM in ipairs(aJ) do
							aM:Disconnect()
						end
						aD.Root:Destroy()
						ag(al.Library).Options[ay] = nil
					end
					ah(ax.Container, aD.Root)
					ag(al.Library).Options[ay] = aD
					return aD
				end
				return aw
			end)()
		end,
		[57] = function()
			local aa, ab, ac = a(57)
			local ad
			return (function(...)
				local ae, af = game:GetService("UserInputService"), ab.Parent.Parent.utils
				local ag, ah, ai, aj, ak = ac(af.animate), ac(af.unwrap), ac(af.insertitem), ac(af.safecallback), ab.Parent.Parent.packages
				local al, am = ac(ak.fusion), ac(ak.states)
				local an, ao, ap, aq, ar, as, at, au, av, aw, ax = al.Children, al.Computed, al.Observer, al.OnEvent, al.Value, al.Ref, al.New, ac(ab.Parent.Parent.storage.theme), game:GetService("GuiService"), game:GetService("RunService"), {}
				ax.__index = ax
				ax.__type = "Dropdown"
				function ax.New(ay, az, aA)
					local aB, aC, aD, aE, aF, aG, aH = { Values = aA.Values or {}, Value = aA.Default, Multi = aA.Multi, Buttons = {}, Opened = ar(false), Callback = aA.Callback or function(aB) end, Type = "Dropdown", Changed = function(aB) end, AllowNull = aA.AllowNull or false }, ar(), ar(), ar(), ar(), {}
					local aI, aJ, aK, aL, aM = function(aI)
						if aI.UserInputType == Enum.UserInputType.MouseButton1 or aI.UserInputType == Enum.UserInputType.Touch then
							aB.Opened:set(not aB.Opened:get())
						end
					end, function()
						local aI, aJ, aK = ah(aC), ah(aD), ah(aE)
						if aI and aJ and aK then
							local aL, aM, aN = aI.AbsolutePosition, aI.AbsoluteSize, av:GetGuiInset()
							aJ.Position = UDim2.fromOffset(aL.X, aL.Y + aM.Y + 5 + aN.Y)
							local aO = aK.AbsoluteContentSize.Y
							aJ.CanvasSize = UDim2.fromOffset(0, aO)
						end
					end, function(aI, aJ)
						if aJ then
							return
						end
						if aI.UserInputType == Enum.UserInputType.MouseButton1 or aI.UserInputType == Enum.UserInputType.Touch then
							local aK, aL, aM, aN = ae:GetMouseLocation(), ah(aC), ah(aD), false
							if aL then
								local aO, aP = aL.AbsolutePosition, aL.AbsoluteSize
								if aK.X >= aO.X and aK.X <= aO.X + aP.X and aK.Y >= aO.Y and aK.Y <= aO.Y + aP.Y then
									aN = true
								end
							end
							local aO = false
							if aM and aM.Visible then
								local aP, aQ = aM.AbsolutePosition, aM.AbsoluteSize
								if aK.X >= aP.X and aK.X <= aP.X + aQ.X and aK.Y >= aP.Y and aK.Y <= aP.Y + aQ.Y then
									aO = true
								end
							end
							if not aN and not aO then
								aB.Opened:set(false)
							end
						end
					end, (ap(aB.Opened))
					aL:onChange(function()
						aJ()
						if aM then
							aM:Disconnect()
							aM = nil
						end
						if aH then
							aH:Disconnect()
							aH = nil
						end
						if aB.Opened:get() then
							aM = aw.RenderStepped:Connect(aJ)
							task.defer(function()
								if aB.Opened:get() then
									aH = ae.InputBegan:Connect(aK)
								end
							end)
						end
					end)
					table.insert(aG, aL)
					local aN
					local aO = function()
						if aN then
							aN:Disconnect()
						end
						local aO = ah(aE)
						if aO then
							aN = aO:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
								aJ()
							end)
							table.insert(aG, aN)
						end
					end
					aB.Holder = at("ScrollingFrame")({ [as] = aD, Name = "Frame", AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(), ScrollBarThickness = 0, BackgroundColor3 = au.background, BackgroundTransparency = ag(function()
						return aB.Opened:get() and 0 or 1
					end, 15, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Selectable = false, Size = ag(function()
						if not aB.Opened:get() then
							return UDim2.fromOffset(200, 0)
						end
						local aP = ah(aE)
						if not aP then
							return UDim2.fromOffset(200, 0)
						end
						return UDim2.fromOffset(200, #aB.Values > 10 and 310 or (aP.AbsoluteContentSize.Y + 10))
					end, 35, 1), Visible = true, Parent = ah(am.Library).GUI, ZIndex = 1000, Active = true, [an] = { at("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }), at("UIStroke")({ Name = "UIStroke", Color = au.stroke, Transparency = ag(function()
						return aB.Opened:get() and 0 or 1
					end, 15, 1) }), at("UIListLayout")({ [as] = aE, Name = "UIListLayout", Padding = UDim.new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder }), at("UIPadding")({ Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) }), at("UISizeConstraint")({ Name = "UISizeConstraint", MinSize = Vector2.new(200, 0) }) } })
					aB.Root = at("Frame")({ Name = "Dropdown", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [an] = { at("Frame")({ Name = "Addons", AnchorPoint = Vector2.new(1, 0), AutomaticSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(1, 0), Size = UDim2.fromScale(0, 1), [an] = { at("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 15), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }), at("TextButton")({ [as] = aC, Name = "Interact", FontFace = Font.new("rbxassetid://12187365364"), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Active = true, AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = au.background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, ClipsDescendants = true, LayoutOrder = 1, Position = UDim2.fromScale(1, 0.5), Selectable = false, Size = UDim2.fromOffset(200, 30), ZIndex = 1001, [an] = { at("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }), at("ImageLabel")({ Name = "Icon", Image = "rbxassetid://88197529571865", AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Interactable = false, LayoutOrder = 1, Position = UDim2.new(1, -5, 0.5, 0), Size = UDim2.fromOffset(14, 14), ImageColor3 = ag(function()
						return aB.Opened:get() and au.accent:get() or au.text:get()
					end, 25, 1) }), at("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = au.stroke }), at("TextLabel")({ [as] = aF, Name = "Values", FontFace = Font.new("rbxassetid://12187365364"), Text = "--", TextColor3 = ag(function()
						return aB.Opened:get() and au.text:get() or au.secondary_text:get()
					end, 40, 1), TextSize = 14, TextTruncate = Enum.TextTruncate.AtEnd, TextXAlignment = Enum.TextXAlignment.Left, AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, ClipsDescendants = true, Position = UDim2.new(0, 10, 0.5, 0), Size = UDim2.new(1, -30, 1, 0) }) }, [aq("InputBegan")] = aI }) } }), at("Frame")({ Name = "TextHolder", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, -190, 1, 0), [an] = { at("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = aA.Title, TextColor3 = ag(function()
						return aB.Opened:get() and au.text:get() or au.secondary_text:get()
					end, 40, 1), TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0) }), at("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), ao(function()
						if aA.Description then
							return at("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364"), RichText = true, Text = aA.Description, TextColor3 = au.tertiary_text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0), Visible = true })
						end
						return
					end, al.cleanup) } }) } })
					function aB.SetValues(aP, aQ)
						if aQ then
							aB.Values = aQ
						end
						aB:BuildDropdownList()
					end
					function aB.OnChanged(aP, aQ)
						aB.Changed = aQ
						aQ(aB.Value)
					end
					function aB.SetValue(aP, aQ)
						if aB.Multi then
							local aR = {}
							for aS, aT in next, aQ do
								if table.find(aB.Values, aS) then
									aR[aS] = true
								end
							end
							aB.Value = aR
						else
							if not aQ then
								aB.Value = nil
							elseif table.find(aB.Values, aQ) then
								aB.Value = aQ
							end
						end
						aB:BuildDropdownList()
						aB:Display()
						aj(function()
							aB.Callback(aB.Value)
							aB.Changed(aB.Value)
						end)
					end
					function aB.GetActiveValues(aP)
						if aB.Multi then
							local aQ = {}
							for aR, aS in next, aB.Value do
								table.insert(aQ, aR)
							end
							return aQ
						else
							return aB.Value and 1 or 0
						end
					end
					function aB.Display(aP)
						local aQ, aR = aB.Values, ""
						if aB.Multi then
							for aS, aT in next, aQ do
								if aB.Value[aT] then
									aR = aR .. aT .. ", "
								end
							end
							aR = aR:sub(1, #aR - 2)
						else
							aR = aB.Value or ""
						end
						ah(aF).Text = (aR == "" and "--" or aR)
					end
					function aB.BuildDropdownList(aP)
						local aQ, aR = aB.Values, ah(aD)
						for aS, aT in next, aR:GetChildren() do
							if aT:IsA("TextButton") then
								aT:Destroy()
							end
						end
						aB.Buttons = {}
						for aS, aT in next, aQ do
							local aU, aV = {}, ar()
							if aB.Multi then
								aV:set(aB.Value[aT])
							else
								aV:set(aB.Value == aT)
							end
							function aU.UpdateButton(aW)
								if aB.Multi then
									aV:set(aB.Value[aT])
								else
									aV:set(aB.Value == aT)
								end
							end
							local aW = ar(false)
							local aX = at("TextButton")({
								Name = "OptionButton",
								FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
								Text = aT,
								TextColor3 = ag(function()
									return aV:get() and au.accent:get() or au.secondary_text:get()
								end, 45, 1),
								TextTransparency = ag(function()
									return aB.Opened:get() and 0 or 1
								end, 15, 1),
								TextSize = 13,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundTransparency = ag(function()
									if aV:get() then
										return 0.85
									elseif aW:get() then
										return 0.9
									else
										return 1
									end
								end, 25, 1),
								BackgroundColor3 = au.accent,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Selectable = false,
								Size = UDim2.new(1, -5, 0, 25),
								Parent = aD,
								ZIndex = 1000,
								Active = true,
								[an] = { at("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }), at("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5) }) },
								[aq("MouseEnter")] = function()
									aW:set(true)
								end,
								[aq("MouseLeave")] = function()
									aW:set(false)
								end,
								[aq("InputBegan")] = function(aX)
									if aX.UserInputType == Enum.UserInputType.MouseButton1 or aX.UserInputType == Enum.UserInputType.Touch then
										local aY = not aV:get()
										if not (aB:GetActiveValues() == 1 and not aY and not aB.AllowNull) then
											if aB.Multi then
												aV:set(aY)
												aB.Value[aT] = aV:get() and true or nil
											else
												aV:set(aY)
												aB.Value = aV:get() and aT or nil
												for aZ, a_ in next, aB.Buttons do
													a_:UpdateButton()
												end
											end
											aB:Display()
											aU:UpdateButton()
											aj(function()
												aB.Callback(aB.Value)
												aB.Changed(aB.Value)
											end)
										end
									end
								end,
							})
							aU:UpdateButton()
							aB.Buttons[aX] = aU
						end
						aJ()
						aO()
					end
					function aB.Destroy(aP)
						if aM then
							aM:Disconnect()
						end
						if aN then
							aN:Disconnect()
						end
						if aH then
							aH:Disconnect()
							aH = nil
						end
						for aQ, aR in ipairs(aG) do
							if typeof(aR) == "RBXScriptConnection" then
								aR:Disconnect()
							elseif typeof(aR) == "table" and aR.Destroy then
								aR:Destroy()
							end
						end
						aG = {}
						local aQ = ah(aB.Root)
						if aQ then
							aQ:Destroy()
						end
						local aR = ah(aB.Holder)
						if aR then
							aR:Destroy()
						end
						local aS = ah(am.Library).Options
						if aS and aS[az] == aB then
							aS[az] = nil
						end
					end
					ai(ay.Container, aB.Root)
					ah(am.Library).Options[az] = aB
					task.defer(aO)
					if aA.Default then
						local aP = {}
						if type(aA.Default) == "string" then
							local aQ = table.find(aB.Values, aA.Default)
							if aQ then
								table.insert(aP, aQ)
							end
						elseif type(aA.Default) == "table" then
							for aQ, aR in next, aA.Default do
								local aS = table.find(aB.Values, aR)
								if aS then
									table.insert(aP, aS)
								end
							end
						elseif type(aA.Default) == "number" and aB.Values[aA.Default] ~= nil then
							table.insert(aP, aA.Default)
						end
						if next(aP) then
							for aQ = 1, #aP do
								local aR = aP[aQ]
								if aB.Multi then
									aB.Value = aB.Value or {}
									aB.Value[aB.Values[aR]] = true
								else
									aB.Value = aB.Values[aR]
								end
								if not aB.Multi then
									break
								end
							end
						end
					end
					if aB.Multi and not aB.Value then
						aB.Value = {}
					end
					aB:BuildDropdownList()
					aB:Display()
					aJ()
					return aB
				end
				return ax
			end)()
		end,
		[58] = function()
			local aa, ab, ac = a(58)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.utils
				local af, ag, ah, ai = ac(ae.animate), ac(ae.unwrap), ac(ae.insertitem), ab.Parent.Parent.packages
				local aj, ak = ac(ai.fusion), ac(ai.states)
				local al, am, an, ao, ap, aq, ar, as, at, au, av, aw = aj.Children, aj.Computed, aj.Observer, aj.OnEvent, aj.Value, aj.Ref, aj.New, aj.OnChange, ac(ab.Parent.Parent.storage.theme), game:GetService("UserInputService"), game:GetService("GuiService"), {}
				aw.__index = aw
				aw.__type = "Colorpicker"
				function aw.New(ax, ay, az)
					local aA = az.Default or Color3.fromRGB(255, 255, 255)
					local aB, aC, aD = Color3.toHSV(aA)
					local aE, aF, aG, aH, aI, aJ = ap(aA), ap(false), ap(false), ap(false), ap(false), { Root = ap(), ColorpickerFrame = ap(), Holder = ap(), HSV = ap(), HSVDrag = ap(), Slider = ap(), SliderDrag = ap(), HexRGBContainer = ap(), Hex = ap(), RGB = ap(), Submit = ap(), Visualize = ap(), HoverStroke = ap() }
					local aK = { Title = ap(az.Title) or nil, Description = ap(az.Description) or nil, Value = aA, Type = "Colorpicker", Callback = az.Callback or function() end, Changed = function(aK) end, Opened = aF, H = aB, S = aC, V = aD, Connections = {}, Refs = aJ }
					function aK.Display(aL)
						local aM = Color3.fromHSV(aK.H, aK.S, aK.V)
						aK.Value = aM
						local aN, aO = ag(aJ.Visualize), ag(aJ.Submit)
						if aN then
							aN.BackgroundColor3 = aM
						end
						if aO then
							aO.BackgroundColor3 = aM
						end
						aK.Changed(aM)
						aK.Callback(aM)
					end
					local aL, aM, aN, aO = am(function()
						return Color3.fromHSV(aK.H, aK.S, aK.V)
					end), am(function()
						return Color3.fromHSV(aK.H, 1, 1)
					end), af(function()
						if aI:get() then
							return aF:get() and 0.15 or 0.5
						end
						return 1
					end, 40, 1), af(function()
						return aE:get()
					end, 40, 1)
					function aK.SetHSVFromRGB(aP, aQ)
						aK.H, aK.S, aK.V = Color3.toHSV(aQ)
						return aK.H, aK.S, aK.V
					end
					local aP, aQ, aR, aS, aT = function()
						local aP, aQ, aR, aS, aT = ag(aJ.HSV), ag(aJ.Submit), ag(aJ.Hex), ag(aJ.RGB), Color3.fromHSV(aK.H, aK.S, aK.V)
						aP.BackgroundColor3 = Color3.fromHSV(aK.H, 1, 1)
						aQ.BackgroundColor3 = aT
						aR.Text = aT:ToHex()
						local aU, aV, aW = math.floor(aT.R * 255), math.floor(aT.G * 255), math.floor(aT.B * 255)
						aS.Text = string.format("%d, %d, %d", aU, aV, aW)
					end, function()
						ag(aJ.SliderDrag).Position = UDim2.new(aK.H, 0, 0.5, 0)
						ag(aJ.HSVDrag).Position = UDim2.new(aK.S, 0, 1 - aK.V, 0)
					end, function()
						local aP, aQ = ag(aJ.Visualize), ag(aJ.ColorpickerFrame)
						local aR, aS, aT = aP.AbsolutePosition, aP.AbsoluteSize, av:GetGuiInset()
						aQ.Position = UDim2.fromOffset(aR.X, aR.Y + aS.Y + 5 + aT.Y)
					end, function()
						aI:set(true)
					end, function()
						aI:set(false)
					end
					local aU, aV = function(aU)
						if aU.UserInputType == Enum.UserInputType.MouseButton1 or aU.UserInputType == Enum.UserInputType.Touch then
							aH:set(true)
							local aV, aW = ag(aJ.HSV), ag(aJ.HSVDrag)
							local aX, aY, aZ, a_ = aV.AbsolutePosition, aV.AbsoluteSize
							aZ = au.InputChanged:Connect(function(a0)
								if aH:get() and a0.UserInputType == Enum.UserInputType.MouseMovement then
									local a1, a2 = math.clamp((a0.Position.X - aX.X) / aY.X, 0, 1), math.clamp((a0.Position.Y - aX.Y) / aY.Y, 0, 1)
									aK.S = a1
									aK.V = 1 - a2
									aW.Position = UDim2.new(a1, 0, a2, 0)
									aP()
								end
							end)
							a_ = au.InputEnded:Connect(function(a0)
								if aH:get() and a0.UserInputType == Enum.UserInputType.MouseButton1 then
									aZ:Disconnect()
									a_:Disconnect()
									aH:set(false)
								end
							end)
							table.insert(aK.Connections, aZ)
							table.insert(aK.Connections, a_)
						end
					end, function(aU)
						if aU.UserInputType == Enum.UserInputType.MouseButton1 or aU.UserInputType == Enum.UserInputType.Touch then
							aG:set(true)
							local aV, aW = ag(aJ.Slider), ag(aJ.SliderDrag)
							local aX, aY, aZ, a_ = aV.AbsolutePosition, aV.AbsoluteSize
							aZ = au.InputChanged:Connect(function(a0)
								if aG:get() and a0.UserInputType == Enum.UserInputType.MouseMovement then
									local a1 = math.clamp((a0.Position.X - aX.X) / aY.X, 0, 1)
									aK.H = a1
									aW.Position = UDim2.new(a1, 0, 0.5, 0)
									aP()
								end
							end)
							a_ = au.InputEnded:Connect(function(a0)
								if aG:get() and a0.UserInputType == Enum.UserInputType.MouseButton1 then
									aZ:Disconnect()
									a_:Disconnect()
									aG:set(false)
								end
							end)
							table.insert(aK.Connections, aZ)
							table.insert(aK.Connections, a_)
						end
					end
					aK.Picker = ar("TextButton")({ [aq] = aJ.ColorpickerFrame, Name = "Colorpicker", BackgroundColor3 = at.background, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromOffset(241, 0), ZIndex = 9999, Visible = aF, Parent = ag(ak.Library).GUI, [al] = { ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), ar("UIStroke")({ Name = "UIStroke", Color = at.stroke, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }), ar("Frame")({ [aq] = aJ.Holder, Name = "Holder", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 1), ZIndex = 9999, [al] = { ar("ImageLabel")({ [aq] = aJ.HSV, Name = "HSV", Image = "rbxassetid://4155801252", BackgroundColor3 = aM, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(0.0928, 0.0357), Size = UDim2.new(1, 0, 0, 140), ZIndex = 9999, [al] = { ar("ImageButton")({ [aq] = aJ.HSVDrag, Name = "Drag", Image = "http://www.roblox.com/asset/?id=4805639000", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(27, 42, 53), BorderSizePixel = 0, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(20, 20), ZIndex = 9999, [ao("InputBegan")] = aU }), ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), ar("UIStroke")({ Name = "UIStroke", Color = at.stroke }) } }), ar("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 10), HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), ar("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 10) }), ar("Frame")({ [aq] = aJ.Slider, Name = "Slider", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(27, 42, 53), BorderSizePixel = 0, Position = UDim2.fromScale(0.0253, 0.744), Size = UDim2.new(1, 0, 0, 18), ZIndex = 9999, [al] = { ar("UIGradient")({ Name = "UIGradient", Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.0557, Color3.fromRGB(255, 85, 0)), ColorSequenceKeypoint.new(0.111, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.167, Color3.fromRGB(254, 255, 0)), ColorSequenceKeypoint.new(0.223, Color3.fromRGB(169, 255, 0)), ColorSequenceKeypoint.new(0.279, Color3.fromRGB(84, 255, 0)), ColorSequenceKeypoint.new(0.334, Color3.fromRGB(0, 255, 1)), ColorSequenceKeypoint.new(0.39, Color3.fromRGB(0, 255, 87)), ColorSequenceKeypoint.new(0.446, Color3.fromRGB(0, 255, 172)), ColorSequenceKeypoint.new(0.501, Color3.fromRGB(0, 253, 255)), ColorSequenceKeypoint.new(0.557, Color3.fromRGB(0, 168, 255)), ColorSequenceKeypoint.new(0.613, Color3.fromRGB(0, 82, 255)), ColorSequenceKeypoint.new(0.669, Color3.fromRGB(3, 0, 255)), ColorSequenceKeypoint.new(0.724, Color3.fromRGB(88, 0, 255)), ColorSequenceKeypoint.new(0.78, Color3.fromRGB(173, 0, 255)), ColorSequenceKeypoint.new(0.836, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(0.891, Color3.fromRGB(255, 0, 166)), ColorSequenceKeypoint.new(0.947, Color3.fromRGB(255, 0, 81)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) }) }), ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), ar("ImageButton")({ [aq] = aJ.SliderDrag, Name = "Drag", Image = "http://www.roblox.com/asset/?id=4805639000", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(27, 42, 53), BorderSizePixel = 0, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(20, 20), ZIndex = 9999, [ao("InputBegan")] = aV }) } }), ar("Frame")({ [aq] = aJ.HexRGBContainer, Name = "HEXRGB", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), ZIndex = 9999, [al] = { ar("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 6), FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder }), ar("TextBox")({
						[aq] = aJ.Hex,
						Name = "HEX",
						CursorPosition = -1,
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
						PlaceholderColor3 = at.tertiary_text,
						PlaceholderText = "HEX",
						Text = "",
						TextColor3 = at.secondary_text,
						TextSize = 14,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.new(0.5, -3, 0, 25),
						ZIndex = 9999,
						[al] = { ar("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = at.stroke }), ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }) },
						[ao("FocusLost")] = function()
							local aW = ag(aJ.Hex).Text
							if string.match(aW, "^%x%x%x%x%x%x$") then
								aK.H, aK.S, aK.V = Color3.fromHex(aW):ToHSV()
								aP()
								aQ()
							end
						end,
					}), ar("TextBox")({
						[aq] = aJ.RGB,
						Name = "RGB",
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
						PlaceholderColor3 = at.tertiary_text,
						PlaceholderText = "RGB",
						Text = "",
						TextColor3 = at.secondary_text,
						TextSize = 14,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.new(0.5, -3, 0, 25),
						ZIndex = 9999,
						[al] = { ar("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = at.stroke }), ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }) },
						[ao("FocusLost")] = function()
							local aW = ag(aJ.RGB).Text
							if string.match(aW, "^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*$") then
								local aX, aY, aZ = string.match(aW, "^%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*$")
								aX, aY, aZ = math.clamp(tonumber(aX) or 0, 0, 255), math.clamp(tonumber(aY) or 0, 0, 255), math.clamp(tonumber(aZ) or 0, 0, 255)
								aK.H, aK.S, aK.V = Color3.fromRGB(aX, aY, aZ):ToHSV()
								aP()
								aQ()
							end
						end,
					}) } }), ar("TextButton")({
						[aq] = aJ.Submit,
						Name = "TextButton",
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
						Text = "Submit",
						TextColor3 = at.text,
						TextSize = 14,
						BackgroundColor3 = aL,
						Size = UDim2.new(1, 0, 0, 25),
						ZIndex = 9999,
						[al] = { ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }), ar("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = at.stroke }) },
						[ao("InputEnded")] = function(aW)
							if aW.UserInputType == Enum.UserInputType.MouseButton1 or aW.UserInputType == Enum.UserInputType.Touch then
								aK:Display()
								aK.Opened:set(false)
							end
						end,
					}) } }), ar("UISizeConstraint")({ Name = "UISizeConstraint", MinSize = Vector2.new(240, 255) }), ar("ImageLabel")({ Name = "EShadow", Image = "rbxassetid://9313765853", ImageColor3 = at.background, ImageTransparency = 0.5, ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(45, 45, 45, 45), SliceScale = 1.2, AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(27, 42, 53), ClipsDescendants = true, Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, 75, 1, 75), ZIndex = -1 }) } })
					aK.Root = ar("Frame")({ [aq] = aJ.Root, Name = "Text", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 0), [al] = { ar("Frame")({ Name = "Addons", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromScale(1, 0), Size = UDim2.fromScale(0, 1), [al] = { ar("Frame")({ Name = "Checkbox", AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = Color3.fromRGB(114, 149, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, LayoutOrder = 1, Position = UDim2.fromScale(1, 0.5), Size = UDim2.fromOffset(44, 24), [al] = { ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }), ar("UIStroke")({ [aq] = aJ.HoverStroke, Name = "UIStroke", Color = aO, Thickness = 2, Transparency = aN }), ar("Frame")({
						[aq] = aJ.Visualize,
						Name = "Visualize",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = aK.Value,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromOffset(40, 20),
						[al] = { ar("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }) },
						[ao("MouseEnter")] = aS,
						[ao("MouseLeave")] = aT,
						[ao("InputEnded")] = function(aW)
							if aW.UserInputType == Enum.UserInputType.MouseButton1 or aW.UserInputType == Enum.UserInputType.Touch then
								aF:set(not aF:get())
							end
						end,
						[as("BackgroundColor3")] = function()
							aE:set(ag(aJ.Visualize).BackgroundColor3)
						end,
					}) } }), ar("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 15), FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }) } }), ar("Frame")({
						Name = "TextHolder",
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = UDim2.new(1, -80, 1, 0),
						[al] = { ar("TextLabel")({ Name = "Title", FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal), Text = az.Title, TextColor3 = at.secondary_text, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0) }), ar("UIListLayout")({ Name = "UIListLayout", Padding = UDim.new(0, 5), VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }), am(function()
							if az.Description then
								return ar("TextLabel")({ Name = "Description", FontFace = Font.new("rbxassetid://12187365364"), RichText = true, Text = az.Description, TextColor3 = at.tertiary_text, TextSize = 15, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.fromOffset(0, 10), Size = UDim2.fromScale(1, 0), Visible = true })
							end
							return nil
						end, aj.cleanup) },
						[ao("MouseEnter")] = aS,
						[ao("MouseLeave")] = aT,
						[ao("InputEnded")] = function(aW)
							if aW.UserInputType == Enum.UserInputType.MouseButton1 or aW.UserInputType == Enum.UserInputType.Touch then
								aF:set(not aF:get())
							end
						end,
					}) } })
					an(aF):onChange(function()
						if aF:get() then
							for aW, aX in pairs(aK.Connections) do
								aX:Disconnect()
							end
							aK.Connections = {}
							local aW = au.InputBegan:Connect(function(aW)
								if aW.KeyCode == Enum.KeyCode.Escape then
									aF:set(false)
								end
							end)
							table.insert(aK.Connections, aW)
							local aX = ag(aJ.Visualize):GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
								aR()
							end)
							table.insert(aK.Connections, aX)
							aR()
						else
							for aW, aX in pairs(aK.Connections) do
								aX:Disconnect()
							end
							aK.Connections = {}
						end
					end)
					function aK.SetTitle(aW, aX)
						if aK.Title then
							aK.Title:set(aX)
						end
					end
					function aK.SetDescription(aW, aX)
						if aK.Description then
							aK.Description:set(aX)
						end
					end
					function aK.SetValueRGB(aW, aX)
						if not aX then
							return
						end
						aK:SetHSVFromRGB(aX)
						aK:Display()
					end
					ah(ax.Container, aK.Root)
					aP()
					aQ()
					aK:Display()
					ag(ak.Library).Options[ay] = aK
					return aK
				end
				return aw
			end)()
		end,
		[59] = function()
			local aa, ab, ac = a(59)
			local ad
			return (function(...)
				local ae = ab.Parent.Parent.utils
				local af, ag, ah, ai, aj, ak = ac(ae.animate), ac(ae.color3), ac(ae.unwrap), ac(ae.insertitem), ac(ae.safecallback), ab.Parent.Parent.packages
				local al, am = ac(ak.fusion), ac(ak.states)
				local an, ao, ap, aq, ar, as, at, au, av, aw, ax, ay = al.Children, al.Computed, al.ForPairs, al.Observer, al.OnChange, al.OnEvent, al.Value, al.Tween, al.Ref, al.New, ac(ab.Parent.Parent.storage.theme), {}
				ay.__index = ay
				ay.__type = "Button"
				function ay.New(az, aA)
					local aB, aC, aD, aE = { Callback = aA.Callback or function(aB) end, Style = string.lower(aA.Type), Type = "Button", TooltipText = aA.Tooltip or nil }, at(false), (at(false))
					if aA.Tooltip then
						aE = ac(ab.Parent.Parent.components.window.tooltip)({ Text = aA.Tooltip })
					else
						aE = nil
					end
					aB.Root = aw("Frame")({ Name = "Button", AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.fromScale(1, 0), [an] = { aw("TextButton")({
						Name = "TextButton",
						FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
						Text = aA.Title,
						TextColor3 = af(function()
							local aF = aB.Style
							if aF == "default" then
								if ah(aC) then
									return ag.lightenRGB(ah(ax.tertiary_text), 35)
								end
								return ah(ax.tertiary_text)
							else
								if ah(aC) then
									return Color3.fromRGB(255, 255, 255)
								end
								return ag.lightenRGB(ah(ax.text), 10)
							end
						end, 25, 1),
						TextSize = 14,
						BackgroundTransparency = af(function()
							if ah(aD) then
								return 0.1
							end
							return 0
						end, 25, 1),
						BackgroundColor3 = af(function()
							local aF, aG = aB.Style
							if aF == "primary" then
								aG = ah(ax.accent)
							elseif aF == "danger" then
								aG = ah(ax.danger)
							elseif aF == "warning" then
								aG = ah(ax.warning)
							else
								aG = ah(ax.secondary_background)
							end
							if ah(aC) then
								return ag.lightenRGB(aG, 10)
							end
							if ah(aD) then
								return ag.darkenRGB(aG, 15)
							end
							return aG
						end, 25, 1),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Size = af(function()
							if ah(aD) then
								return UDim2.new(1, -4, 0, 28)
							end
							return UDim2.new(1, 0, 0, 28)
						end, 25, 1),
						AnchorPoint = Vector2.new(0.5, 0),
						Position = af(function()
							if ah(aD) then
								return UDim2.new(0.5, 0, 0, 2)
							end
							return UDim2.new(0.5, 0, 0, 0)
						end, 25, 1),
						[an] = { aw("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }), aw("UIStroke")({ Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = af(function()
							local aF, aG = aB.Style
							if aF == "primary" then
								aG = ah(ax.accent)
							elseif aF == "danger" then
								aG = ah(ax.danger)
							elseif aF == "warning" then
								aG = ah(ax.warning)
							else
								aG = ah(ax.secondary_background)
							end
							if ah(aC) then
								return ag.lightenRGB(aG, 50)
							end
							return ag.lightenRGB(aG, 35)
						end, 25, 1), Transparency = 0.25, Thickness = 1 }), ao(function()
							if aB.Style == "default" then
								return
							end
							return aw("ImageLabel")({ Name = "ImageLabel", Image = "rbxassetid://108824901287727", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(255, 255, 255), ImageColor3 = Color3.fromRGB(255, 255, 255), ScaleType = Enum.ScaleType.Slice, SliceScale = 0.5, SliceCenter = Rect.new(25, 25, 25, 25), Active = false })
						end, al.cleanup) },
						[as("Activated")] = function()
							aj(function()
								aB.Callback()
							end)
						end,
						[as("InputEnded")] = function(aF)
							if aF.UserInputType == Enum.UserInputType.MouseButton1 or aF.UserInputType == Enum.UserInputType.Touch then
								aD:set(false)
							end
						end,
						[as("InputBegan")] = function(aF)
							if aF.UserInputType == Enum.UserInputType.MouseButton1 or aF.UserInputType == Enum.UserInputType.Touch then
								aD:set(true)
							end
						end,
						[as("MouseEnter")] = function()
							aC:set(true)
							if aE then
								aE.set_visible(true)
							end
						end,
						[as("MouseLeave")] = function()
							aC:set(false)
							if aE then
								aE.set_visible(false)
							end
						end,
					}) } })
					ai(az.Container, aB.Root)
					return aB
				end
				return ay
			end)()
		end,
	}, { { 1, 2, { "Ethos Suite" }, { { 2, 1, { "utils" }, { { 9, 2, { "animate" } }, { 7, 2, { "insertitem" } }, { 3, 2, { "unwrap" } }, { 8, 2, { "color3" } }, { 4, 2, { "services" } }, { 6, 2, { "player" } }, { 5, 2, { "safecallback" } } } }, { 27, 2, { "modules" } }, { 12, 1, { "packages" }, { { 26, 2, { "audio" } }, { 14, 2, { "snapdragon" }, { { 20, 2, { "Signal" } }, { 18, 2, { "SnapdragonRef" } }, { 15, 2, { "t" } }, { 21, 2, { "Maid" } }, { 19, 2, { "SnapdragonController" } }, { 17, 2, { "Symbol" } }, { 16, 2, { "objectAssign" } } } }, { 13, 2, { "states" } }, { 25, 2, { "cmdr" } }, { 22, 2, { "maid" } }, { 23, 2, { "fusion" } }, { 24, 2, { "damerau" } } } }, { 48, 2, { "Elements" }, { { 57, 2, { "dropdown" } }, { 55, 2, { "keybind" } }, { 54, 2, { "radio" } }, { 59, 2, { "button" } }, { 58, 2, { "colorpicker" } }, { 52, 2, { "slider" } }, { 56, 2, { "input" } }, { 49, 2, { "toggle" } }, { 51, 2, { "table" } }, { 53, 2, { "seperator" } }, { 50, 2, { "text" } } } }, { 28, 1, { "components" }, { { 39, 1, { "commandbar" }, { { 42, 2, { "bar" } }, { 41, 2, { "suggestion" } }, { 40, 2, { "suggestions" } } } }, { 36, 1, { "notification" }, { { 37, 2, { "notificationHolder" } }, { 38, 2, { "notification" } } } }, { 43, 1, { "chat" }, { { 44, 2, { "message" } }, { 46, 2, { "chatwindow" } }, { 45, 2, { "input" } } } }, { 29, 1, { "window" }, { { 35, 2, { "category" } }, { 34, 2, { "dialog" } }, { 32, 2, { "tab" } }, { 33, 2, { "section" } }, { 31, 2, { "tooltip" } }, { 30, 2, { "window" } } } } } }, { 47, 2, { "commandbar" } }, { 10, 1, { "storage" }, { { 11, 2, { "theme" } } } } } } }, "0.4.1", "WaxRuntime", string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION
local au, av, aw, ax, ay, az, aA =
	aj.insert, aj.remove, aj.freeze or function(au)
		return au
	end, al.wrap, ae.sub, ae.match, ae.gmatch
if as and ay(as, 1, 4) == "Lune" then
	local aB, aC = ap(ao, "@lune/task")
	if aB and aC then
		af = aC
	end
end
local aB = af and af.defer
local aC, aD, aE, aF, aG, aH, aI, aJ, aK =
	aB or function(aC, ...)
		ax(aC)(...)
	end, { [1] = "Folder", [2] = "ModuleScript", [3] = "Script", [4] = "LocalScript", [5] = "StringValue" }, {}, {}, {}, {}, {}, {}, {}
local aL, aM =
	{ GetFullName = {
		{},
		function(aL)
			local aM, aN = aL.Name, aL.Parent
			while aN do
				aM = aN.Name .. "." .. aM
				aN = aN.Parent
			end
			return aM
		end,
	}, GetChildren = {
		{},
		function(aL)
			local aM = {}
			for aN in ai, aK[aL] do
				au(aM, aN)
			end
			return aM
		end,
	}, GetDescendants = {
		{},
		function(aL)
			local aM = {}
			for aN in ai, aK[aL] do
				au(aM, aN)
				for aO, aP in ai, aN:GetDescendants() do
					au(aM, aP)
				end
			end
			return aM
		end,
	}, FindFirstChild = {
		{ "string", "boolean?" },
		function(aL, aM, aN)
			local aO = aK[aL]
			for aP in ai, aO do
				if aP.Name == aM then
					return aP
				end
			end
			if aN then
				for aP in ai, aO do
					return aP:FindFirstChild(aM, true)
				end
			end
		end,
	}, FindFirstAncestor = {
		{ "string" },
		function(aL, aM)
			local aN = aL.Parent
			while aN do
				if aN.Name == aM then
					return aN
				end
				aN = aN.Parent
			end
		end,
	}, WaitForChild = {
		{ "string", "number?" },
		function(aL, aM)
			return aL:FindFirstChild(aM)
		end,
	} }, {}
for aN, aO in ai, aL do
	local aP, aQ, aR = aO[1], aO[2], {}
	for aS, aT in ai, aP do
		local aU, aV = az(aT, "^([^%?]+)(%??)")
		aR[aS] = { aU, aV }
	end
	aM[aN] = function(aS, ...)
		if not aK[aS] then
			ah("Expected ':' not '.' calling member function " .. aN, 2)
		end
		local aT = { ... }
		for aU, aV in ai, aR do
			local aW = aT[aU]
			local aX, aY, aZ = an(aW), aV[1], aV[2]
			if aW == nil and not aZ then
				ah("Argument " .. aW .. " missing or nil", 3)
			end
			if aY ~= "any" and aX ~= aY and not (aX == "nil" and aZ) then
				ah("Argument " .. aU .. ' expects type "' .. aY .. '", got "' .. aX .. '"', 2)
			end
		end
		return aQ(aS, ...)
	end
end
local aN = function(aN, aO, aP)
	local aQ, aR, aS, aT, aU, aV =
		ag({}, { __mode = "k" }), function(aQ)
			ah(aQ .. " is not a valid (virtual) member of " .. aN .. ' "' .. aO .. '"', 3)
		end, function(aQ)
			ah("Unable to assign (virtual) property " .. aQ .. ". Property is read only", 3)
		end, {}, {}
	aU.__metatable = false
	aU.__index = function(aW, aX)
		if aX == "ClassName" then
			return aN
		elseif aX == "Name" then
			return aO
		elseif aX == "Parent" then
			return aP
		elseif aN == "StringValue" and aX == "Value" then
			return aV
		else
			local aY = aM[aX]
			if aY then
				return aY
			end
		end
		for aY in ai, aQ do
			if aY.Name == aX then
				return aY
			end
		end
		aR(aX)
	end
	aU.__newindex = function(aW, aX, aY)
		if aX == "ClassName" then
			aS(aX)
		elseif aX == "Name" then
			aO = aY
		elseif aX == "Parent" then
			if aY == aT then
				return
			end
			if aP ~= nil then
				aK[aP][aT] = nil
			end
			aP = aY
			if aY ~= nil then
				aK[aY][aT] = true
			end
		elseif aN == "StringValue" and aX == "Value" then
			aV = aY
		else
			aR(aX)
		end
	end
	aU.__tostring = function()
		return aO
	end
	ag(aT, aU)
	aK[aT] = aQ
	if aP ~= nil then
		aK[aP][aT] = true
	end
	return aT
end
local function aO(aP, aQ)
	local aR, aS, aT, aU = aP[1], aP[2], aP[3], aP[4]
	local aV = aD[aS]
	local aW = aT and av(aT, 1) or aV
	local aX = aN(aV, aW, aQ)
	aE[aR] = aX
	if aT then
		for aY, aZ in ai, aT do
			aX[aY] = aZ
		end
	end
	if aU then
		for aY, aZ in ai, aU do
			aO(aZ, aX)
		end
	end
	return aX
end
local aP = aN("Folder", "[" .. ad .. "]")
for aQ, aR in ai, ab do
	aO(aR, aP)
end
for aQ, aR in ai, aa do
	local aS = aE[aQ]
	aF[aS] = aR
	aG[aS] = aQ
	local aT = aS.ClassName
	if aT == "LocalScript" or aT == "Script" then
		au(aI, aS)
	end
end
local aQ = function(aQ)
	local aR, aS = aQ.ClassName, aH[aQ]
	if aS and aR == "ModuleScript" then
		return ak(aS)
	end
	local aT, aU =
		aF[aQ], function(aT)
			aT = aq(aT)
			local aU, aV, aW = aQ:GetFullName(), az(aT, "[^:]+:(%d+): (.+)")
			if not aV or not at then
				return aU .. ":*: " .. (aW or aT)
			end
			aV = ar(aV)
			local aX = aG[aQ]
			local aY = at[aX]
			local aZ = aV - aY + 1
			if aZ < 0 then
				aZ = "?"
			end
			return aU .. ":" .. aZ .. ": " .. aW
		end
	if aR == "LocalScript" or aR == "Script" then
		local aV, aW = ap(aT)
		if not aV then
			ah(aU(aW), 0)
		end
	else
		local aV = { ap(aT) }
		local aW = av(aV, 1)
		if not aW then
			local aX = av(aV, 1)
			ah(aU(aX), 0)
		end
		aH[aQ] = aV
		return ak(aV)
	end
end
function a(aR)
	local aS, aT, aU =
		aE[aR], function(aS, ...)
			local aT = { ap(aS, ...) }
			local aU = av(aT, 1)
			if not aU then
				ah(aT[1], 3)
			end
			return ak(aT)
		end, aw(ag({}, {
			__index = aJ,
			__newindex = function(aS, aT, aU)
				aJ[aT] = aU
			end,
			__len = function()
				return #aJ
			end,
			__iter = function()
				return ai, aJ
			end,
		}))
	local aV, aW, aX =
		aw({ version = ac, envname = ad, shared = aU, script = am, require = ao }), aS, function(aV, ...)
			local aW, aX, aY = an(aV), "Attempted to call require with a non-ModuleScript", "Attempted to call require with self"
			if aW == "table" and aK[aV] then
				if aV.ClassName ~= "ModuleScript" then
					ah(aX, 2)
				elseif aV == aS then
					ah(aY, 2)
				end
				return aQ(aV)
			elseif aW == "string" and ay(aV, 1, 1) ~= "@" then
				if #aV == 0 then
					ah("Attempted to call require with empty string", 2)
				end
				local aZ = aS
				if ay(aV, 1, 1) == "/" then
					aZ = aP
				elseif ay(aV, 1, 2) == "./" then
					aV = ay(aV, 3)
				end
				local a_
				for a0 in aA(aV, "([^/]*)/?") do
					local a1 = a0
					if a0 == ".." then
						a1 = "Parent"
					end
					if a1 ~= "" then
						local a2 = aZ:FindFirstChild(a1)
						if not a2 then
							local a3 = aZ.Parent
							if a3 then
								a2 = a3:FindFirstChild(a1)
							end
						end
						if a2 then
							aZ = a2
						elseif a0 ~= a_ and a0 ~= "init" and a0 ~= "init.server" and a0 ~= "init.client" then
							ah('Virtual script path "' .. aV .. '" not found', 2)
						end
					end
					a_ = a0
				end
				if aZ.ClassName ~= "ModuleScript" then
					ah(aX, 2)
				elseif aZ == aS then
					ah(aY, 2)
				end
				return aQ(aZ)
			end
			return aT(ao, aV, ...)
		end
	return aV, aW, aX
end
for aR, aS in ai, aI do
	aC(aQ, aS)
end
return aQ(aP:GetChildren()[1])



