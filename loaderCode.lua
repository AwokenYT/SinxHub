local coreGui = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService")

function createTween(Object, setup, settings)
	local style = (settings.Style or Enum.EasingStyle.Sine);
	local direction = (settings.Direction or Enum.EasingDirection.InOut);
	local length = (settings.TIME or 1);
	local repeatcount = (settings.repeatLimit or 0);
	local reverse = (settings.IsReversed or false);
	local dt = (settings.delay or 0);

	local tween = TweenInfo.new(
		length, style, direction, repeatcount, reverse, dt
	);

	local tweenService = game:GetService("TweenService");
	local Anim = tweenService:Create(Object, tween, setup);
	Anim:Play();
	return Anim;
end

function RUN_FUNCTION(name, extension, configOpt)
	local settings = configOpt;
	local PATH_URL = settings.URL or nil;
	local GAME_NAME = "";

	local success = pcall(function()
		game:HttpGet(PATH_URL)
	end);

	local DecodedTable;
	if (success) then
		if extension == "lua" then
			DecodedTable = loadstring(game:HttpGet(PATH_URL))()
		elseif extension == "json" then
			DecodedTable = game:GetService("HttpService"):JSONDecode(game:HttpGet(PATH_URL))
		end

		settings.Executable = ""
		for i, v in pairs(DecodedTable) do
			if (game.PlaceId == tonumber(i) and v.name and v.Working) then
				local connection = pcall(function()
					settings.Executable = game:HttpGet(v.Script)

				end);

				GAME_NAME = v.name
			end
		end
	end

	spawn(function()
		local SinxHub = Instance.new("ScreenGui")
		local Loader = Instance.new("Frame")
		local Title = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local LoadBar = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Bar = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Message = Instance.new("TextLabel")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
		local UICorner_3 = Instance.new("UICorner")

		--Properties:

		SinxHub.Name = "SinxHub"
		SinxHub.Parent = coreGui
		SinxHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		SinxHub.ResetOnSpawn = false

		Loader.Name = "Loader"
		Loader.Parent = SinxHub
		Loader.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
		Loader.BackgroundTransparency = 0.050
		Loader.Position = UDim2.new(0.393697798, 0, 0.416949153, 0)

		Title.Name = "Title"
		Title.Parent = Loader
		Title.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.132094115, 0, 0, 0)
		Title.Size = UDim2.new(0.698896229, 0, 0.280229211, 0)
		Title.Font = Enum.Font.Gotham
		Title.Text = "SinxHub Loader"
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextScaled = true
		Title.TextSize = 14.000
		Title.TextTransparency = 1.000
		Title.TextWrapped = true

		UITextSizeConstraint.Parent = Title
		UITextSizeConstraint.MaxTextSize = 27

		LoadBar.Name = "LoadBar"
		LoadBar.Parent = Loader
		LoadBar.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
		LoadBar.BackgroundTransparency = 1.000
		LoadBar.Position = UDim2.new(0.0321428478, 0, 0.642857194, 0)
		LoadBar.Size = UDim2.new(0.932358623, 0, 0.277718574, 0)

		UICorner.Parent = LoadBar

		Bar.Name = "Bar"
		Bar.Parent = LoadBar
		Bar.BackgroundColor3 = Color3.fromRGB(0, 231, 0)
		Bar.BackgroundTransparency = 1.000
		Bar.Size = UDim2.new(0, 0, 1, 0)

		UICorner_2.Parent = Bar

		Message.Name = "Message"
		Message.Parent = Loader
		Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Message.BackgroundTransparency = 1.000
		Message.Position = UDim2.new(0.132094175, 0, 0.310391366, 0)
		Message.Size = UDim2.new(0.698896229, 0, 0.298308522, 0)
		Message.Font = Enum.Font.GothamMedium
		Message.Text = "Welcome, Weblery"
		Message.TextColor3 = Color3.fromRGB(255, 255, 255)
		Message.TextScaled = true
		Message.TextSize = 17.000
		Message.TextTransparency = 1.000
		Message.TextWrapped = true

		UITextSizeConstraint_2.Parent = Message
		UITextSizeConstraint_2.MaxTextSize = 17

		UICorner_3.Parent = Loader

		wait(2)

		createTween(Loader, { Size = UDim2.new(0.213, 0, 0.166, 0) }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		})

		createTween(Title, { TextTransparency = 0 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		})

		createTween(Message, { TextTransparency = 0 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		}).Completed:Wait(1)

		createTween(LoadBar, { BackgroundTransparency = 0 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		})

		createTween(Bar, { BackgroundTransparency = 0 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		})

		function setSize(int)
			local number = tonumber(int)
			local percent = 1 - ((100 - int) / (100 - 0));

			createTween(Bar, { Size = UDim2.new(percent, 0, 1, 0) }, {
				Style = Enum.EasingStyle.Linear,
				Direction = Enum.EasingDirection.In,
				TIME = .4
			})
		end

		wait(1)
		setSize(20)

		for i = 1, 3 do
			Message.Text = "Checking ."
			wait(.4)
			Message.Text = "Checking . ."
			wait(.4)
			Message.Text = "Checking . . ."
			wait(.4)
		end
		setSize(60)
		Message.Text = "Game Found!"
		wait(1)
		setSize(80)
		Message.Text = GAME_NAME
		wait(.5)
		setSize(100)

		createTween(Bar, { BackgroundTransparency = 1 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		}).Completed:Wait()

		createTween(LoadBar, { BackgroundTransparency = 1 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		})

		Message.Text = "Loaded!"
		wait(.5)
		createTween(Message, { TextTransparency = 1 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		})

		createTween(Title, { TextTransparency = 1 }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		})

		createTween(Loader, { Size = UDim2.new(0, 0, 0, 0) }, {
			Style = Enum.EasingStyle.Linear,
			Direction = Enum.EasingDirection.In,
			TIME = .4
		}).Completed:Wait(1)

		loadstring(settings.Executable)()
		SinxHub:Destroy()
	end)
end

return RUN_FUNCTION;
