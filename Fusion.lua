local a
local b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, s, u, v, w =
	{
		function()
			local b, c, d = a(1)
			return (function(...)
				return d(c.Packages.fusion)
			end)()
		end,
		[5] = function()
			local b, c, d = a(5)
			return (function(...)
				local e, f = d(c.Types), (d(c.External))
				do
					local g = d(c.RobloxExternal)
					f.setExternalProvider(g)
				end
				local g = table.freeze({ version = { major = 0, minor = 3, isRelease = true }, Contextual = d(c.Utility.Contextual), Safe = d(c.Utility.Safe), cleanup = d(c.Memory.legacyCleanup), deriveScope = d(c.Memory.deriveScope), doCleanup = d(c.Memory.doCleanup), innerScope = d(c.Memory.innerScope), scoped = d(c.Memory.scoped), Observer = d(c.Graph.Observer), Computed = d(c.State.Computed), ForKeys = (d(c.State.ForKeys)), ForPairs = (d(c.State.ForPairs)), ForValues = (d(c.State.ForValues)), peek = d(c.State.peek), Value = d(c.State.Value), Attribute = d(c.Instances.Attribute), AttributeChange = d(c.Instances.AttributeChange), AttributeOut = d(c.Instances.AttributeOut), Child = d(c.Instances.Child), Children = d(c.Instances.Children), Hydrate = d(c.Instances.Hydrate), New = d(c.Instances.New), OnChange = d(c.Instances.OnChange), OnEvent = d(c.Instances.OnEvent), Out = d(c.Instances.Out), Tween = d(c.Animation.Tween), Spring = d(c.Animation.Spring) })
				return g
			end)()
		end,
		[7] = function()
			local b, c, d = a(7)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i = d(e.Types), d(e.External), d(e.Graph.change), d(e.Utility.nicknames)
				local j = {}
				j.type = "State"
				j.kind = "ExternalTime"
				j.timeliness = "lazy"
				j.dependencySet = table.freeze({})
				j._EXTREMELY_DANGEROUS_usedAsValue = g.lastUpdateStep()
				local k, l = table.freeze({ __index = j }), {}
				local m = function(m)
					local n = os.clock()
					local o = (setmetatable({
						createdAt = n,
						dependentSet = {},
						lastChange = nil,
						scope = m,
						validity = "invalid",
					}, k))
					local p = function()
						o.scope = nil
						local p = table.find(l, o)
						if p ~= nil then
							table.remove(l, p)
						end
					end
					o.oldestTask = p
					i[o.oldestTask] = "ExternalTime"
					table.insert(m, p)
					table.insert(l, o)
					return o
				end
				function j._evaluate(n)
					return true
				end
				g.bindToUpdateStep(function(n)
					j._EXTREMELY_DANGEROUS_usedAsValue = g.lastUpdateStep()
					for o, p in l do
						h(p)
					end
				end)
				return m
			end)()
		end,
		[8] = function()
			local b, c, d = a(8)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n, o, p, q, r, s, t = d(e.Types), d(e.External), d(e.Memory.checkLifetime), d(e.Graph.depend), d(e.Graph.change), d(e.Graph.evaluate), d(e.State.castToState), d(e.State.peek), d(e.Animation.ExternalTime), d(e.Animation.Stopwatch), d(e.Animation.packType), d(e.Animation.unpackType), d(e.Animation.springCoefficients), d(e.Utility.nicknames), 0.00001
				local u = {}
				u.type = "State"
				u.kind = "Spring"
				u.timeliness = "eager"
				local v = table.freeze({
					__index = u,
				})
				local w = function(w, x, y, z)
					local A = os.clock()
					if typeof(w) ~= "table" or l(w) ~= nil then
						g.logError("scopeMissing", nil, "Springs", "myScope:Spring(goalState, speed, damping)")
					end
					local B, C = (l(x))
					if B ~= nil then
						C = o(w, n(w))
						C:unpause()
					end
					local D, E = y or 10, z or 1
					local F = (setmetatable({
						createdAt = A,
						dependencySet = {},
						dependentSet = {},
						lastChange = nil,
						scope = w,
						validity = "invalid",
						_activeDamping = -1,
						_activeGoal = nil,
						_activeLatestP = {},
						_activeLatestV = {},
						_activeNumSprings = 0,
						_activeSpeed = -1,
						_activeStartP = {},
						_activeStartV = {},
						_activeTargetP = {},
						_activeType = "",
						_damping = E,
						_EXTREMELY_DANGEROUS_usedAsValue = m(x),
						_goal = x,
						_speed = D,
						_stopwatch = C,
					}, v))
					local G = function()
						F.scope = nil
						for G in pairs(F.dependencySet) do
							G.dependentSet[F] = nil
						end
					end
					F.oldestTask = G
					s[F.oldestTask] = "Spring"
					table.insert(w, G)
					if B ~= nil then
						h.bOutlivesA(w, F.oldestTask, B.scope, B.oldestTask, h.formatters.animationGoal)
					end
					local H = l(D)
					if H ~= nil then
						h.bOutlivesA(w, F.oldestTask, H.scope, H.oldestTask, h.formatters.parameter, "speed")
					end
					local I = l(E)
					if I ~= nil then
						h.bOutlivesA(w, F.oldestTask, I.scope, I.oldestTask, h.formatters.parameter, "damping")
					end
					k(F, true)
					return F
				end
				function u.addVelocity(x, y)
					k(x, false)
					local z = typeof(y)
					if z ~= x._activeType then
						g.logError("springTypeMismatch", nil, z, x._activeType)
					end
					local A = q(y, z)
					for B, C in x._activeLatestV do
						A[B] += C
					end
					x._activeStartP = table.clone(x._activeLatestP)
					x._activeStartV = A
					x._stopwatch:zero()
					x._stopwatch:unpause()
					j(x)
				end
				function u.get(x)
					return g.logError("stateGetWasRemoved")
				end
				function u.setPosition(x, y)
					k(x, false)
					local z = typeof(y)
					if z ~= x._activeType then
						g.logError("springTypeMismatch", nil, z, x._activeType)
					end
					x._activeStartP = q(y, z)
					x._activeStartV = table.clone(x._activeLatestV)
					x._stopwatch:zero()
					x._stopwatch:unpause()
					j(x)
				end
				function u.setVelocity(x, y)
					k(x, false)
					local z = typeof(y)
					if z ~= x._activeType then
						g.logError("springTypeMismatch", nil, z, x._activeType)
					end
					x._activeStartP = table.clone(x._activeLatestP)
					x._activeStartV = q(y, z)
					x._stopwatch:zero()
					x._stopwatch:unpause()
					j(x)
				end
				function u._evaluate(x)
					local y = l(x._goal)
					if y == nil then
						x._EXTREMELY_DANGEROUS_usedAsValue = x._goal
						return false
					end
					local z = m(y)
					if z ~= z then
						g.logWarn("springNanGoal")
						return false
					end
					local A = typeof(z)
					local B, C = A ~= x._activeType, x._stopwatch
					local D = m(C)
					i(x, C)
					local E, F = x._EXTREMELY_DANGEROUS_usedAsValue
					if B then
						F = z
					elseif D <= 0 then
						F = E
					else
						local G, H, I, J = r(D, x._activeDamping, x._activeSpeed)
						local K = false
						for L = 1, x._activeNumSprings do
							local M, N, O = x._activeStartP[L], x._activeTargetP[L], x._activeStartV[L]
							local P = M - N
							local Q, R = P * G + O * H, P * I + O * J
							if Q ~= Q or R ~= R then
								g.logWarn("springNanMotion")
								Q, R = 0, 0
							end
							if math.abs(Q) > t or math.abs(R) > t then
								K = true
							end
							local S = Q + N
							x._activeLatestP[L] = S
							x._activeLatestV[L] = R
						end
						if not K then
							for L = 1, x._activeNumSprings do
								x._activeLatestP[L] = x._activeTargetP[L]
							end
						end
						F = (p(x._activeLatestP, x._activeType))
					end
					local G, H = (m(x._speed)), (m(x._damping))
					if B or z ~= x._activeGoal or G ~= x._activeSpeed or H ~= x._activeDamping then
						x._activeTargetP = q(z, A)
						x._activeNumSprings = #x._activeTargetP
						if B then
							x._activeStartP = table.clone(x._activeTargetP)
							x._activeLatestP = table.clone(x._activeTargetP)
							x._activeStartV = table.create(x._activeNumSprings, 0)
							x._activeLatestV = table.create(x._activeNumSprings, 0)
						else
							x._activeStartP = table.clone(x._activeLatestP)
							x._activeStartV = table.clone(x._activeLatestV)
						end
						x._activeType = A
						x._activeGoal = z
						x._activeDamping = H
						x._activeSpeed = G
						C:zero()
						C:unpause()
					end
					x._EXTREMELY_DANGEROUS_usedAsValue = F
					return E ~= F
				end
				table.freeze(u)
				return w
			end)()
		end,
		[9] = function()
			local b, c, d = a(9)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k = d(e.Types), d(e.Memory.checkLifetime), d(e.Graph.depend), d(e.Graph.change), d(e.State.peek), d(e.Utility.nicknames)
				local l = {}
				l.type = "State"
				l.kind = "Stopwatch"
				l.timeliness = "lazy"
				local m = table.freeze({ __index = l })
				local n = function(n, o)
					local p = os.clock()
					local q = (setmetatable({ awake = true, createdAt = p, dependencySet = {}, dependentSet = {}, lastChange = nil, scope = n, validity = "invalid", _EXTREMELY_DANGEROUS_usedAsValue = 0, _measureTimeSince = 0, _playing = false, _timer = o }, m))
					local r = function()
						q.scope = nil
					end
					q.oldestTask = r
					k[q.oldestTask] = "Stopwatch"
					table.insert(n, r)
					g.bOutlivesA(n, q.oldestTask, o.scope, o.oldestTask, g.formatters.parameter, "timer")
					h(q, o)
					return q
				end
				function l.zero(o)
					local p = j(o._timer)
					if p ~= o._measureTimeSince then
						o._measureTimeSince = p
						o._EXTREMELY_DANGEROUS_usedAsValue = 0
						i(o)
					end
				end
				function l.pause(o)
					if o._playing == true then
						o._playing = false
						i(o)
					end
				end
				function l.unpause(o)
					if o._playing == false then
						o._playing = true
						o._measureTimeSince = j(o._timer) - o._EXTREMELY_DANGEROUS_usedAsValue
						i(o)
					end
				end
				function l._evaluate(o)
					if o._playing then
						h(o, o._timer)
						local p, q = j(o._timer), o._EXTREMELY_DANGEROUS_usedAsValue
						local r = p - o._measureTimeSince
						o._EXTREMELY_DANGEROUS_usedAsValue = r
						return q ~= r
					else
						return false
					end
				end
				table.freeze(l)
				return n
			end)()
		end,
		[10] = function()
			local b, c, d = a(10)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n, o, p, q, r = d(e.Types), d(e.External), d(e.Memory.checkLifetime), d(e.Graph.depend), d(e.Graph.evaluate), d(e.State.castToState), d(e.State.peek), d(e.Animation.ExternalTime), d(e.Animation.Stopwatch), d(e.Animation.lerpType), d(e.Animation.getTweenRatio), d(e.Animation.getTweenDuration), d(e.Utility.nicknames)
				local s = {}
				s.type = "State"
				s.kind = "Tween"
				s.timeliness = "eager"
				local t = table.freeze({ __index = s })
				local u = function(u, v, w)
					local x = os.clock()
					if k(u) then
						g.logError("scopeMissing", nil, "Tweens", "myScope:Tween(goalState, tweenInfo)")
					end
					local y, z = (k(v))
					if y ~= nil then
						z = n(u, m(u))
					end
					local A = (setmetatable({ createdAt = x, dependencySet = {}, dependentSet = {}, lastChange = nil, scope = u, validity = "invalid", _activeDuration = nil, _activeElapsed = nil, _activeFrom = nil, _activeTo = nil, _activeTweenInfo = nil, _EXTREMELY_DANGEROUS_usedAsValue = l(v), _goal = v, _stopwatch = z, _tweenInfo = w or TweenInfo.new() }, t))
					local B = function()
						A.scope = nil
						for B in pairs(A.dependencySet) do
							B.dependentSet[A] = nil
						end
					end
					A.oldestTask = B
					r[A.oldestTask] = "Tween"
					table.insert(u, B)
					if y ~= nil then
						h.bOutlivesA(u, A.oldestTask, y.scope, y.oldestTask, h.formatters.animationGoal)
					end
					local C = k(w)
					if C ~= nil then
						h.bOutlivesA(u, A.oldestTask, C.scope, C.oldestTask, h.formatters.parameter, "tween info")
					end
					j(A, true)
					return A
				end
				function s.get(v)
					return g.logError("stateGetWasRemoved")
				end
				function s._evaluate(v)
					local w = k(v._goal)
					if w == nil then
						v._EXTREMELY_DANGEROUS_usedAsValue = v._goal
						return false
					end
					i(v, w)
					local x = l(w)
					if x ~= x then
						g.logWarn("tweenNanGoal")
						return false
					end
					local y, z = v._stopwatch, (l(v._tweenInfo))
					if v._activeTo ~= x or (v._activeElapsed < v._activeDuration and v._activeTweenInfo ~= z) then
						v._activeDuration = q(z)
						v._activeFrom = v._EXTREMELY_DANGEROUS_usedAsValue
						v._activeTo = x
						v._activeTweenInfo = z
						y:zero()
						y:unpause()
					end
					i(v, y)
					v._activeElapsed = l(y)
					if v._activeFrom == v._activeTo or v._activeElapsed >= v._activeDuration or typeof(v._activeTo) ~= typeof(v._activeFrom) then
						v._activeFrom = v._activeTo
						v._activeElapsed = v._activeDuration
						y:pause()
					end
					local A, B = p(z, v._activeElapsed), v._EXTREMELY_DANGEROUS_usedAsValue
					local C = (o(v._activeFrom, v._activeTo, A))
					if C ~= C then
						g.logWarn("tweenNanMotion")
						C = v._activeTo
					end
					v._EXTREMELY_DANGEROUS_usedAsValue = C
					return B ~= C
				end
				table.freeze(s)
				return u
			end)()
		end,
		[11] = function()
			a(11)
			return (function(...)
				local b, c = game:GetService("TweenService"), function(b)
					if b.RepeatCount <= -1 then
						return math.huge
					end
					local c = b.DelayTime + b.Time
					if b.Reverses then
						c += b.Time
					end
					c *= b.RepeatCount + 1
					return c
				end
				return c
			end)()
		end,
		[12] = function()
			a(12)
			return (function(...)
				local b = (game:GetService("TweenService"))
				local c = function(c, d)
					local e, f, g, h, i, j = c.DelayTime, c.Time, c.Reverses, 1 + c.RepeatCount, c.EasingStyle, c.EasingDirection
					local k = e + f
					if g then
						k += f
					end
					if d == math.huge then
						return 1
					end
					if d >= k * h and c.RepeatCount > -1 then
						return 1
					end
					local l = d % k
					if l <= e then
						return 0
					end
					local m = (l - e) / f
					if m > 1 then
						m = 2 - m
					end
					local n = b:GetValue(m, i, j)
					return n
				end
				return c
			end)()
		end,
		[13] = function()
			local b, c, d = a(13)
			return (function(...)
				local e = c.Parent.Parent
				local f = d(e.Colour.Oklab)
				local g = function(g, h, i)
					local j = typeof(g)
					if typeof(h) == j then
						if j == "number" then
							local k, l = h, g
							return (k - l) * i + l
						elseif j == "CFrame" then
							local k, l = h, g
							return l:Lerp(k, i)
						elseif j == "Color3" then
							local k, l = h, g
							local m, n = f.fromSRGB(l), f.fromSRGB(k)
							return f.toSRGB(m:Lerp(n, i), false)
						elseif j == "ColorSequenceKeypoint" then
							local k, l = h, g
							local m, n = f.fromSRGB(l.Value), f.fromSRGB(k.Value)
							return ColorSequenceKeypoint.new((k.Time - l.Time) * i + l.Time, f.toSRGB(m:Lerp(n, i), false))
						elseif j == "DateTime" then
							local k, l = h, g
							return DateTime.fromUnixTimestampMillis((k.UnixTimestampMillis - l.UnixTimestampMillis) * i + l.UnixTimestampMillis)
						elseif j == "NumberRange" then
							local k, l = h, g
							return NumberRange.new((k.Min - l.Min) * i + l.Min, (k.Max - l.Max) * i + l.Max)
						elseif j == "NumberSequenceKeypoint" then
							local k, l = h, g
							return NumberSequenceKeypoint.new((k.Time - l.Time) * i + l.Time, (k.Value - l.Value) * i + l.Value, (k.Envelope - l.Envelope) * i + l.Envelope)
						elseif j == "PhysicalProperties" then
							local k, l = h, g
							return PhysicalProperties.new((k.Density - l.Density) * i + l.Density, (k.Friction - l.Friction) * i + l.Friction, (k.Elasticity - l.Elasticity) * i + l.Elasticity, (k.FrictionWeight - l.FrictionWeight) * i + l.FrictionWeight, (k.ElasticityWeight - l.ElasticityWeight) * i + l.ElasticityWeight)
						elseif j == "Ray" then
							local k, l = h, g
							return Ray.new(l.Origin:Lerp(k.Origin, i), l.Direction:Lerp(k.Direction, i))
						elseif j == "Rect" then
							local k, l = h, g
							return Rect.new(l.Min:Lerp(k.Min, i), l.Max:Lerp(k.Max, i))
						elseif j == "Region3" then
							local k, l = h, g
							local m, n = l.CFrame.Position:Lerp(k.CFrame.Position, i), l.Size:Lerp(k.Size, i) / 2
							return Region3.new(m - n, m + n)
						elseif j == "Region3int16" then
							local k, l = h, g
							return Region3int16.new(Vector3int16.new((k.Min.X - l.Min.X) * i + l.Min.X, (k.Min.Y - l.Min.Y) * i + l.Min.Y, (k.Min.Z - l.Min.Z) * i + l.Min.Z), Vector3int16.new((k.Max.X - l.Max.X) * i + l.Max.X, (k.Max.Y - l.Max.Y) * i + l.Max.Y, (k.Max.Z - l.Max.Z) * i + l.Max.Z))
						elseif j == "UDim" then
							local k, l = h, g
							return UDim.new((k.Scale - l.Scale) * i + l.Scale, (k.Offset - l.Offset) * i + l.Offset)
						elseif j == "UDim2" then
							local k, l = h, g
							return l:Lerp(k, i)
						elseif j == "Vector2" then
							local k, l = h, g
							return l:Lerp(k, i)
						elseif j == "Vector2int16" then
							local k, l = h, g
							return Vector2int16.new((k.X - l.X) * i + l.X, (k.Y - l.Y) * i + l.Y)
						elseif j == "Vector3" then
							local k, l = h, g
							return l:Lerp(k, i)
						elseif j == "Vector3int16" then
							local k, l = h, g
							return Vector3int16.new((k.X - l.X) * i + l.X, (k.Y - l.Y) * i + l.Y, (k.Z - l.Z) * i + l.Z)
						end
					end
					if i < 0.5 then
						return g
					else
						return h
					end
				end
				return g
			end)()
		end,
		[14] = function()
			local b, c, d = a(14)
			return (function(...)
				local e = c.Parent.Parent
				local f, g = d(e.Types), d(e.Colour.Oklab)
				local h = function(h, i)
					if i == "number" then
						return h[1]
					elseif i == "CFrame" then
						return CFrame.new(h[1], h[2], h[3]) * CFrame.fromAxisAngle(Vector3.new(h[4], h[5], h[6]).Unit, h[7])
					elseif i == "Color3" then
						return g.toSRGB(Vector3.new(h[1], h[2], h[3]), false)
					elseif i == "ColorSequenceKeypoint" then
						return ColorSequenceKeypoint.new(h[4], g.toSRGB(Vector3.new(h[1], h[2], h[3]), false))
					elseif i == "DateTime" then
						return DateTime.fromUnixTimestampMillis(h[1])
					elseif i == "NumberRange" then
						return NumberRange.new(h[1], h[2])
					elseif i == "NumberSequenceKeypoint" then
						return NumberSequenceKeypoint.new(h[2], h[1], h[3])
					elseif i == "PhysicalProperties" then
						return PhysicalProperties.new(h[1], h[2], h[3], h[4], h[5])
					elseif i == "Ray" then
						return Ray.new(Vector3.new(h[1], h[2], h[3]), Vector3.new(h[4], h[5], h[6]))
					elseif i == "Rect" then
						return Rect.new(h[1], h[2], h[3], h[4])
					elseif i == "Region3" then
						local j, k = Vector3.new(h[1], h[2], h[3]), Vector3.new(h[4] / 2, h[5] / 2, h[6] / 2)
						return Region3.new(j - k, j + k)
					elseif i == "Region3int16" then
						return Region3int16.new(Vector3int16.new(h[1], h[2], h[3]), Vector3int16.new(h[4], h[5], h[6]))
					elseif i == "UDim" then
						return UDim.new(h[1], h[2])
					elseif i == "UDim2" then
						return UDim2.new(h[1], h[2], h[3], h[4])
					elseif i == "Vector2" then
						return Vector2.new(h[1], h[2])
					elseif i == "Vector2int16" then
						return Vector2int16.new(h[1], h[2])
					elseif i == "Vector3" then
						return Vector3.new(h[1], h[2], h[3])
					elseif i == "Vector3int16" then
						return Vector3int16.new(h[1], h[2], h[3])
					else
						return nil
					end
				end
				return h
			end)()
		end,
		[15] = function()
			a(15)
			return (function(...)
				local b = function(b, c, d)
					if b == 0 or d == 0 then
						return 1, 0, 0, 1
					end
					local e, f, g, h
					if c > 1 then
						local i = math.sqrt(c ^ 2 - 1)
						local j, k, l = -0.5 / (i * d), d * (i + c) * -1, d * (i - c)
						local m, n = math.exp(b * k), math.exp(b * l)
						e = (n * k - m * l) * j
						f = (m - n) * j / d
						g = (n - m) * j * d
						h = (m * k - n * l) * j
					elseif c == 1 then
						local i = b * d
						local j = i * -1
						local k = math.exp(j)
						e = k * (i + 1)
						f = k * b
						g = k * (j * d)
						h = k * (j + 1)
					else
						local i = d * math.sqrt(1 - c ^ 2)
						local j, k, l, m = 1 / i, math.exp(-1 * b * d * c), math.sin(i * b), math.cos(i * b)
						local n, o = k * l, k * m
						local p = n * d * c * j
						e = p + o
						f = n * j
						g = -1 * (n * i + d * c * p)
						h = o - p
					end
					return e, f, g, h
				end
				return b
			end)()
		end,
		[16] = function()
			local b, c, d = a(16)
			return (function(...)
				local e = c.Parent.Parent
				local f = d(e.Colour.Oklab)
				local g = function(g, h)
					if h == "number" then
						local i = g
						return { i }
					elseif h == "CFrame" then
						local i = g
						local j, k = i:ToAxisAngle()
						return { i.X, i.Y, i.Z, j.X, j.Y, j.Z, k }
					elseif h == "Color3" then
						local i = g
						local j = f.fromSRGB(i)
						return { j.X, j.Y, j.Z }
					elseif h == "ColorSequenceKeypoint" then
						local i = g
						local j = f.fromSRGB(i.Value)
						return { j.X, j.Y, j.Z, i.Time }
					elseif h == "DateTime" then
						local i = g
						return { i.UnixTimestampMillis }
					elseif h == "NumberRange" then
						local i = g
						return { i.Min, i.Max }
					elseif h == "NumberSequenceKeypoint" then
						local i = g
						return { i.Value, i.Time, i.Envelope }
					elseif h == "PhysicalProperties" then
						local i = g
						return { i.Density, i.Friction, i.Elasticity, i.FrictionWeight, i.ElasticityWeight }
					elseif h == "Ray" then
						local i = g
						return { i.Origin.X, i.Origin.Y, i.Origin.Z, i.Direction.X, i.Direction.Y, i.Direction.Z }
					elseif h == "Rect" then
						local i = g
						return { i.Min.X, i.Min.Y, i.Max.X, i.Max.Y }
					elseif h == "Region3" then
						local i = g
						return { i.CFrame.X, i.CFrame.Y, i.CFrame.Z, i.Size.X, i.Size.Y, i.Size.Z }
					elseif h == "Region3int16" then
						local i = g
						return { i.Min.X, i.Min.Y, i.Min.Z, i.Max.X, i.Max.Y, i.Max.Z }
					elseif h == "UDim" then
						local i = g
						return { i.Scale, i.Offset }
					elseif h == "UDim2" then
						local i = g
						return { i.X.Scale, i.X.Offset, i.Y.Scale, i.Y.Offset }
					elseif h == "Vector2" then
						local i = g
						return { i.X, i.Y }
					elseif h == "Vector2int16" then
						local i = g
						return { i.X, i.Y }
					elseif h == "Vector3" then
						local i = g
						return { i.X, i.Y, i.Z }
					elseif h == "Vector3int16" then
						local i = g
						return { i.X, i.Y, i.Z }
					else
						return {}
					end
				end
				return g
			end)()
		end,
		[18] = function()
			local b, c, d = a(18)
			return (function(...)
				local e, f = d(c.Parent.sRGB), {}
				function f.fromLinear(g)
					local h, i, j = g.R * 0.4122214708 + g.G * 0.5363325363 + g.B * 0.0514459929, g.R * 0.2119034982 + g.G * 0.6806995451 + g.B * 0.1073969566, g.R * 0.0883024619 + g.G * 0.2817188376 + g.B * 0.6299787005
					local k, l, m = h ^ 0.3333333333333333, i ^ 0.3333333333333333, j ^ 0.3333333333333333
					return Vector3.new(k * 0.2104542553 + l * 0.793617785 - m * 0.0040720468, k * 1.9779984951 - l * 2.428592205 + m * 0.4505937099, k * 0.0259040371 + l * 0.7827717662 - m * 0.808675766)
				end
				function f.fromSRGB(g)
					return f.fromLinear(e.toLinear(g))
				end
				function f.toLinear(g, h)
					local i, j, k = g.X + g.Y * 0.3963377774 + g.Z * 0.2158037573, g.X - g.Y * 0.1055613458 - g.Z * 0.0638541728, g.X - g.Y * 0.0894841775 - g.Z * 1.291485548
					local l, m, n = i ^ 3, j ^ 3, k ^ 3
					local o, p, q = l * 4.0767416621 - m * 3.3077115913 + n * 0.2309699292, l * -1.2684380046 + m * 2.6097574011 - n * 0.3413193965, l * -4.1960863E-3 - m * 0.7034186147 + n * 1.707614701
					if not h then
						o = math.clamp(o, 0, 1)
						p = math.clamp(p, 0, 1)
						q = math.clamp(q, 0, 1)
					end
					return Color3.new(o, p, q)
				end
				function f.toSRGB(g, h)
					return e.fromLinear(f.toLinear(g, h))
				end
				return f
			end)()
		end,
		[19] = function()
			a(19)
			return (function(...)
				local b, c, d = {}, function(b)
					if b >= 0.04045 then
						return ((b + 0.055) / 1.055) ^ 2.4
					else
						return b / 12.92
					end
				end, function(b)
					if b >= 0.0031308 then
						return 1.055 * b ^ 0.4166666666666667 - 0.055
					else
						return 12.92 * b
					end
				end
				function b.fromLinear(e)
					return Color3.new(c(e.R), c(e.G), c(e.B))
				end
				function b.toLinear(e)
					return Color3.new(d(e.R), d(e.G), d(e.B))
				end
				return b
			end)()
		end,
		[20] = function()
			local b, c, d = a(20)
			return (function(...)
				local e = c.Parent
				local f, g, h, i = d(e.Logging.formatError), d(e.Types), {}, false
				h.safetyTimerMultiplier = 1
				local j, k, l = {}, 0
				function h.setExternalProvider(m)
					local n = l
					if n ~= nil then
						n.stopScheduler()
					end
					l = m
					if m ~= nil then
						m.startScheduler()
					end
					return n
				end
				function h.isTimeCritical()
					return i
				end
				function h.doTaskImmediate(m)
					if l == nil then
						h.logError("noTaskScheduler")
					else
						l.doTaskImmediate(m)
					end
				end
				function h.doTaskDeferred(m)
					if l == nil then
						h.logError("noTaskScheduler")
					else
						l.doTaskDeferred(m)
					end
				end
				function h.logError(m, n, ...)
					error(f(l, m, n, ...), 0)
				end
				function h.logErrorNonFatal(m, n, ...)
					local o = f(l, m, n, ...)
					if l ~= nil then
						l.logErrorNonFatal(o)
					else
						print(o)
					end
				end
				function h.logWarn(m, ...)
					local n = f(l, m, debug.traceback(nil, 2), ...)
					if l ~= nil then
						l.logWarn(n)
					else
						print(n)
					end
				end
				function h.bindToUpdateStep(m)
					local n = {}
					j[n] = m
					return function()
						j[n] = nil
					end
				end
				function h.performUpdateStep(m)
					k = m
					for n, o in j do
						o(m)
					end
				end
				function h.lastUpdateStep()
					return k
				end
				return h
			end)()
		end,
		[21] = function()
			local b, c, d = a(21)
			return (function(...)
				local e = c.Parent
				local f, g = d(e.Types), {}
				function g.setDebugger(h)
					local i = currentProvider
					if i ~= nil then
						i.stopDebugging()
					end
					currentProvider = h
					if h ~= nil then
						h.startDebugging()
					end
					return i
				end
				function g.trackScope(h)
					if currentProvider == nil then
						return
					end
					currentProvider.trackScope(h)
				end
				function g.untrackScope(h)
					if currentProvider == nil then
						return
					end
					currentProvider.trackScope(h)
				end
				return g
			end)()
		end,
		[23] = function()
			local b, c, d = a(23)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l = d(e.Types), d(e.External), d(e.Memory.checkLifetime), d(e.Graph.castToGraph), d(e.Graph.depend), d(e.Graph.evaluate), d(e.Utility.nicknames)
				local m = {}
				m.type = "Observer"
				m.timeliness = "eager"
				m.dependentSet = table.freeze({})
				local n = table.freeze({ __index = m })
				local o = function(o, p)
					local q = os.clock()
					if p == nil then
						g.logError("scopeMissing", nil, "Observers", "myScope:Observer(watching)")
					end
					local r = (setmetatable({ scope = o, createdAt = q, dependencySet = {}, lastChange = nil, validity = "invalid", _watchingGraph = i(p), _changeListeners = {} }, n))
					local s = function()
						r.scope = nil
						for s in pairs(r.dependencySet) do
							s.dependentSet[r] = nil
						end
					end
					r.oldestTask = s
					l[r.oldestTask] = "Observer"
					table.insert(o, s)
					if r._watchingGraph ~= nil then
						h.bOutlivesA(o, r.oldestTask, r._watchingGraph.scope, r._watchingGraph.oldestTask, h.formatters.observer)
					end
					k(r, true)
					return r
				end
				function m.onBind(p, q)
					g.doTaskImmediate(q)
					return p:onChange(q)
				end
				function m.onChange(p, q)
					local r = table.freeze({})
					p._changeListeners[r] = q
					return function()
						p._changeListeners[r] = nil
					end
				end
				function m._evaluate(p)
					if p._watchingGraph ~= nil then
						j(p, p._watchingGraph)
					end
					for q, r in p._changeListeners do
						g.doTaskImmediate(r)
					end
					return true
				end
				table.freeze(m)
				return o
			end)()
		end,
		[24] = function()
			local b, c, d = a(24)
			return (function(...)
				local e = c.Parent.Parent
				local f, g = d(e.Types), function(f)
					if typeof(f) == "table" and typeof(f.validity) == "string" and typeof(f.timeliness) == "string" and typeof(f.dependencySet) == "table" and typeof(f.dependentSet) == "table" then
						return f
					else
						return nil
					end
				end
				return g
			end)()
		end,
		[25] = function()
			local b, c, d = a(25)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i = d(e.Types), d(e.External), d(e.Graph.evaluate), 1
				local j = function(j)
					if j.validity == "busy" then
						return g.logError("infiniteLoop")
					end
					local k = h(j, true)
					if not k then
						return
					end
					local l, m, n = {}, {}, {}
					l[1] = j
					local o = os.clock() + i * g.safetyTimerMultiplier
					repeat
						if os.clock() > o then
							return g.logError("infiniteLoop")
						end
						local p = true
						for q, r in l do
							for s in r.dependentSet do
								if s.validity == "valid" then
									p = false
									table.insert(n, s)
									table.insert(m, s)
								elseif s.validity == "busy" then
									return g.logError("infiniteLoop")
								end
							end
						end
						l, m = m, l
						table.clear(m)
					until p
					local p = {}
					for q, r in n do
						r.validity = "invalid"
						if r.timeliness == "eager" then
							table.insert(p, r)
						end
					end
					table.sort(p, function(q, r)
						return q.createdAt < r.createdAt
					end)
					for q, r in p do
						h(r, false)
					end
				end
				return j
			end)()
		end,
		[26] = function()
			local b, c, d = a(26)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i = d(e.Types), d(e.External), d(e.Graph.evaluate), d(e.Utility.nameOf)
				local j = function(j, k)
					h(k, false)
					if table.isfrozen(j.dependencySet) or table.isfrozen(k.dependentSet) then
						g.logError("cannotDepend", nil, i(j, "Dependent"), i(k, "dependency"))
					end
					k.dependentSet[j] = true
					j.dependencySet[k] = true
				end
				return j
			end)()
		end,
		[27] = function()
			local b, c, d = a(27)
			return (function(...)
				local e = c.Parent.Parent
				local f, g = d(e.Types), d(e.External)
				local function h(i, j)
					if i.validity == "busy" then
						return g.logError("infiniteLoop")
					end
					local k, l = i.lastChange == nil, i.validity == "invalid"
					if k or l or j then
						local m = k or j
						if not m then
							for n in i.dependencySet do
								h(n, false)
								if n.lastChange > i.lastChange then
									m = true
									break
								end
							end
						end
						local n = false
						if m then
							for o in i.dependencySet do
								o.dependentSet[i] = nil
								i.dependencySet[o] = nil
							end
							i.validity = "busy"
							n = i:_evaluate() or k
						end
						if n then
							i.lastChange = os.clock()
						end
						i.validity = "valid"
						return n
					else
						return false
					end
				end
				return h
			end)()
		end,
		[29] = function()
			local b, c, d = a(29)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k = d(e.Types), d(e.Memory.checkLifetime), d(e.Graph.Observer), d(e.State.castToState), d(e.State.peek), {}
				local l = function(l)
					local m = k[l]
					if m == nil then
						m = {
							type = "SpecialKey",
							kind = "Attribute",
							stage = "self",
							apply = function(n, o, p, q)
								if i(p) then
									local r = p
									g.bOutlivesA(o, q, r.scope, r.oldestTask, g.formatters.boundAttribute, l)
									h(o, r):onBind(function()
										q:SetAttribute(l, j(r))
									end)
								else
									q:SetAttribute(l, p)
								end
							end,
						}
						k[l] = m
					end
					return m
				end
				return l
			end)()
		end,
		[30] = function()
			local b, c, d = a(30)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.External), {}
				local i = function(i)
					local j = h[i]
					if j == nil then
						j = {
							type = "SpecialKey",
							kind = "AttributeChange",
							stage = "observer",
							apply = function(k, l, m, n)
								if typeof(m) ~= "function" then
									g.logError("invalidAttributeChangeHandler", nil, i)
								end
								local o, p = m, n:GetAttributeChangedSignal(i)
								table.insert(
									l,
									p:Connect(function()
										o((n):GetAttribute(i))
									end)
								)
							end,
						}
						h[i] = j
					end
					return j
				end
				return i
			end)()
		end,
		[31] = function()
			local b, c, d = a(31)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j = d(e.Types), d(e.External), d(e.Memory.checkLifetime), d(e.State.castToState), {}
				local k = function(k)
					local l = j[k]
					if l == nil then
						l = {
							type = "SpecialKey",
							kind = "AttributeOut",
							stage = "observer",
							apply = function(m, n, o, p)
								local q = p:GetAttributeChangedSignal(k)
								if not i(o) then
									g.logError("invalidAttributeOutType")
								end
								local r = o
								if r.kind ~= "Value" then
									g.logError("invalidAttributeOutType")
								end
								local s = r
								h.bOutlivesA(n, p, s.scope, s.oldestTask, h.formatters.attributeOutputsTo, k)
								s:set((p):GetAttribute(k))
								table.insert(
									n,
									q:Connect(function()
										s:set((p):GetAttribute(k))
									end)
								)
							end,
						}
						j[k] = l
					end
					return l
				end
				return k
			end)()
		end,
		[32] = function()
			local b, c, d = a(32)
			return (function(...)
				local e = c.Parent.Parent
				local f, g = d(e.Types), function(f)
					return f
				end
				return g
			end)()
		end,
		[33] = function()
			local b, c, d = a(33)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k = d(e.Types), d(e.External), d(e.Graph.Observer), d(e.State.peek), d(e.State.castToState), d(e.Memory.doCleanup)
				local l = false
				return {
					type = "SpecialKey",
					kind = "Children",
					stage = "descendants",
					apply = function(m, n, o, p)
						local q, s, t, u = {}, {}, {}, {}
						local function v()
							s, q = q, s
							u, t = t, u
							local function w(x, y)
								local z = typeof(x)
								if z == "Instance" then
									local A = x
									q[A] = true
									if s[A] == nil then
										A.Parent = p
									else
										s[A] = nil
									end
									if l and y ~= nil then
										A.Name = y
									end
								elseif j(x) then
									local A = x
									local B = i(A)
									if B ~= nil then
										w(B, y)
									end
									local C = u[A]
									if C == nil then
										C = {}
										h(C, A):onChange(v)
									else
										u[A] = nil
									end
									t[A] = C
								elseif z == "table" then
									local A = x
									for B, C in pairs(A) do
										local D, E = (typeof(B))
										if D == "string" then
											local F = B
											E = F
										elseif D == "number" and y ~= nil then
											local F = B
											E = y .. "_" .. F
										end
										w(C, E)
									end
								else
									g.logWarn("unrecognisedChildType", z)
								end
							end
							if o ~= nil then
								w(o)
							end
							for x in pairs(s) do
								x.Parent = nil
							end
							table.clear(s)
							for x, y in pairs(u) do
								k(y)
							end
							table.clear(u)
						end
						table.insert(n, function()
							o = nil
							v()
						end)
						v()
					end,
				}
			end)()
		end,
		[34] = function()
			local b, c, d = a(34)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.External), d(e.Instances.applyInstanceProps)
				local i = function(i, j)
					if j == nil then
						g.logError("scopeMissing", nil, "instances using Hydrate", "myScope:Hydrate (instance) { ... }")
					end
					return function(k)
						table.insert(i, j)
						h(i, k, j)
						return j
					end
				end
				return i
			end)()
		end,
		[35] = function()
			local b, c, d = a(35)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i = d(e.Types), d(e.External), d(e.Instances.defaultProps), d(e.Instances.applyInstanceProps)
				local j = function(j, k)
					if k == nil then
						local l = j
						g.logError("scopeMissing", nil, "instances using New", 'myScope:New "' .. l .. '" { ... }')
					end
					return function(l)
						local m, n = pcall(Instance.new, k)
						if not m then
							g.logError("cannotCreateClass", nil, k)
						end
						local o = h[k]
						if o ~= nil then
							for p, q in pairs(o) do
								(n)[p] = q
							end
						end
						table.insert(j, n)
						i(j, l, n)
						return n
					end
				end
				return j
			end)()
		end,
		[36] = function()
			local b, c, d = a(36)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.External), {}
				local i = function(i)
					local j = h[i]
					if j == nil then
						j = {
							type = "SpecialKey",
							kind = "OnChange",
							stage = "observer",
							apply = function(k, l, m, n)
								local o, p = pcall(n.GetPropertyChangedSignal, n, i)
								if not o then
									g.logError("cannotConnectChange", nil, n.ClassName, i)
								elseif typeof(m) ~= "function" then
									g.logError("invalidChangeHandler", nil, i)
								else
									local q = m
									table.insert(
										l,
										p:Connect(function()
											q((n)[i])
										end)
									)
								end
							end,
						}
						h[i] = j
					end
					return j
				end
				return i
			end)()
		end,
		[37] = function()
			local b, c, d = a(37)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i = d(e.Types), d(e.External), {}, function(f, g)
					return (f)[g]
				end
				local j = function(j)
					local k = h[j]
					if k == nil then
						k = {
							type = "SpecialKey",
							kind = "OnEvent",
							stage = "observer",
							apply = function(l, m, n, o)
								local p, q = pcall(i, o, j)
								if not p or typeof(q) ~= "RBXScriptSignal" then
									g.logError("cannotConnectEvent", nil, o.ClassName, j)
								elseif typeof(n) ~= "function" then
									g.logError("invalidEventHandler", nil, j)
								else
									table.insert(m, q:Connect(n))
								end
							end,
						}
						h[j] = k
					end
					return k
				end
				return j
			end)()
		end,
		[38] = function()
			local b, c, d = a(38)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j = d(e.Types), d(e.External), d(e.Memory.checkLifetime), d(e.State.castToState), {}
				local k = function(k)
					local l = j[k]
					if l == nil then
						l = {
							type = "SpecialKey",
							kind = "Out",
							stage = "observer",
							apply = function(m, n, o, p)
								local q, s = pcall(p.GetPropertyChangedSignal, p, k)
								if not q then
									g.logError("invalidOutProperty", nil, p.ClassName, k)
								end
								if not i(o) then
									g.logError("invalidOutType")
								end
								local t = o
								if t.kind ~= "Value" then
									g.logError("invalidOutType")
								end
								local u = t
								h.bOutlivesA(n, p, u.scope, u.oldestTask, h.formatters.propertyOutputsTo, k)
								u:set((p)[k])
								table.insert(
									n,
									s:Connect(function()
										u:set((p)[k])
									end)
								)
							end,
						}
						j[k] = l
					end
					return l
				end
				return k
			end)()
		end,
		[39] = function()
			local b, c, d = a(39)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n, o = d(e.Types), d(e.External), d(e.Logging.parseError), d(e.Memory.checkLifetime), d(e.Graph.Observer), d(e.State.castToState), d(e.State.peek), d(e.Utility.xtypeof), function(f, g, h)
					(f)[g] = h
				end, function(f, g)
					(f)[g] = (f)[g]
				end
				local p = function(p, q, s)
					local u, v = xpcall(n, h, p, q, s)
					if not u then
						if not pcall(o, p, q) then
							g.logErrorNonFatal("cannotAssignProperty", nil, p.ClassName, q)
						else
							local w, x = typeof(s), typeof((p)[q])
							if w == x then
								g.logErrorNonFatal("propertySetError", v)
							else
								g.logErrorNonFatal("invalidPropertyType", nil, p.ClassName, q, x, w)
							end
						end
					end
				end
				local q = function(q, s, u, v)
					if k(v) then
						local w = v
						i.bOutlivesA(q, s, w.scope, w.oldestTask, i.formatters.boundProperty, u)
						j(q, w):onBind(function()
							p(s, u, l(w))
						end)
					else
						p(s, u, v)
					end
				end
				local s = function(s, u, v)
					local w = {
						self = {},
						descendants = {},
						ancestor = {},
						observer = {},
					}
					for x, y in pairs(u) do
						local z = m(x)
						if z == "string" then
							if x ~= "Parent" then
								q(s, v, x, y)
							end
						elseif z == "SpecialKey" then
							local A = (x).stage
							local B = w[A]
							if B == nil then
								g.logError("unrecognisedPropertyStage", nil, A)
							else
								B[x] = y
							end
						else
							g.logError("unrecognisedPropertyKey", nil, z)
						end
					end
					for x, y in pairs(w.self) do
						x:apply(s, y, v)
					end
					for x, y in pairs(w.descendants) do
						x:apply(s, y, v)
					end
					if u.Parent ~= nil then
						q(s, v, "Parent", u.Parent)
					end
					for x, y in pairs(w.ancestor) do
						x:apply(s, y, v)
					end
					for x, y in pairs(w.observer) do
						x:apply(s, y, v)
					end
				end
				return s
			end)()
		end,
		[40] = function()
			a(40)
			return (function(...)
				return { ScreenGui = { ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, BillboardGui = { ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, Active = true }, SurfaceGui = { ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud, PixelsPerStud = 50 }, Frame = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0 }, ScrollingFrame = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, ScrollBarImageColor3 = Color3.new(0, 0, 0) }, TextLabel = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderColor3 = Color3.new(0, 0, 0),
					BorderSizePixel = 0,
					Font = Enum.Font.SourceSans,
					Text = "",
					TextColor3 = Color3.new(0, 0, 0),
					TextSize = 14,
				}, TextButton = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, AutoButtonColor = false, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.new(0, 0, 0), TextSize = 14 }, TextBox = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, ClearTextOnFocus = false, Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.new(0, 0, 0), TextSize = 14 }, ImageLabel = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0 }, ImageButton = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, AutoButtonColor = false }, ViewportFrame = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0 }, VideoFrame = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0 }, CanvasGroup = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0 }, SpawnLocation = { Duration = 0 }, BoxHandleAdornment = { ZIndex = 0 }, ConeHandleAdornment = { ZIndex = 0 }, CylinderHandleAdornment = { ZIndex = 0 }, ImageHandleAdornment = { ZIndex = 0 }, LineHandleAdornment = { ZIndex = 0 }, SphereHandleAdornment = { ZIndex = 0 }, WireframeHandleAdornment = { ZIndex = 0 }, Part = { Anchored = true, Size = Vector3.one, FrontSurface = Enum.SurfaceType.Smooth, BackSurface = Enum.SurfaceType.Smooth, LeftSurface = Enum.SurfaceType.Smooth, RightSurface = Enum.SurfaceType.Smooth, TopSurface = Enum.SurfaceType.Smooth, BottomSurface = Enum.SurfaceType.Smooth }, TrussPart = { Anchored = true, Size = Vector3.one * 2, FrontSurface = Enum.SurfaceType.Smooth, BackSurface = Enum.SurfaceType.Smooth, LeftSurface = Enum.SurfaceType.Smooth, RightSurface = Enum.SurfaceType.Smooth, TopSurface = Enum.SurfaceType.Smooth, BottomSurface = Enum.SurfaceType.Smooth }, MeshPart = { Anchored = true, Size = Vector3.one, FrontSurface = Enum.SurfaceType.Smooth, BackSurface = Enum.SurfaceType.Smooth, LeftSurface = Enum.SurfaceType.Smooth, RightSurface = Enum.SurfaceType.Smooth, TopSurface = Enum.SurfaceType.Smooth, BottomSurface = Enum.SurfaceType.Smooth }, CornerWedgePart = { Anchored = true, Size = Vector3.one, FrontSurface = Enum.SurfaceType.Smooth, BackSurface = Enum.SurfaceType.Smooth, LeftSurface = Enum.SurfaceType.Smooth, RightSurface = Enum.SurfaceType.Smooth, TopSurface = Enum.SurfaceType.Smooth, BottomSurface = Enum.SurfaceType.Smooth }, VehicleSeat = { Anchored = true, Size = Vector3.one, FrontSurface = Enum.SurfaceType.Smooth, BackSurface = Enum.SurfaceType.Smooth, LeftSurface = Enum.SurfaceType.Smooth, RightSurface = Enum.SurfaceType.Smooth, TopSurface = Enum.SurfaceType.Smooth, BottomSurface = Enum.SurfaceType.Smooth } }
			end)()
		end,
		[42] = function()
			local b, c, d = a(42)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.Logging.messages), "https://elttob.uk/Fusion/0.3/api-reference/general/errors/#"
				local i = function(i, j, k, ...)
					local l, m, n, o = j, if typeof(k) == "table" then k else nil, if typeof(k) == "table" then k.trace else k, g[j]
					if o == nil then
						j = "unknownMessage"
						o = g[j]
					end
					o = o:format(...)
					if m ~= nil then
						o = o:gsub("ERROR_MESSAGE", m.message)
						if m.context ~= nil then
							o ..= ` ({m.context})`
						end
					else
						o = o:gsub("ERROR_MESSAGE", l)
					end
					o = `[Fusion] {o} \nID: {j}`
					if i ~= nil and i.policies.allowWebLinks then
						o ..= `\nLearn more: {h}{j:lower()}`
					end
					if n ~= nil then
						o ..= ` \n---- Stack trace ----\n{n}`
					end
					return o:gsub("\n", "\n    ")
				end
				return i
			end)()
		end,
		[43] = function()
			a(43)
			return (function(...)
				return {
					callbackError = "Error in callback:\nERROR_MESSAGE",
					cannotAssignProperty = "The class type '%s' has no assignable property '%s'.",
					cannotConnectChange = "The %s class doesn't have a property called '%s'.",
					cannotConnectEvent = "The %s class doesn't have an event called '%s'.",
					cannotCreateClass = "Can't create a new instance of class '%s'.",
					cannotDepend = "%s can't depend on %s.",
					cleanupWasRenamed = [[`Fusion.cleanup` was renamed to `Fusion.doCleanup`. This will be an error in future versions of Fusion.]],
					destroyedTwice = [[`doCleanup()` was given something that it is already cleaning up. Unclear how to proceed.]],
					destructorRedundant = [[%s destructors no longer do anything. If you wish to run code on destroy, `table.insert` a function into the `scope` argument. See discussion #292 on GitHub for advice.]],
					forKeyCollision = [[The key '%s' was returned multiple times simultaneously, which is not allowed in `For` objects.]],
					infiniteLoop = [[Detected an infinite loop. Consider adding an explicit breakpoint to your code to prevent a cyclic dependency.]],
					invalidAttributeChangeHandler = [[The change handler for the '%s' attribute must be a function.]],
					invalidAttributeOutType = "[AttributeOut] properties must be given Value objects.",
					invalidChangeHandler = [[The change handler for the '%s' property must be a function.]],
					invalidEventHandler = "The handler for the '%s' event must be a function.",
					invalidOutProperty = "The %s class doesn't have a property called '%s'.",
					invalidOutType = "[Out] properties must be given Value objects.",
					invalidPropertyType = "'%s.%s' expected a '%s' type, but got a '%s' type.",
					invalidRefType = "Instance refs must be Value objects.",
					invalidSpringDamping = [[The damping ratio for a spring must be >= 0. (damping was %.2f)]],
					invalidSpringSpeed = "The speed of a spring must be >= 0. (speed was %.2f)",
					mergeConflict = "Multiple definitions for '%s' found while merging.",
					mistypedSpringDamping = "The damping ratio for a spring must be a number. (got a %s)",
					mistypedSpringSpeed = "The speed of a spring must be a number. (got a %s)",
					mistypedTweenInfo = "The tween info of a tween must be a TweenInfo. (got a %s)",
					noTaskScheduler = "Fusion is not connected to an external task scheduler.",
					poisonedScope = "Attempted to use a scope after it's been destroyed; %s",
					possiblyOutlives = [[%s will be destroyed before %s; %s. To fix this, review the order they're created in, and what scopes they belong to. See discussion #292 on GitHub for advice.]],
					propertySetError = "Error setting property:\nERROR_MESSAGE",
					scopeMissing = [[To create %s, provide a scope. (e.g. `%s`). See discussion #292 on GitHub for advice.]],
					springNanGoal = [[A spring was given a NaN goal, so some simulation has been skipped. Ensure no springs have NaN goals.]],
					springNanMotion = [[A spring encountered NaN during motion, so has snapped to the goal position. Ensure no springs have NaN positions or velocities.]],
					springTypeMismatch = "The type '%s' doesn't match the spring's type '%s'.",
					stateGetWasRemoved = [[`StateObject:get()` has been replaced by `use()` and `peek()` - see discussion #217 on GitHub.]],
					tweenNanGoal = [[A tween was given a NaN goal, so some animation has been skipped. Ensure no tweens have NaN goals.]],
					tweenNanMotion = [[A tween encountered NaN during motion, so has snapped to the goal. Ensure no tweens have NaN in their tween infos.]],
					unknownMessage = "Unknown error:\nERROR_MESSAGE",
					unrecognisedChildType = "'%s' type children aren't accepted by `[Children]`.",
					unrecognisedPropertyKey = "'%s' keys aren't accepted in property tables.",
					unrecognisedPropertyStage = [['%s' isn't a valid stage for a special key to be applied at.]],
					useAfterDestroy = [[%s is no longer valid - it was destroyed before %s. See discussion #292 on GitHub for advice.]],
				}
			end)()
		end,
		[44] = function()
			local b, c, d = a(44)
			return (function(...)
				local e = c.Parent.Parent
				local f, g = d(e.Types), function(f)
					return { type = "Error", raw = f, message = f:gsub("^.+:%d+:%s*", ""), trace = debug.traceback(nil, 2) }
				end
				return g
			end)()
		end,
		[46] = function()
			local b, c, d = a(46)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j = d(e.Types), d(e.External), d(e.Memory.whichLivesLonger), d(e.Utility.nameOf), {}
				j.formatters = {}
				function j.formatters.useFunction(k, l)
					local m, n = i(k, "object"), i(l, "object")
					return `The use()-d {n}`, `the {m}`
				end
				function j.formatters.boundProperty(k, l, m)
					local n, o = k.Name, i(l, "value")
					return `The {o} (bound to the {m} property)`, `the {n} instance`
				end
				function j.formatters.boundAttribute(k, l, m)
					local n, o = k.Name, i(l, "value")
					return `The {o} (bound to the {m} attribute)`, `the {n} instance`
				end
				function j.formatters.propertyOutputsTo(k, l, m)
					local n, o = k.Name, i(l, "object")
					return `The {o} (which the {m} property outputs to)`, `the {n} instance`
				end
				function j.formatters.attributeOutputsTo(k, l, m)
					local n, o = k.Name, i(l, "object")
					return `The {o} (which the {m} attribute outputs to)`, `the {n} instance`
				end
				function j.formatters.refOutputsTo(k, l)
					local m, n = k.Name, i(l, "object")
					return `The {n} (which the Ref key outputs to)`, `the {m} instance`
				end
				function j.formatters.animationGoal(k, l)
					local m, n = i(k, "object"), i(l, "object")
					return `The goal {n}`, `the {m} that is following it`
				end
				function j.formatters.parameter(k, l, m)
					local n, o = i(k, "object"), i(l, "object")
					if m == false then
						return `The {o} parameter`, `the {n} that it was used for`
					else
						return `The {o} representing the {m} parameter`, `the {n} that it was used for`
					end
				end
				function j.formatters.observer(k, l)
					local m, n = i(k, "object"), i(l, "object")
					return `The watched {n}`, `the {m} that's observing it for changes`
				end
				function j.bOutlivesA(k, l, m, n, o, ...)
					if m == nil then
						g.logError("useAfterDestroy", nil, o(l, n, ...))
					elseif h(k, l, m, n) == "definitely-a" then
						local p, q = o(l, n, ...)
						g.logWarn("possiblyOutlives", p, q, if k == m then [[they're in the same scope, but the latter is destroyed too quickly]] else [[the latter is in a different scope that gets destroyed too quickly]])
					end
				end
				return j
			end)()
		end,
		[47] = function()
			local b, c, d = a(47)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.ExternalDebug), d(e.Memory.deriveScopeImpl)
				local i = function(...)
					local i = h(...)
					g.trackScope(i)
					return i
				end
				return i
			end)()
		end,
		[48] = function()
			local b, c, d = a(48)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.Utility.merge), d(e.Memory.scopePool)
				local i = function(i, j, ...)
					local k = getmetatable(i)
					if j ~= nil then
						k = table.clone(k)
						k.__index = g(true, {}, k.__index, g(false, {}, j, ...))
					end
					local l = setmetatable((h.reuseAny()) or {}, k)
					return l
				end
				return i
			end)()
		end,
		[49] = function()
			local b, c, d = a(49)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j = d(e.Types), d(e.External), d(e.Memory.scopePool), d(e.Memory.poisonScope), {}
				local function k(l)
					if j[l] then
						return g.logError("destroyedTwice")
					end
					j[l] = true
					if typeof(l) == "Instance" then
						l:Destroy()
					elseif typeof(l) == "RBXScriptConnection" then
						l:Disconnect()
					elseif typeof(l) == "function" then
						l()
					elseif typeof(l) == "table" then
						local m = l
						if typeof(m.destroy) == "function" then
							local n = m
							n:destroy()
						elseif typeof(m.Destroy) == "function" then
							local n = m
							n:Destroy()
						elseif m[1] ~= nil then
							local n = m
							for o = #n, 1, -1 do
								k(n[o])
								n[o] = nil
							end
							if g.isTimeCritical() then
								h.giveIfEmpty(n)
							else
								i(n, [[`doCleanup()` was previously called on this scope. Ensure you are not reusing scopes after cleanup.]])
							end
						end
					end
					j[l] = nil
				end
				return k
			end)()
		end,
		[50] = function()
			local b, c, d = a(50)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.ExternalDebug), d(e.Memory.deriveScopeImpl)
				local i = function(i, ...)
					local j = h(i, ...)
					table.insert(i, j)
					table.insert(j, function()
						local k = table.find(i, j)
						if k ~= nil then
							table.remove(i, k)
						end
					end)
					g.trackScope(j)
					return j
				end
				return i
			end)()
		end,
		[51] = function()
			local b, c, d = a(51)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.External), d(e.Memory.doCleanup)
				local i = function(i)
					g.logWarn("cleanupWasRenamed")
					return h(i)
				end
				return i
			end)()
		end,
		[52] = function()
			a(52)
			return (function(...)
				local b = function(b)
					return typeof(b) == "Instance"
				end
				return b
			end)()
		end,
		[53] = function()
			local b, c, d = a(53)
			return (function(...)
				local e = c.Parent.Parent
				local f, g = d(e.Types), d(e.External)
				local h = function(h, i)
					local j = getmetatable(h)
					if typeof(j) == "table" and j._FUSION_POISONED then
						return
					end
					table.clear(h)
					setmetatable(h, {
						_FUSION_POISONED = true,
						__index = function()
							g.logError("poisonedScope", nil, i)
						end,
						__newindex = function()
							g.logError("poisonedScope", nil, i)
						end,
					})
				end
				return h
			end)()
		end,
		[54] = function()
			local b, c, d = a(54)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l = d(e.Types), d(e.Memory.poisonScope), d(e.ExternalDebug), false, 16, {}, 0
				return {
					giveIfEmpty = function(m)
						if next(m) == nil then
							h.untrackScope(m)
							if i and l < j then
								l += 1
								k[l] = m
							else
								g(m, [[previously passed to the internal scope pool, which indicates a Fusion bug.]])
							end
							return nil
						else
							return m
						end
					end,
					clearAndGive = function(m)
						h.untrackScope(m)
						table.clear(m)
						if i and l < j then
							l += 1
							k[l] = m
						else
							g(m, [[previously passed to the internal scope pool, which indicates a Fusion bug.]])
						end
					end,
					reuseAny = function()
						if l == 0 then
							return nil
						else
							local m = k[l]
							l -= 1
							return m
						end
					end,
				}
			end)()
		end,
		[55] = function()
			local b, c, d = a(55)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i = d(e.Types), d(e.ExternalDebug), d(e.Utility.merge), d(e.Memory.scopePool)
				local j = function(...)
					local j = (setmetatable((i.reuseAny()) or {}, { __index = h(false, {}, ...) }))
					g.trackScope(j)
					return j
				end
				return j
			end)()
		end,
		[56] = function()
			local b, c, d = a(56)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.External), function(f, g)
					local h, i, j, k, l = { f, g }, {}, 2, 0, {}
					while j > 0 do
						for m, n in h do
							l[n] = true
							for o, p in ipairs(n) do
								if p == f then
									return "definitely-b"
								elseif p == g then
									return "definitely-a"
								elseif typeof(p) == "table" then
									local q = p
									if q[1] ~= nil and l[n] == nil then
										k += 1
										i[k] = q
									end
								end
							end
						end
						table.clear(h)
						h, i = i, h
						j, k = k, 0
					end
					return "unsure"
				end
				local i = function(i, j, k, l)
					if g.isTimeCritical() then
						return "unsure"
					elseif i == k then
						local m = i
						for n = #m, 1, -1 do
							local o = m[n]
							if o == j then
								return "definitely-b"
							elseif o == l then
								return "definitely-a"
							end
						end
						return "unsure"
					else
						return h(i, k)
					end
				end
				return i
			end)()
		end,
		[57] = function()
			local b, c, d = a(57)
			return (function(...)
				local e, f, g = game:GetService("RunService"), game:GetService("HttpService"), c.Parent
				local h, i = d(g.External), {}
				i.policies = { allowWebLinks = e:IsStudio() }
				function i.doTaskImmediate(j)
					task.spawn(j)
				end
				function i.doTaskDeferred(j)
					task.defer(j)
				end
				function i.logErrorNonFatal(j)
					task.spawn(error, j, 0)
				end
				i.logWarn = warn
				local j, k = function()
					h.performUpdateStep(os.clock())
				end, nil
				function i.startScheduler()
					if k ~= nil then
						return
					end
					if e:IsClient() then
						local l = "FusionUpdateStep_" .. f:GenerateGUID()
						e:BindToRenderStep(l, Enum.RenderPriority.First.Value, j)
						k = function()
							e:UnbindFromRenderStep(l)
						end
					else
						local l = e.Heartbeat:Connect(j)
						k = function()
							l:Disconnect()
						end
					end
				end
				function i.stopScheduler()
					if k ~= nil then
						k()
						k = nil
					end
				end
				return i
			end)()
		end,
		[59] = function()
			local b, c, d = a(59)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n, o, p, q, s = d(e.Types), d(e.External), d(e.Logging.parseError), d(e.Utility.isSimilar), d(e.Utility.never), d(e.Graph.depend), d(e.State.castToState), d(e.State.peek), d(e.Memory.doCleanup), d(e.Memory.deriveScope), d(e.Memory.checkLifetime), d(e.Memory.scopePool), d(e.Utility.nicknames)
				local u = {}
				u.type = "State"
				u.kind = "Computed"
				u.timeliness = "lazy"
				local v = table.freeze({ __index = u })
				local w = function(w, x, y)
					local z = os.clock()
					if typeof(w) == "function" then
						g.logError("scopeMissing", nil, "Computeds", "myScope:Computed(function(use, scope) ... end)")
					elseif y ~= nil then
						g.logWarn("destructorRedundant", "Computed")
					end
					local A = (setmetatable({ createdAt = z, dependencySet = {}, dependentSet = {}, lastChange = nil, scope = w, validity = "invalid", _EXTREMELY_DANGEROUS_usedAsValue = nil, _innerScope = nil, _processor = x }, v))
					local B = function()
						A.scope = nil
						for B in pairs(A.dependencySet) do
							B.dependentSet[A] = nil
						end
						if A._innerScope ~= nil then
							n(A._innerScope)
						end
					end
					A.oldestTask = B
					s[A.oldestTask] = "Computed"
					table.insert(w, B)
					return A
				end
				function u.get(x)
					g.logError("stateGetWasRemoved")
					return j()
				end
				function u._evaluate(x)
					if x.scope == nil then
						return false
					end
					local y = x.scope
					local z, A = o(y), function(z)
						local A = l(z)
						if A ~= nil then
							p.bOutlivesA(y, x.oldestTask, A.scope, A.oldestTask, p.formatters.useFunction)
							k(x, A)
						end
						return m(z)
					end
					local B, C = xpcall(x._processor, h, A, z)
					local D = q.giveIfEmpty(z)
					if B then
						local E = i(x._EXTREMELY_DANGEROUS_usedAsValue, C)
						if x._innerScope ~= nil then
							n(x._innerScope)
						end
						x._innerScope = D
						x._EXTREMELY_DANGEROUS_usedAsValue = C
						return not E
					else
						local E = C
						if D ~= nil then
							n(D)
						end
						D = nil
						g.logErrorNonFatal("callbackError", E)
						return false
					end
				end
				table.freeze(u)
				return w
			end)()
		end,
		[60] = function()
			local b, c, d = a(60)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n = d(e.Types), d(e.External), d(e.Graph.depend), d(e.State.peek), d(e.State.castToState), d(e.State.For.ForTypes), d(e.Utility.never), d(e.Utility.nicknames), d(e.State.For.Disassembly)
				local o = {}
				o.type = "State"
				o.kind = "For"
				o.timeliness = "lazy"
				local p = table.freeze({ __index = o })
				local q = function(q, s, u)
					local v = os.clock()
					local w = (setmetatable({ createdAt = v, dependencySet = {}, dependentSet = {}, scope = q, validity = "invalid", _EXTREMELY_DANGEROUS_usedAsValue = {}, _disassembly = n(q, s, u) }, p))
					local x = function()
						w.scope = nil
						for x in pairs(w.dependencySet) do
							x.dependentSet[w] = nil
						end
					end
					w.oldestTask = x
					m[w.oldestTask] = "For"
					table.insert(q, x)
					return w
				end
				function o.get(s)
					g.logError("stateGetWasRemoved")
					return l()
				end
				function o._evaluate(s)
					if s.scope == nil then
						return false
					end
					local u = s.scope
					h(s, s._disassembly)
					table.clear(s._EXTREMELY_DANGEROUS_usedAsValue)
					s._disassembly:populate(function(v)
						local w = j(v)
						if w ~= nil then
							h(s, w)
						end
						return i(v)
					end, s._EXTREMELY_DANGEROUS_usedAsValue)
					return true
				end
				table.freeze(o)
				return q
			end)()
		end,
		[61] = function()
			local b, c, d = a(61)
			return (function(...)
				local e = c.Parent.Parent.Parent
				local f, g, h, i, j, k, l, m, n, o, p = d(e.Types), d(e.External), d(e.Graph.depend), d(e.State.peek), d(e.State.castToState), d(e.State.For.ForTypes), d(e.Memory.doCleanup), d(e.Memory.deriveScope), d(e.Memory.scopePool), d(e.Utility.nameOf), d(e.Utility.nicknames)
				local q = {}
				q.type = "Graph"
				q.kind = "For.Disassembly"
				q.timeliness = "lazy"
				local s = table.freeze({ __index = q })
				local u = function(u, v, w)
					local x = os.clock()
					local y = (setmetatable({ createdAt = x, dependencySet = {}, dependentSet = {}, scope = u, validity = "invalid", _inputTable = v, _constructor = w, _subObjects = {} }, s))
					local A = function()
						y.scope = nil
						for A in pairs(y.dependencySet) do
							A.dependentSet[y] = nil
						end
						for A in y._subObjects do
							if A.maybeScope ~= nil then
								l(A.maybeScope)
								A.maybeScope = nil
							end
						end
					end
					y.oldestTask = A
					p[y.oldestTask] = "For (internal disassembler)"
					table.insert(u, A)
					return y
				end
				function q.populate(v, w, x)
					local y, A, B = math.huge, -math.huge, false
					for C in v._subObjects do
						local D, E = C:useOutputPair(w)
						if D == nil or E == nil then
							B = true
							continue
						elseif x[D] ~= nil then
							g.logErrorNonFatal("forKeyCollision", nil, tostring(D))
							continue
						end
						x[D] = E
						if typeof(D) == "number" then
							y = math.min(y, D)
							A = math.max(A, D)
						end
					end
					if B and A > y then
						local C, D = x, y
						for E = y, A do
							local F = C[E]
							if F == nil then
								continue
							end
							C[E] = nil
							C[D] = F
							D += 1
						end
					end
				end
				function q._evaluate(v)
					local w, x = v.scope, j(v._inputTable)
					if x ~= nil then
						if x.scope == nil then
							g.logError("useAfterDestroy", nil, `The input {o(x, "table")}`, `the For object that is watching it`)
						end
						h(v, x)
					end
					local y = {}
					for A, B in i(v._inputTable) do
						y[A] = B
					end
					local A = {}
					for B in v._subObjects do
						local C, D, E, F = false, B.inputKey, B.inputValue
						if not B.roamKeys and y[D] ~= nil then
							C = true
							F = D
						else
							for G, H in y do
								C = true
								F = G
								if B.roamValues then
									break
								end
								if H == E then
									break
								end
							end
						end
						if C then
							local G = y[F]
							A[B] = true
							if F ~= D then
								B.inputKey = F
								B:invalidateInputKey()
							end
							if G ~= E then
								B.inputValue = G
								B:invalidateInputValue()
							end
							y[F] = nil
						else
							if B.maybeScope ~= nil then
								l(B.maybeScope)
								B.maybeScope = nil
							end
						end
					end
					for B, C in y do
						local D = v._constructor(m(w), B, C)
						if D.maybeScope ~= nil then
							D.maybeScope = n.giveIfEmpty(D.maybeScope)
						end
						A[D] = true
					end
					v._subObjects = A
					return true
				end
				table.freeze(q)
				return u
			end)()
		end,
		[62] = function()
			local b, c, d = a(62)
			return (function(...)
				local e = c.Parent.Parent.Parent
				d(e.Types)
				return nil
			end)()
		end,
		[63] = function()
			local b, c, d = a(63)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n = d(e.Types), d(e.External), d(e.Memory.doCleanup), d(e.State.For), d(e.State.Value), d(e.State.Computed), d(e.State.For.ForTypes), d(e.Logging.parseError), { __index = {
					roamKeys = false,
					roamValues = true,
					invalidateInputKey = function(f)
						f._inputKeyState:set(f.inputKey)
					end,
					invalidateInputValue = function(f) end,
					useOutputPair = function(f, g)
						return g(f._outputKeyState), f.inputValue
					end,
				} }
				local o = function(o, p, q, s)
					local u = {}
					u.maybeScope = o
					u.inputKey = p
					u.inputValue = q
					u._inputKeyState = j(o, p)
					u._processor = s
					u._outputKeyState = k(o, function(v, w)
						local x = v(u._inputKeyState)
						local y, A = xpcall(u._processor, m, v, w, x)
						if y then
							return A
						else
							local B = A
							B.context = `while processing key {tostring(x)}`
							g.logErrorNonFatal("callbackError", B)
							h(w)
							table.clear(w)
							return nil
						end
					end)
					return (setmetatable(u, n))
				end
				local p = function(p, q, s, u)
					if typeof(q) == "function" then
						g.logError("scopeMissing", nil, "ForKeys", [[myScope:ForKeys(inputTable, function(scope, use, key) ... end)]])
					elseif u ~= nil then
						g.logWarn("destructorRedundant", "ForKeys")
					end
					return i(p, q, function(v, w, x)
						return o(v, w, x, s)
					end)
				end
				return p
			end)()
		end,
		[64] = function()
			local b, c, d = a(64)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n = d(e.Types), d(e.External), d(e.State.For), d(e.State.Value), d(e.State.Computed), d(e.State.For.ForTypes), d(e.Logging.parseError), d(e.Memory.doCleanup), { __index = {
					roamKeys = false,
					roamValues = false,
					invalidateInputKey = function(f)
						f._inputKeyState:set(f.inputKey)
					end,
					invalidateInputValue = function(f)
						f._inputValueState:set(f.inputValue)
					end,
					useOutputPair = function(f, g)
						local h = g(f._outputPairState)
						return h.key, h.value
					end,
				} }
				local o = function(o, p, q, s)
					local u = {}
					u.maybeScope = o
					u.inputKey = p
					u.inputValue = q
					u._inputKeyState = i(o, p)
					u._inputValueState = i(o, q)
					u._processor = s
					u._outputPairState = j(o, function(v, w)
						local x, y = v(u._inputKeyState), v(u._inputValueState)
						local A, B, C = xpcall(u._processor, l, v, w, x, y)
						if A then
							return { key = B, value = C }
						else
							local D = B
							D.context = `while processing key {tostring(y)} and value {tostring(y)}`
							g.logErrorNonFatal("callbackError", D)
							m(w)
							table.clear(w)
							return { key = nil, value = nil }
						end
					end)
					return (setmetatable(u, n))
				end
				local p = function(p, q, s, u)
					if typeof(q) == "function" then
						g.logError("scopeMissing", nil, "ForPairs", [[myScope:ForPairs(inputTable, function(scope, use, key, value) ... end)]])
					elseif u ~= nil then
						g.logWarn("destructorRedundant", "ForPairs")
					end
					return h(p, q, function(v, w, x)
						return o(v, w, x, s)
					end)
				end
				return p
			end)()
		end,
		[65] = function()
			local b, c, d = a(65)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k, l, m, n = d(e.Types), d(e.External), d(e.State.For), d(e.State.Value), d(e.State.Computed), d(e.State.For.ForTypes), d(e.Logging.parseError), d(e.Memory.doCleanup), { __index = {
					roamKeys = true,
					roamValues = false,
					invalidateInputKey = function(f) end,
					invalidateInputValue = function(f)
						f._inputValueState:set(f.inputValue)
					end,
					useOutputPair = function(f, g)
						return f.inputKey, g(f._outputValueState)
					end,
				} }
				local o = function(o, p, q, s)
					local u = {}
					u.maybeScope = o
					u.inputKey = p
					u.inputValue = q
					u._inputValueState = i(o, q)
					u._processor = s
					u._outputValueState = j(o, function(v, w)
						local x = v(u._inputValueState)
						local y, A = xpcall(u._processor, l, v, w, x)
						if y then
							return A
						else
							local B = A
							B.context = `while processing value {tostring(x)}`
							g.logErrorNonFatal("callbackError", B)
							m(w)
							table.clear(w)
							return nil
						end
					end)
					return (setmetatable(u, n))
				end
				local p = function(p, q, s, u)
					if typeof(q) == "function" then
						g.logError("scopeMissing", nil, "ForValues", [[myScope:ForValues(inputTable, function(scope, use, value) ... end)]])
					elseif u ~= nil then
						g.logWarn("destructorRedundant", "ForValues")
					end
					return h(p, q, function(v, w, x)
						return o(v, w, x, s)
					end)
				end
				return p
			end)()
		end,
		[66] = function()
			local b, c, d = a(66)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h, i, j, k = d(e.Types), d(e.External), d(e.Graph.change), d(e.Utility.isSimilar), d(e.Utility.never), d(e.Utility.nicknames)
				local l = {}
				l.type = "State"
				l.kind = "Value"
				l.timeliness = "lazy"
				l.dependencySet = table.freeze({})
				local m = table.freeze({ __index = l })
				local n = function(n, o)
					local p = os.clock()
					if o == nil and (typeof(n) ~= "table" or (n[1] == nil and next(n) ~= nil)) then
						g.logError("scopeMissing", nil, "Value", "myScope:Value(initialValue)")
					end
					local q = (setmetatable({ createdAt = p, dependentSet = {}, lastChange = os.clock(), scope = n, validity = "valid", _EXTREMELY_DANGEROUS_usedAsValue = o }, m))
					local s = function()
						q.scope = nil
					end
					q.oldestTask = s
					k[q.oldestTask] = "Value"
					table.insert(n, s)
					return q
				end
				function l:get(o)
					g.logError("stateGetWasRemoved")
					return j()
				end
				function l.set(o, p)
					local q = o._EXTREMELY_DANGEROUS_usedAsValue
					if not i(q, p) then
						o._EXTREMELY_DANGEROUS_usedAsValue = p
						h(o)
					end
					return p
				end
				function l._evaluate(o)
					return true
				end
				table.freeze(l)
				return n
			end)()
		end,
		[67] = function()
			local b, c, d = a(67)
			return (function(...)
				local e = c.Parent.Parent
				local f, g = d(e.Types), function(f)
					if typeof(f) == "table" and f.type == "State" then
						return f
					else
						return nil
					end
				end
				return g
			end)()
		end,
		[68] = function()
			local b, c, d = a(68)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.State.castToState), d(e.Graph.evaluate)
				local i = function(i)
					local j = g(i)
					if j ~= nil then
						h(j, false)
						return j._EXTREMELY_DANGEROUS_usedAsValue
					else
						return i
					end
				end
				return i
			end)()
		end,
		[69] = function()
			a(69)
			return (function(...)
				return nil
			end)()
		end,
		[70] = function()
			a(70)
			return (function(...)
				return nil
			end)()
		end,
		[72] = function()
			local b, c, d = a(72)
			return (function(...)
				local e = c.Parent.Parent
				local f, g, h = d(e.Types), d(e.External), d(e.Logging.parseError)
				local i = {}
				i.type = "Contextual"
				local j, k = table.freeze({ __index = i }), table.freeze({ __mode = "k" })
				local l = function(l)
					local m = (setmetatable({ _valuesNow = setmetatable({}, k), _defaultValue = l }, j))
					return m
				end
				function i.now(m)
					local n = coroutine.running()
					local o = m._valuesNow[n]
					if typeof(o) ~= "table" then
						return m._defaultValue
					else
						return o.value
					end
				end
				function i.is(m, n)
					local o = {}
					function o.during(p, q, ...)
						local s = coroutine.running()
						local u = m._valuesNow[s]
						m._valuesNow[s] = { value = n }
						local v, w = xpcall(q, h, ...)
						m._valuesNow[s] = u
						if not v then
							g.logError("callbackError", w)
						end
						return w
					end
					return o
				end
				table.freeze(i)
				return l
			end)()
		end,
		[73] = function()
			local b, c, d = a(73)
			return (function(...)
				local e, f = c.Parent.Parent, function(e)
					local f, g = xpcall(e.try, e.fallback)
					return g
				end
				return f
			end)()
		end,
		[74] = function()
			a(74)
			return (function(...)
				local b = function(b, c)
					local d = typeof(b)
					local e, f = d == "table", d == "userdata"
					return if not (e or f) then b == c or b ~= b and c ~= c elseif d == typeof(c) and (f or table.isfrozen(b) or getmetatable(b) ~= nil) then b == c else false
				end
				return b
			end)()
		end,
		[75] = function()
			local b, c, d = a(75)
			return (function(...)
				local e = c.Parent.Parent
				local f = d(e.External)
				local g = function(g, h, ...)
					local i = { ... }
					if #i < 1 then
						return h
					else
						for j, k in i do
							for l, m in k do
								if h[l] == nil then
									h[l] = m
								elseif not g then
									f.logError("mergeConflict", nil, tostring(l))
								end
							end
						end
						return h
					end
				end
				return g
			end)()
		end,
		[76] = function()
			local b, c, d = a(76)
			return (function(...)
				local e = c.Parent.Parent
				local f = d(e.Utility.nicknames)
				local g = function(g, h)
					local i = f[g]
					if typeof(i) == "string" then
						return i
					end
					if typeof(g) == "table" then
						local j = g
						if typeof(j.name) == "string" then
							return j.name
						elseif typeof(j.kind) == "string" then
							return j.kind
						elseif typeof(j.type) == "string" then
							return j.type
						end
					end
					return h
				end
				return g
			end)()
		end,
		[77] = function()
			a(77)
			return (function(...)
				local b = function()
					error("This codepath should not be reachable")
				end
				return b
			end)()
		end,
		[78] = function()
			a(78)
			return (function(...)
				return setmetatable({}, { __mode = "k" })
			end)()
		end,
		[79] = function()
			a(79)
			return (function(...)
				local b = function(b)
					local c = typeof(b)
					if c == "table" then
						local d = b
						if typeof(d.type) == "string" then
							return d.type
						end
					end
					return c
				end
				return b
			end)()
		end,
		[80] = function()
			local b, c, d = a(80)
			return (function(...)
				return d(c.Parent._Index["realdeedy_fusion@0.3.0"].fusion)
			end)()
		end,
	}, { { 1, 4, {
		"therion",
	}, { { 2, 1, { "Packages" }, { { 80, 2, { "fusion" } }, { 3, 1, { "_Index" }, { { 4, 1, {
		"realdeedy_fusion@0.3.0",
	}, { { 5, 2, { "fusion" }, { { 45, 1, { "Memory" }, { { 47, 2, {
		"deriveScope",
	} }, { 56, 2, { "whichLivesLonger" } }, { 53, 2, { "poisonScope" } }, { 54, 2, {
		"scopePool",
	} }, { 51, 2, { "legacyCleanup" } }, { 55, 2, { "scoped" } }, { 52, 2, {
		"needsDestruction",
	} }, { 48, 2, { "deriveScopeImpl" } }, { 50, 2, { "innerScope" } }, { 46, 2, {
		"checkLifetime",
	} }, { 49, 2, { "doCleanup" } } } }, { 17, 1, { "Colour" }, { { 19, 2, { "sRGB" } }, { 18, 2, { "Oklab" } } } }, { 21, 2, { "ExternalDebug" } }, { 22, 1, { "Graph" }, { { 25, 2, { "change" } }, { 23, 2, { "Observer" } }, { 24, 2, { "castToGraph" } }, { 27, 2, { "evaluate" } }, { 26, 2, { "depend" } } } }, { 58, 1, { "State" }, { { 64, 2, { "ForPairs" } }, { 67, 2, { "castToState" } }, { 66, 2, { "Value" } }, { 59, 2, { "Computed" } }, { 60, 2, { "For" }, { { 61, 2, { "Disassembly" } }, { 62, 2, { "ForTypes" } } } }, { 68, 2, { "peek" } }, { 69, 2, { "updateAll" } }, { 63, 2, { "ForKeys" } }, { 65, 2, { "ForValues" } } } }, { 41, 1, {
		"Logging",
	}, { { 42, 2, { "formatError" } }, { 43, 2, { "messages" } }, { 44, 2, { "parseError" } } } }, {
		70,
		2,
		{ "Types" },
	}, { 28, 1, { "Instances" }, { { 34, 2, { "Hydrate" } }, { 29, 2, { "Attribute" } }, { 40, 2, { "defaultProps" } }, { 30, 2, { "AttributeChange" } }, { 36, 2, { "OnChange" } }, { 33, 2, {
		"Children",
	} }, { 35, 2, { "New" } }, { 38, 2, { "Out" } }, { 37, 2, { "OnEvent" } }, { 31, 2, {
		"AttributeOut",
	} }, { 39, 2, { "applyInstanceProps" } }, { 32, 2, { "Child" } } } }, { 71, 1, {
		"Utility",
	}, { { 79, 2, { "xtypeof" } }, { 74, 2, { "isSimilar" } }, { 75, 2, { "merge" } }, { 78, 2, {
		"nicknames",
	} }, { 72, 2, { "Contextual" } }, { 73, 2, { "Safe" } }, { 76, 2, { "nameOf" } }, { 77, 2, {
		"never",
	} } } }, { 57, 2, { "RobloxExternal" } }, { 6, 1, { "Animation" }, { { 13, 2, { "lerpType" } }, {
		10,
		2,
		{ "Tween" },
	}, { 16, 2, { "unpackType" } }, { 9, 2, { "Stopwatch" } }, { 12, 2, { "getTweenRatio" } }, { 8, 2, { "Spring" } }, { 15, 2, { "springCoefficients" } }, { 7, 2, { "ExternalTime" } }, { 14, 2, {
		"packType",
	} }, { 11, 2, { "getTweenDuration" } } } }, { 20, 2, { "External" } } } } } } } } } } } } }, "0.4.1", "Wax Script", string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION
local x, y, A, B, C, D, E = k.insert, k.remove, k.freeze or function(x)
	return x
end, m.wrap, f.sub, f.match, f.gmatch
if v and C(v, 1, 4) == "Lune" then
	local F, G = q(p, "@lune/task")
	if F and G then
		g = G
	end
end
local F = g and g.defer
local G, H, I, J, K, L, M, N, O =
	F or function(G, ...)
		B(G)(...)
	end, { [1] = "Folder", [2] = "ModuleScript", [3] = "Script", [4] = "LocalScript", [5] = "StringValue" }, {}, {}, {}, {}, {}, {}, {}
local P, Q =
	{ GetFullName = {
		{},
		function(P)
			local Q, R = P.Name, P.Parent
			while R do
				Q = R.Name .. "." .. Q
				R = R.Parent
			end
			return Q
		end,
	}, GetChildren = {
		{},
		function(P)
			local Q = {}
			for R in j, O[P] do
				x(Q, R)
			end
			return Q
		end,
	}, GetDescendants = {
		{},
		function(P)
			local Q = {}
			for R in j, O[P] do
				x(Q, R)
				for S, T in j, R:GetDescendants() do
					x(Q, T)
				end
			end
			return Q
		end,
	}, FindFirstChild = {
		{ "string", "boolean?" },
		function(P, Q, R)
			local S = O[P]
			for T in j, S do
				if T.Name == Q then
					return T
				end
			end
			if R then
				for T in j, S do
					return T:FindFirstChild(Q, true)
				end
			end
		end,
	}, FindFirstAncestor = {
		{ "string" },
		function(P, Q)
			local R = P.Parent
			while R do
				if R.Name == Q then
					return R
				end
				R = R.Parent
			end
		end,
	}, WaitForChild = {
		{ "string", "number?" },
		function(P, Q)
			return P:FindFirstChild(Q)
		end,
	} }, {}
for R, S in j, P do
	local T, U, V = S[1], S[2], {}
	for W, X in j, T do
		local Y, Z = D(X, "^([^%?]+)(%??)")
		V[W] = { Y, Z }
	end
	Q[R] = function(W, ...)
		if not O[W] then
			i("Expected ':' not '.' calling member function " .. R, 2)
		end
		local X = { ... }
		for Y, Z in j, V do
			local _ = X[Y]
			local aa, ab, ac = o(_), Z[1], Z[2]
			if _ == nil and not ac then
				i("Argument " .. _ .. " missing or nil", 3)
			end
			if ab ~= "any" and aa ~= ab and not (aa == "nil" and ac) then
				i("Argument " .. Y .. ' expects type "' .. ab .. '", got "' .. aa .. '"', 2)
			end
		end
		return U(W, ...)
	end
end
local aa = function(aa, ab, ac)
	local R, S, T, U, V, W =
		h({}, { __mode = "k" }), function(R)
			i(R .. " is not a valid (virtual) member of " .. aa .. ' "' .. ab .. '"', 3)
		end, function(R)
			i("Unable to assign (virtual) property " .. R .. ". Property is read only", 3)
		end, {}, {}
	V.__metatable = false
	V.__index = function(X, Y)
		if Y == "ClassName" then
			return aa
		elseif Y == "Name" then
			return ab
		elseif Y == "Parent" then
			return ac
		elseif aa == "StringValue" and Y == "Value" then
			return W
		else
			local Z = Q[Y]
			if Z then
				return Z
			end
		end
		for Z in j, R do
			if Z.Name == Y then
				return Z
			end
		end
		S(Y)
	end
	V.__newindex = function(X, Y, Z)
		if Y == "ClassName" then
			T(Y)
		elseif Y == "Name" then
			ab = Z
		elseif Y == "Parent" then
			if Z == U then
				return
			end
			if ac ~= nil then
				O[ac][U] = nil
			end
			ac = Z
			if Z ~= nil then
				O[Z][U] = true
			end
		elseif aa == "StringValue" and Y == "Value" then
			W = Z
		else
			S(Y)
		end
	end
	V.__tostring = function()
		return ab
	end
	h(U, V)
	O[U] = R
	if ac ~= nil then
		O[ac][U] = true
	end
	return U
end
local function ab(ac, R)
	local S, T, U, V = ac[1], ac[2], ac[3], ac[4]
	local W = H[T]
	local X = U and y(U, 1) or W
	local Y = aa(W, X, R)
	I[S] = Y
	if U then
		for Z, _ in j, U do
			Y[Z] = _
		end
	end
	if V then
		for Z, _ in j, V do
			ab(_, Y)
		end
	end
	return Y
end
local ac = aa("Folder", "[" .. e .. "]")
for R, S in j, c do
	ab(S, ac)
end
for R, S in j, b do
	local T = I[R]
	J[T] = S
	K[T] = R
	local U = T.ClassName
	if U == "LocalScript" or U == "Script" then
		x(M, T)
	end
end
local R = function(R)
	local S, T = R.ClassName, L[R]
	if T and S == "ModuleScript" then
		return l(T)
	end
	local U, V =
		J[R], function(U)
			U = s(U)
			local V, W, X = R:GetFullName(), D(U, "[^:]+:(%d+): (.+)")
			if not W or not w then
				return V .. ":*: " .. (X or U)
			end
			W = u(W)
			local Y = K[R]
			local Z = w[Y]
			local _ = W - Z + 1
			if _ < 0 then
				_ = "?"
			end
			return V .. ":" .. _ .. ": " .. X
		end
	if S == "LocalScript" or S == "Script" then
		local W, X = xpcall(U, function(W)
			return debug.traceback(W, 2)
		end)
		if not W then
			i(V(X), 0)
		end
	else
		local W = { xpcall(U, function(W)
			return debug.traceback(W, 2)
		end) }
		local X = y(W, 1)
		if not X then
			local Y = y(W, 1)
			i(V(Y), 0)
		end
		L[R] = W
		return l(W)
	end
end
function a(S)
	local T, U, V =
		I[S], function(T, ...)
			local U = { xpcall(T, function(U)
				return debug.traceback(U, 2)
			end, ...) }
			local V = y(U, 1)
			if not V then
				i(U[1], 3)
			end
			return l(U)
		end, A(h({}, {
			__index = N,
			__newindex = function(T, U, V)
				N[U] = V
			end,
			__len = function()
				return #N
			end,
			__iter = function()
				return j, N
			end,
		}))
	local ad, ae, af =
		A({ version = d, envname = e, shared = V, script = n, require = p }), T, function(W, ...)
			local X, Y, Z = o(W), "Attempted to call require with a non-ModuleScript", "Attempted to call require with self"
			if X == "table" and O[W] then
				if W.ClassName ~= "ModuleScript" then
					i(Y, 2)
				elseif W == T then
					i(Z, 2)
				end
				return R(W)
			elseif X == "string" and C(W, 1, 1) ~= "@" then
				if #W == 0 then
					i("Attempted to call require with empty string", 2)
				end
				local _ = T
				if C(W, 1, 1) == "/" then
					_ = ac
				elseif C(W, 1, 2) == "./" then
					W = C(W, 3)
				end
				local ad
				for ae in E(W, "([^/]*)/?") do
					local af = ae
					if ae == ".." then
						af = "Parent"
					end
					if af ~= "" then
						local ag = _:FindFirstChild(af)
						if not ag then
							local ah = _.Parent
							if ah then
								ag = ah:FindFirstChild(af)
							end
						end
						if ag then
							_ = ag
						elseif ae ~= ad and ae ~= "init" and ae ~= "init.server" and ae ~= "init.client" then
							i('Virtual script path "' .. W .. '" not found', 2)
						end
					end
					ad = ae
				end
				if _.ClassName ~= "ModuleScript" then
					i(Y, 2)
				elseif _ == T then
					i(Z, 2)
				end
				return R(_)
			end
			return U(p, W, ...)
		end
	return ad, ae, af
end
for ad, ae in j, M do
	G(R, ae)
end
