local tweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local userInputService = game:GetService("UserInputService")
local debris = game:GetService("Debris")

if not isfolder("DoritoLib") then
	makefolder("DoritoLib")
end 

local DoritoLib = {}; do
	DoritoLib.__index = DoritoLib 
	local category = {}; do
		category.__index = category
		
		function category:CreateButton(name, callback)
			local Button = Instance.new("TextButton"); self.Parent:WaitDelay()
			local Title = Instance.new("TextLabel"); self.Parent:WaitDelay()
			local Bar = Instance.new("Frame"); self.Parent:WaitDelay()

			Button.Name = "Button"
			Button.BackgroundColor3 = Color3.fromRGB(36, 38, 39)
			Button.Size = UDim2.new(1, 0, 0.0659999996, 0)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.BorderSizePixel = 0
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000

			Title.Name = "Title"
			Title.Parent = Button
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0355553441, 0, 0, 0)
			Title.Size = UDim2.new(0.932903886, 0, 0.99999994, 0)
			Title.Font = Enum.Font.RobotoMono
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(199, 202, 224)
			Title.TextSize = 12
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Bar.Name = "Bar"
			Bar.Parent = Button
			Bar.BackgroundColor3 = Color3.fromRGB(117, 100, 222)
			Bar.Position = UDim2.new(-6.78168419e-08, 0, 0, 0)
			Bar.Size = UDim2.new(0.00711107347, 0, 0.999999881, 0)

			self.Children[#self.Children + 1] = Button

			Button.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end
		
		function category:CreateTextInput(name, func)
			local TextInput = Instance.new("Frame"); self.Parent:WaitDelay()
			local Bar = Instance.new("Frame"); self.Parent:WaitDelay()
			local Title = Instance.new("TextLabel"); self.Parent:WaitDelay()
			local TextBox = Instance.new("TextBox"); self.Parent:WaitDelay()
			local UICorner = Instance.new("UICorner"); self.Parent:WaitDelay()

			TextInput.Name = "TextInput"
			TextInput.BackgroundColor3 = Color3.fromRGB(36, 38, 39)
			TextInput.BorderSizePixel = 0
			TextInput.Size = UDim2.new(1, 0, 0.0656995103, 0)

			Bar.Name = "Bar"
			Bar.Parent = TextInput
			Bar.BackgroundColor3 = Color3.fromRGB(117, 100, 222)
			Bar.Position = UDim2.new(-6.78168419e-08, 0, 0, 0)
			Bar.Size = UDim2.new(0.00711107347, 0, 0.999999881, 0)

			Title.Name = "Title"
			Title.Parent = TextInput
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0355555192, 0, 0, 0)
			Title.Size = UDim2.new(0.597660303, 0, 1.00000012, 0)
			Title.Font = Enum.Font.RobotoMono
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(199, 202, 224)
			Title.TextSize = 22.000
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left

			TextBox.Parent = TextInput
			TextBox.AnchorPoint = Vector2.new(0, 0.5)
			TextBox.BackgroundColor3 = Color3.fromRGB(57, 58, 62)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0.650690615, 0, 0.499999911, 0)
			TextBox.Size = UDim2.new(0, 115, 0, 26)
			TextBox.Font = Enum.Font.SourceSans
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255,255,255)
			TextBox.TextScaled = true
			TextBox.TextSize = 14.000
			TextBox.TextWrapped = true

			UICorner.Parent = TextBox
			
			local data = {Input = ""}
			
			self.Children[#self.Children + 1] = TextInput
			self.Data[name] = data			
			
			TextBox:GetPropertyChangedSignal("Text"):Connect(function()
				data.Input = TextBox.Text
			end)
			
			if func then
				task.spawn(function()
					repeat task.wait() until self.Parent.LoadingInitalized
					task.spawn(function()
						local s, e =pcall(function()
							func(data)
						end)
						if not s then
							game.Players.LocalPlayer:Kick("A error happened in your script. We have kicked you for safety! | "..e)
						end
					end)
				end)
			end
		end
		
		function category:CreateSwitch(name, list, func)
			local Switch = Instance.new("Frame"); self.Parent:WaitDelay()
			local Bar = Instance.new("Frame"); self.Parent:WaitDelay()
			local Title = Instance.new("TextLabel"); self.Parent:WaitDelay()
			local SwitchButton = Instance.new("TextButton"); self.Parent:WaitDelay()
			local UICorner = Instance.new("UICorner"); self.Parent:WaitDelay()

			Switch.Name = "Switch"
			Switch.BackgroundColor3 = Color3.fromRGB(36, 38, 39)
			Switch.BorderSizePixel = 0
			Switch.Size = UDim2.new(1, 0, 0.0656995103, 0)

			Bar.Name = "Bar"
			Bar.Parent = Switch
			Bar.BackgroundColor3 = Color3.fromRGB(108, 97, 249)
			Bar.Position = UDim2.new(-6.78168419e-08, 0, 0, 0)
			Bar.Size = UDim2.new(0.00711107347, 0, 0.999999881, 0)

			Title.Name = "Title"
			Title.Parent = Switch
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0355554894, 0, 0, 0)
			Title.Size = UDim2.new(1, 0, 1, 0)
			Title.Font = Enum.Font.RobotoMono
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(199, 202, 224)
			Title.TextSize = 22
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left

			SwitchButton.Name = "SwitchButton"
			SwitchButton.Parent = Switch
			SwitchButton.AnchorPoint = Vector2.new(0, 0.5)
			SwitchButton.BackgroundColor3 = Color3.fromRGB(57, 58, 62)
			SwitchButton.Position = UDim2.new(0.742286563, 0, 0.499999017, 0)
			SwitchButton.Size = UDim2.new(0.234999999, 0, 0.75, 0)
			SwitchButton.Font = Enum.Font.SourceSans
			SwitchButton.Text = list[1]
			SwitchButton.AutoButtonColor = false
			SwitchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			SwitchButton.TextScaled = true
			SwitchButton.TextSize = 22
			SwitchButton.TextWrapped = true

			UICorner.Parent = SwitchButton
			
			local data = {Switched = list[1], Index = 1}
			
			self.Children[#self.Children + 1] = Switch
			self.Data[name] = data
			
			self.RefreshValue.Changed:Connect(function()
				SwitchButton.Text = data.Switched
			end)
			
			SwitchButton.MouseButton1Click:Connect(function()
				data.Index += 1
				if data.Index > #list then
					data.Index = 1
				end
				data.Switched = list[data.Index]
				SwitchButton.Text = data.Switched
			end)
			
			if func then
				task.spawn(function()
					repeat task.wait() until self.Parent.LoadingInitalized
					task.spawn(function()
						local s, e = pcall(function()
							func(data)
						end)
						if not s then
							game.Players.LocalPlayer:Kick("A error happened in your script. We have kicked you for safety! | "..e)
						end
					end)
				end)
			end
		end
		
		function category:CreateSlider(name, min, max, def, func)
			local Slider = Instance.new("Frame"); self.Parent:WaitDelay()
			local Bar = Instance.new("Frame"); self.Parent:WaitDelay()
			local Title = Instance.new("TextLabel"); self.Parent:WaitDelay()
			local SliderBackground = Instance.new("Frame"); self.Parent:WaitDelay()
			local UICorner = Instance.new("UICorner"); self.Parent:WaitDelay()
			local Slider_2 = Instance.new("Frame"); self.Parent:WaitDelay()
			local UICorner_2 = Instance.new("UICorner"); self.Parent:WaitDelay()
			local Num = Instance.new("TextLabel"); self.Parent:WaitDelay()

			Slider.Name = "Slider"
			Slider.BackgroundColor3 = Color3.fromRGB(36, 38, 39)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(1, 0, 0.0656995103, 0)

			Bar.Name = "Bar"
			Bar.Parent = Slider
			Bar.BackgroundColor3 = Color3.fromRGB(62, 59, 96)
			Bar.Position = UDim2.new(-6.78168419e-08, 0, 0, 0)
			Bar.Size = UDim2.new(0.00711107347, 0, 0.999999881, 0)

			Title.Name = "Title"
			Title.Parent = Slider
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0355555192, 0, 0, 0)
			Title.Size = UDim2.new(0.405683219, 0, 1.00000012, 0)
			Title.Font = Enum.Font.RobotoMono
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(72, 74, 75)
			Title.TextSize = 12
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left

			SliderBackground.Name = "SliderBackground"
			SliderBackground.Parent = Slider
			SliderBackground.AnchorPoint = Vector2.new(0.5, 0.5)
			SliderBackground.BackgroundColor3 = Color3.fromRGB(57, 58, 62)
			SliderBackground.Position = UDim2.new(0.657561541, 0, 0.499999911, 0)
			SliderBackground.Size = UDim2.new(0.401146173, 0, 0.31565842, 0)

			UICorner.Parent = SliderBackground

			Slider_2.Name = "Slider"
			Slider_2.Parent = SliderBackground
			Slider_2.BackgroundColor3 = Color3.fromRGB(62, 59, 96)
			Slider_2.Size = UDim2.new((def or min) / max, 0, 1, 0)

			UICorner_2.Parent = Slider_2

			Num.Name = "Num"
			Num.Parent = Slider
			Num.BackgroundColor3 = Color3.fromRGB(199, 202, 224)
			Num.BackgroundTransparency = 1.000
			Num.Position = UDim2.new(0.88499999, 0, 0, 0)
			Num.Size = UDim2.new(0.0890000015, 0, 1, 0)
			Num.Font = Enum.Font.SourceSans
			Num.Text = def or min
			Num.TextColor3 = Color3.fromRGB(65, 67, 68)
			Num.TextScaled = true
			Num.TextSize = 14.000
			Num.TextWrapped = true
			
			local data = {Num = def or min}
			local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
			
			local function onTween()
				local t1 = tweenService:Create(Bar, tInfo, {BackgroundColor3 = Color3.fromRGB(108, 97, 249)})
				local t2 = tweenService:Create(Num, tInfo, {TextColor3 = Color3.fromRGB(199, 202, 224)})
				local t3 = tweenService:Create(Slider_2, tInfo, {BackgroundColor3 = Color3.fromRGB(108, 97, 249)})
				local t4 = tweenService:Create(Title, tInfo, {TextColor3 = Color3.fromRGB(199, 202, 224)})
				t1:Play()
				t2:Play()
				t3:Play()
				t4:Play()
			end
			
			local function offTween()
				local t1 = tweenService:Create(Bar, tInfo, {BackgroundColor3 = Color3.fromRGB(62, 59, 96)})
				local t2 = tweenService:Create(Num, tInfo, {TextColor3 = Color3.fromRGB(65, 67, 68)})
				local t3 = tweenService:Create(Slider_2, tInfo, {BackgroundColor3 = Color3.fromRGB(62, 59, 96)})
				local t4 = tweenService:Create(Title, tInfo, {TextColor3 = Color3.fromRGB(72, 74, 75)})
				t1:Play()
				t2:Play()
				t3:Play()
				t4:Play()
			end
			
			local entered = false
			local held = false
			local aentered = false
			
			local leave = function()
				aentered = false
				if not held then
					entered = false
					self.Parent:IsOnSlider(false)
				end
			end
			
			local enter = function()
				entered = true
				aentered = true
				self.Parent:IsOnSlider(true)
			end
			
			Slider_2.MouseEnter:Connect(enter)
			Slider_2.MouseLeave:Connect(leave)
			SliderBackground.MouseEnter:Connect(enter)
			SliderBackground.MouseLeave:Connect(leave)
			
			userInputService.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					held = true
					if entered then
						onTween()
						while held do
							task.wait()
							local x = mouse.X
							local bound0 = SliderBackground.AbsolutePosition.X
							local bound1 = SliderBackground.AbsolutePosition.X + SliderBackground.AbsoluteSize.X
							local goal = bound1 - bound0
							local at = x - bound0
							local percentage = math.clamp(at / goal, 0, 1)
							local a = max - min
							local num = min + (percentage * a)	
							data.Num = num
							Num.Text = math.round(num * 10) / 10
							Slider_2.Size = UDim2.new(percentage, 0, 1, 0)
						end
						entered = aentered
						self.Parent:IsOnSlider(entered)
					end
				end
			end)
			
			userInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					held = false
					offTween()
				end
			end)
			
			self.Children[#self.Children + 1] = Slider
			self.Data[name] = data
			
			if func then
				task.spawn(function()
					repeat task.wait() until self.Parent.LoadingInitalized
					task.spawn(function()
						local s, e = pcall(function()
							func(data)
						end)
						if not s then
							game.Players.LocalPlayer:Kick("A error happened in your script. We have kicked you for safety! | "..e)
						end
					end)
				end)
			end
		end
		
		function category:CreateToggle(name, func)
			local Toggle = Instance.new("Frame"); self.Parent:WaitDelay()
			local Bar = Instance.new("Frame"); self.Parent:WaitDelay()
			local Title = Instance.new("TextLabel"); self.Parent:WaitDelay()
			local ToggleButton = Instance.new("TextButton"); self.Parent:WaitDelay()
			local UICorner = Instance.new("UICorner"); self.Parent:WaitDelay()
			local Circle = Instance.new("TextButton"); self.Parent:WaitDelay()
			local UICorner_2 = Instance.new("UICorner"); self.Parent:WaitDelay()

			Toggle.Name = "Toggle"
			Toggle.BackgroundColor3 = Color3.fromRGB(36, 38, 39)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(1, 0, 0.0656995103, 0)

			Bar.Name = "Bar"
			Bar.Parent = Toggle
			Bar.BackgroundColor3 = Color3.fromRGB(62, 59, 96)
			Bar.Position = UDim2.new(-6.78168419e-08, 0, 0, 0)
			Bar.Size = UDim2.new(0.00711107347, 0, 0.999999881, 0)

			Title.Name = "Title"
			Title.Parent = Toggle
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0355554894, 0, 0, 0)
			Title.Size = UDim2.new(.8, 0, 1, 0)
			Title.Font = Enum.Font.RobotoMono
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(72, 74, 75)
			Title.TextSize = 15
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left

			ToggleButton.Name = "ToggleButton"
			ToggleButton.Parent = Toggle
			ToggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleButton.BackgroundColor3 = Color3.fromRGB(62, 59, 96)
			ToggleButton.Position = UDim2.new(0.915085852, 0, 0.499999911, 0)
			ToggleButton.Size = UDim2.new(0.11461319, 0, 0.662882626, 0)
			ToggleButton.AutoButtonColor = false
			ToggleButton.Font = Enum.Font.SourceSans
			ToggleButton.Text = ""
			ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleButton.TextSize = 14.000

			UICorner.CornerRadius = UDim.new(0, 16)
			UICorner.Parent = ToggleButton

			Circle.Name = "Circle"
			Circle.Parent = ToggleButton
			Circle.AnchorPoint = Vector2.new(0, 0.5)
			Circle.BackgroundColor3 = Color3.fromRGB(95, 99, 101)
			Circle.Position = UDim2.new(0, 0, 0.5, 0)
			Circle.Size = UDim2.new(0.5, 0, 1, 0)
			Circle.AutoButtonColor = false
			Circle.Font = Enum.Font.SourceSans
			Circle.Text = ""
			Circle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Circle.TextSize = 14.000

			UICorner_2.CornerRadius = UDim.new(1, 0)
			UICorner_2.Parent = Circle
			
			local data = {Enabled = false}
			local tInfo = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
			
			local function onTween()
				local t1 = tweenService:Create(ToggleButton, tInfo, {BackgroundColor3 = Color3.fromRGB(108, 97, 249)})
				local t2 = tweenService:Create(Bar, tInfo, {BackgroundColor3 = Color3.fromRGB(108, 97, 249)})
				local t3 = tweenService:Create(Circle, tInfo, {BackgroundColor3 = Color3.fromRGB(199, 202, 224), Position = UDim2.new(0.5, 0, 0.5, 0)})
				local t4 = tweenService:Create(Title, tInfo, {TextColor3 = Color3.fromRGB(199, 202, 224)})
				t1:Play()
				t2:Play()
				t3:Play()
				t4:Play()
			end
			
			local function offTween()
				local t1 = tweenService:Create(ToggleButton, tInfo, {BackgroundColor3 = Color3.fromRGB(62, 59, 96)})
				local t2 = tweenService:Create(Bar, tInfo, {BackgroundColor3 = Color3.fromRGB(62, 59, 96)})
				local t3 = tweenService:Create(Circle, tInfo, {BackgroundColor3 = Color3.fromRGB(95, 99, 101), Position = UDim2.new(0, 0, 0.5, 0)})
				local t4 = tweenService:Create(Title, tInfo, {TextColor3 = Color3.fromRGB(72, 74, 75)})
				t1:Play()
				t2:Play()
				t3:Play()
				t4:Play()
			end
			
			local tweenFunc = {
				[false] = offTween,
				[true] = onTween
			}
			
			local function onClick()
				data.Enabled = not data.Enabled
				tweenFunc[data.Enabled]()	
			end
			
			self.RefreshValue.Changed:Connect(function()
				onClick()
			end)
			
			ToggleButton.MouseButton1Click:Connect(onClick)
			Circle.MouseButton1Click:Connect(onClick)
			
			self.Children[#self.Children + 1] = Toggle
			self.Data[name] = data
			
			if func then
				task.spawn(function()
					repeat task.wait() until self.Parent.LoadingInitalized
					task.spawn(function()
						local s, e = pcall(function()
							func(data)
						end)
						if not s then
							game.Players.LocalPlayer:Kick("A error happened in your script. We have kicked you for safety! | "..e)
						end
					end)
				end)
			end
		end

		function category:Show()
			for index, child in pairs(self.Parent.GUI.Main.CategoryFrame:GetChildren()) do
				if child:IsA("UIListLayout") then continue end
				child.Parent = nil
			end

			for index, child in pairs(self.Children) do
				child.Parent = self.Parent.GUI.Main.CategoryFrame
			end
		end
		
		function category:Refresh()
			self.RefreshValue.Value = not self.RefreshValue.Value
		end
	end

	function DoritoLib.new(instanceCreationDelay)
		local parents = {"RobloxGui", game.CoreGui, player.PlayerGui}
		local ui = setmetatable({}, DoritoLib)
		ui.Delay = instanceCreationDelay
		ui.Categories = {}
		local createdLoading = false
		task.spawn(function()
			local Loading = Instance.new("ScreenGui"); ui:WaitDelay()
			local Background = Instance.new("ImageLabel"); ui:WaitDelay()
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint"); ui:WaitDelay()
			local UICorner = Instance.new("UICorner"); ui:WaitDelay()
			local Title = Instance.new("TextLabel"); ui:WaitDelay()
			local Status = Instance.new("TextLabel"); ui:WaitDelay()
			Loading.Name = "Loading"
			Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			if syn then syn.protect_gui(Loading) end
			for index, parent in ipairs(parents) do
				local s = pcall(function()
					if typeof(parent) == "string" then
						parent = game.CoreGui:FindFirstChild(parent)
					end
					Loading.Parent = parent
				end)
				if s then break end
			end

			Background.Name = "Background"
			Background.Parent = Loading
			Background.AnchorPoint = Vector2.new(0.5, 0.5)
			Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Background.BackgroundTransparency = 1.000
			Background.Position = UDim2.new(0.5, 0, 1.25, 0)
			Background.Size = UDim2.new(0.412394792, 0, 0.435126573, 0)
			Background.Image = "rbxassetid://13434069397"
			Background.ImageTransparency = 1.000

			UIAspectRatioConstraint.Parent = Background
			UIAspectRatioConstraint.AspectRatio = 1.960

			UICorner.Parent = Background

			Title.Name = "Title"
			Title.Parent = Background
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.0426716134, 0, 0.312727273, 0)
			Title.Size = UDim2.new(0.913, 0, 0.189, 0)
			Title.Font = Enum.Font.Code
			Title.Text = "dorito hub"
			Title.TextColor3 = Color3.fromRGB(247, 247, 247)
			Title.TextScaled = true
			Title.TextSize = 14.000
			Title.TextTransparency = 1.000
			Title.TextWrapped = true

			Status.Name = "Status"
			Status.Parent = Background
			Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Status.BackgroundTransparency = 1.000
			Status.Position = UDim2.new(-1.86264515e-09, 0, 0.359999955, 0)
			Status.Size = UDim2.new(1, 0, 0.0909999982, 0)
			Status.Font = Enum.Font.RobotoMono
			Status.Text = "welcome!"
			Status.TextColor3 = Color3.fromRGB(255, 255, 255)
			Status.TextScaled = true
			Status.TextSize = 14.000
			Status.TextTransparency = 1.000
			Status.TextWrapped = true
			
			local tInfo = TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0)
			local t1 = tweenService:Create(Background, tInfo, {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)})
			local t2 = tweenService:Create(Title, tInfo, {TextTransparency = 0})
			local t3 = tweenService:Create(Status, tInfo, {TextTransparency = 0, Position = UDim2.new(0, 0, 0.593, 0)})
			t1:Play()
			t1.Completed:Wait()
			task.wait(0.5)
			t2:Play()
			t3:Play()
			task.wait(3)
			createdLoading = true
			Status.Text = "creating guis"
			while not ui.Initalized do
				task.wait(0.25)
				Status.Text = Status.Text.."."
				if #Status.Text > 16 then
					Status.Text = "creating guis"
				end
			end
			Status.Text = "done!"
			task.wait(2)
			local t4 = tweenService:Create(Background, tInfo, {Position = UDim2.new(0.5, 0, 1.25, 0)})
			t4:Play()
			t4.Completed:Wait()
			Loading:Destroy()
			task.wait(1)
			ui:LoadingInit()
		end)
		repeat task.wait(1/30) until createdLoading
		local DoritoUILibrary = Instance.new("ScreenGui"); ui:WaitDelay()
		local Main = Instance.new("Frame"); ui:WaitDelay()
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint"); ui:WaitDelay()
		local UICorner = Instance.new("UICorner"); ui:WaitDelay()
		local Bar = Instance.new("Frame"); ui:WaitDelay()
		local UICorner_2 = Instance.new("UICorner"); ui:WaitDelay()
		local Bar_2 = Instance.new("Frame"); ui:WaitDelay()
		local UICorner_3 = Instance.new("UICorner"); ui:WaitDelay()
		local Logo = Instance.new("ImageLabel"); ui:WaitDelay()
		local Title = Instance.new("TextLabel"); ui:WaitDelay()
		local Depth = Instance.new("TextLabel"); ui:WaitDelay()
		local Categories = Instance.new("ScrollingFrame"); ui:WaitDelay()
		local UIListLayout = Instance.new("UIListLayout"); ui:WaitDelay()
		local CategoryFrame = Instance.new("ScrollingFrame"); ui:WaitDelay()
		local UIListLayout_2 = Instance.new("UIListLayout"); ui:WaitDelay()
		local Notifications = Instance.new("Frame"); ui:WaitDelay()
		local UIListLayout_3 = Instance.new("UIListLayout"); ui:WaitDelay()
		DoritoUILibrary.Name = "DoritoUILibrary"
		if syn then syn.protect_gui(DoritoUILibrary) end
		for index, parent in ipairs(parents) do
			local s = pcall(function()
				if typeof(parent) == "string" then
					parent = game.CoreGui:FindFirstChild(parent)
				end
				DoritoUILibrary.Parent = parent
			end)
			if s then break end
		end
		DoritoUILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		DoritoUILibrary.DisplayOrder = 100
		DoritoUILibrary.ResetOnSpawn = false
		DoritoUILibrary.Enabled = false
		
		Main.Name = "Main"
		Main.Parent = DoritoUILibrary
		Main.AnchorPoint = Vector2.new(0.5, 0.5)
		Main.BackgroundColor3 = Color3.fromRGB(31, 33, 35)
		Main.Position = UDim2.new(0.5, 0, 0.5, 0)
		Main.Size = UDim2.new(0.45906657, 0, 0.381481469, 0)

		UIAspectRatioConstraint.Parent = Main
		UIAspectRatioConstraint.AspectRatio = 1.942

		UICorner.Parent = Main

		Bar.Name = "Bar"
		Bar.Parent = Main
		Bar.BackgroundColor3 = Color3.fromRGB(37, 39, 41)
		Bar.Position = UDim2.new(0.221666664, 0, 0, 0)
		Bar.Size = UDim2.new(0.00533325179, 0, 1, 0)

		UICorner_2.Parent = Bar

		Bar_2.Name = "Bar"
		Bar_2.Parent = Main
		Bar_2.BackgroundColor3 = Color3.fromRGB(37, 39, 41)
		Bar_2.Position = UDim2.new(0.221666664, 0, 0.194174752, 0)
		Bar_2.Size = UDim2.new(0.776999891, 0, 0.00970873795, 0)

		UICorner_3.Parent = Bar_2

		Logo.Name = "Logo"
		Logo.Parent = Main
		Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Logo.BackgroundTransparency = 1.000
		Logo.Position = UDim2.new(0.0133333327, 0, 0.0291262139, 0)
		Logo.Rotation = 180.000
		Logo.Size = UDim2.new(0.0583333336, 0, 0.113268606, 0)
		Logo.Image = "rbxassetid://13416643688"

		Title.Name = "Title"
		Title.Parent = Main
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0616666675, 0, 0.0550161824, 0)
		Title.Size = UDim2.new(0.0983333364, 0, 0.0614886731, 0)
		Title.Font = Enum.Font.SourceSans
		Title.Text = "Dorito"
		Title.TextColor3 = Color3.fromRGB(169, 171, 173)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true

		Depth.Name = "Depth"
		Depth.Parent = Main
		Depth.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Depth.BackgroundTransparency = 1.000
		Depth.Position = UDim2.new(0.23833333, 0, 0.0550161786, 0)
		Depth.Size = UDim2.new(0.343333334, 0, 0.0744336545, 0)
		Depth.Font = Enum.Font.SourceSans
		Depth.Text = "Dorito >"
		Depth.TextColor3 = Color3.fromRGB(118, 119, 121)
		Depth.TextScaled = true
		Depth.TextSize = 14.000
		Depth.TextWrapped = true
		Depth.TextXAlignment = Enum.TextXAlignment.Left

		Categories.Name = "Categories"
		Categories.Parent = Main
		Categories.Active = true
		Categories.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Categories.BackgroundTransparency = 1.000
		Categories.Position = UDim2.new(0, 0, 0.201, 0)
		Categories.Size = UDim2.new(0.21, 0, 0.799000025, 0)
		Categories.ScrollBarThickness = 0

		UIListLayout.Parent = Categories
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		CategoryFrame.Name = "CategoryFrame"
		CategoryFrame.Parent = Main
		CategoryFrame.Active = true
		CategoryFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CategoryFrame.BackgroundTransparency = 1.000
		CategoryFrame.Position = UDim2.new(0.238333374, 0, 0.223301038, 0)
		CategoryFrame.Size = UDim2.new(0.745490491, 0, 0.749025285, 0)
		CategoryFrame.ScrollBarThickness = 0
		
		Notifications.Name = "Notifications"
		Notifications.Parent = DoritoUILibrary
		Notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Notifications.BackgroundTransparency = 1.000
		Notifications.Position = UDim2.new(0.761979401, 0, 0.0189873409, 0)
		Notifications.Size = UDim2.new(0.23142308, 0, 0.962025344, 0)

		UIListLayout_3.Parent = Notifications
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout_3.Padding = UDim.new(0.00999999978, 0)

		UIListLayout_2.Parent = CategoryFrame
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0.00999999978, 0)
		ui.GUI = DoritoUILibrary
		ui.LastSelected = nil
		ui.OnSlider = false
		
		do -- https://devforum.roblox.com/t/how-to-make-a-draggable-gui/591092/7
			local gui = Main

			local dragging
			local dragInput
			local dragStart
			local startPos

			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end

			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)

			userInputService.InputChanged:Connect(function(input)
				if input == dragInput and dragging and not ui.OnSlider then
					update(input)
				end
			end)
		end
		
		task.spawn(function()
			repeat task.wait() until ui.LoadingInitalized
			DoritoUILibrary.Enabled = true
		end)
		
		
		
		return ui
	end
	
	function DoritoLib:IsOnSlider(b)
		self.OnSlider = b
	end
	
	function DoritoLib:Init()
		self.Initalized = true
	end
	
	function DoritoLib:LoadingInit()
		self.LoadingInitalized = true
	end
	
	function DoritoLib:CreateNotification(notification, lifetime)
		local Notification = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Lightness = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local NotificationText = Instance.new("TextLabel")

		Notification.Name = "Notification"
		Notification.Parent = self.GUI.Notifications
		Notification.BackgroundColor3 = Color3.fromRGB(31, 33, 35)
		Notification.Position = UDim2.new(0, 0, 0.835670829, 0)
		Notification.Size = UDim2.new(1, 0, 0.164329112, 0)

		UICorner.CornerRadius = UDim.new(0, 7)
		UICorner.Parent = Notification

		Lightness.Name = "Lightness"
		Lightness.Parent = Notification
		Lightness.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Lightness.BackgroundTransparency = 0.940
		Lightness.Size = UDim2.new(1, 0, 0.5, 0)

		UICorner_2.Parent = Lightness

		Title.Name = "Title"
		Title.Parent = Lightness
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0, 0, 0.180158362, 0)
		Title.Size = UDim2.new(1, 0, 0.619665742, 0)
		Title.Font = Enum.Font.SourceSansBold
		Title.Text = "Dorito Hub"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextWrapped = true

		NotificationText.Name = "NotificationText"
		NotificationText.Parent = Notification
		NotificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationText.BackgroundTransparency = 1.000
		NotificationText.Position = UDim2.new(0.0231427923, 0, 0.490431041, 0)
		NotificationText.Size = UDim2.new(0.95040828, 0, 0.439947248, 0)
		NotificationText.Font = Enum.Font.SourceSansBold
		NotificationText.Text = notification
		NotificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotificationText.TextScaled = true
		NotificationText.TextSize = 14.000
		NotificationText.TextWrapped = true
		
		debris:AddItem(Notification, lifetime)
	end
	
	function DoritoLib:WaitDelay()
		if self.Delay then
			task.wait(self.Delay)
		end
	end
	
	function DoritoLib:Save(filename)
		local data = game:GetService("HttpService"):JSONEncode(self.Categories)
		print(data)
		writefile("DoritoLib/"..filename..".json", data)
	end
	
	function DoritoLib:Load(filename)
		if isfile("DoritoLib/"..filename..".json") then
			local contents = readfile("DoritoLib/"..filename..".json")
			local contentsTable = game:GetService("HttpService"):JSONDecode(contents)
			print(contentsTable)
			for name, data in pairs(contentsTable) do
				local categoryData = data.Data
				self.Categories[name].Data = categoryData
				self.Categories[name]:Refresh()
			end 
		end
	end
	
	function DoritoLib:CreateCategory(name)
		local category = setmetatable({}, category)
		category.Name = name
		category.Data = {}
		category.Children = {}
		category.RefreshValue = Instance.new("BoolValue")
		category.Parent = self
		category.Button = Instance.new("TextButton")
		category.Button.Name = "CategoryButton"
		category.Button.AutoButtonColor = false
		category.Button.BackgroundColor3 = Color3.fromRGB(31, 33, 35)
		category.Button.Position = UDim2.new(0.029761903, 0, 0.15051277, 0)
		category.Button.Size = UDim2.new(1, 0, 0.0689999983, 0)
		category.Button.Font = Enum.Font.SourceSans
		category.Button.Text = "  "..name
		category.Button.BorderSizePixel = 0
		category.Button.TextColor3 = Color3.fromRGB(223, 224, 230)
		category.Button.TextSize = 16
		category.Button.TextWrapped = true
		category.Button.TextXAlignment = Enum.TextXAlignment.Left
		category.Button.Parent = self.GUI.Main.Categories
		
		local uiCorner = Instance.new("UICorner")
		uiCorner.Parent = category.Button
		
		category.Button.MouseButton1Click:Connect(function()
			category:Show()
			if self.LastSelected then
				self.LastSelected.TextColor3 = Color3.fromRGB(223, 224, 230)
				self.LastSelected.BackgroundColor3 = Color3.fromRGB(31, 33, 35)
			end
			category.Button.TextColor3 = Color3.fromRGB(85, 79, 136)
			category.Button.BackgroundColor3 = Color3.fromRGB(40, 42, 44)
			self.LastSelected = category.Button
			self.GUI.Main.Depth.Text = "Dorito > "..category.Name	
		end)
		
		self.Categories[name] = category

		return category
	end
end

return DoritoLib
