-- Load AntiChatLogger to prevent chat logging detection
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua", true))()

-- Function to remove HD Admin components from the game
local function removeHDAdmin()
    local defaultPaths = {
        "Workspace.HDAdminWorkspaceFolder",
        "Workspace.HDAdminStarterCharacter",
        "ReplicatedStorage.HDAdminHDClient",
        "ReplicatedStorage.HDAdminHDClient.StarterKit",
        "ReplicatedStorage.HDAdminSetup",
        "ReplicatedStorage.HDAdminReference",
        "StarterPlayer.StarterCharacterScripts.HDAdminStarterCharacter",
        "StarterGui.HDAdminInterface",
        "Players.LocalPlayer.PlayerGui.HDAdminInterface",
        "ReplicatedStorage.HDAdminHDClient.StarterKit.HDAdminInterface"
    }

    -- Remove HD Admin components from default paths
    local function removeDefaultComponents()
        for _, path in ipairs(defaultPaths) do
            local current = game
            for part in string.gmatch(path, "[^.]+") do
                current = current:FindFirstChild(part)
                if not current then break end
            end
            if current then
                pcall(current.Destroy, current)
            end
        end
    end

    -- Remove HD Admin plugin from ReplicatedStorage
    local function removeHDAdminPlugin()
        local hdAdminPlugin = game:GetService("ReplicatedStorage"):FindFirstChild("HDAdmin")
        if hdAdminPlugin then
            pcall(hdAdminPlugin.Destroy, hdAdminPlugin)
        end
    end

    -- Recursively remove HD Admin components from a given service
    local function recursiveRemove(service)
        for _, child in ipairs(service:GetChildren()) do
            if string.match(child.Name, "HDAdmin") or string.match(child.Name, "HD") then
                pcall(child.Destroy, child)
            end
            if child:IsA("Folder") or child:IsA("Model") then
                recursiveRemove(child)
            end
        end
    end

    -- Attempt to remove HD Admin components
    local function attemptRemove()
        removeHDAdminPlugin()
        removeDefaultComponents()

        -- Check additional services for HD Admin components
        local servicesToCheck = {
            game:GetService("Workspace"),
            game:GetService("ReplicatedStorage"),
            game:GetService("StarterPlayer"),
            game:GetService("StarterPlayer").StarterCharacterScripts,
            game:GetService("StarterGui"),
            game:GetService("Players"),
            game:GetService("CoreGui"),
            game:GetService("Players").LocalPlayer.PlayerGui
        }

        for _, service in ipairs(servicesToCheck) do
            recursiveRemove(service)
        end

        -- Continuously check for HD Admin components
        while true do
            task.wait(1)
            for _, service in ipairs(servicesToCheck) do
                recursiveRemove(service)
            end
        end
    end

    attemptRemove()
end

removeHDAdmin()

-- Emote Animation list (Huge Thanks To Krone From His OP Fling Script For This Part)
local animations = {
    3333499508, 3695333486, 3333136415, 3338042785, 4940561610, 4940564896, 4841399916,
    4641985101, 4555782893, 4265725525, 3338097973, 3333432454, 3333387824, 4406555273,
    4212455378, 4049037604, 3695300085, 3695322025, 5915648917, 5915714366, 5918726674,
    5917459365, 5915712534, 5915713518, 5937558680, 5918728267, 5937560570, 507776043,
    507777268, 507771019
}

-- Play a random dance animation
local randomDance = animations[math.random(1, #animations)]
local danceAnim = Instance.new("Animation")
danceAnim.AnimationId = "rbxassetid://" .. tostring(randomDance)

local function playDanceAnimation()
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animationTrack = humanoid:LoadAnimation(danceAnim)
        animationTrack:Play(1, 5, 1)
    end
end

playDanceAnimation()

-- Function to send sarcastic chat messages
local function sendSarcasticMessages()
    local sarcasticMessages = {
        "Oh, look, HD Admin is in this game. How surprising... Not.",
        "Wow, HD Admin. Just what this game needed. Sarcasm level: 100.",
        "HD Admin? Oh, please, give me more of that. Not.",
        "I really needed HD Admin in my game... said no one ever.",
        "HD Admin? Well, that's just the cherry on top of this chaos.",
        "Just what we needed... more HD Admin to ruin everything. Thanks, I guess.",
        "HD Admin is here! Oh wait, it isn't anymore. See ya!",
        "Wow, HD Admin, how unique. No one saw that coming.",
        "HD Admin? Well, it was fun while it lasted... Just kidding. Goodbye!",
        "Oh, look! Another HD Admin! This game is saved, right? Nope, gone now.",
        "HD Admin? Oh, I thought it was just a myth.",
        "More HD Admin? I’m thrilled... not.",
        "HD Admin strikes again. Too bad it’s already gone.",
        "Oh, the nostalgia of HD Admin... just kidding.",
        "Another HD Admin moment... because we really needed that.",
        "HD Admin, you are the real MVP... of ruining things.",
        "HD Admin, the hero no one asked for.",
        "We need more HD Admin in this game... said no one.",
        "HD Admin: Because who doesn't want to add chaos?",
        "The best part of the game? The moment HD Admin left.",
        "HD Admin? Yeah, I’ve had enough of that.",
        "HD Admin, you were never welcome here anyway.",
        "Oh look, it’s HD Admin! Back to ruin the fun.",
        "HD Admin? Yeah, I was hoping for something else.",
        "HD Admin? Oh, please, not this again.",
        "More HD Admin, just what I needed.",
        "HD Admin, a feature no one asked for.",
        "HD Admin? I thought we were done with that.",
        "It’s HD Admin. Again. Because why not?",
        "HD Admin. The game killer. Thanks, but no thanks.",
        "HD Admin? Oh, the nostalgia of disappointment.",
        "I thought HD Admin was gone... guess not.",
        "HD Admin ruins everything. Bye!",
        "HD Admin? Oh, what a surprise... NOT.",
        "HD Admin? Yeah, that’s exactly what I wanted to see.",
        "More HD Admin... because that’s what the game needed.",
        "HD Admin is back! Or maybe it never left.",
        "HD Admin? I’ll pass.",
        "Another HD Admin? Wow, just wow.",
        "HD Admin, the game’s biggest mistake.",
        "HD Admin, still here to ruin your fun.",
        "HD Admin? That’s a hard pass for me.",
        "I didn't ask for HD Admin. Yet here it is.",
        "HD Admin is like a bad song on repeat.",
        "HD Admin, the gift that keeps on disappointing.",
        "We’re really doing this again with HD Admin?",
        "HD Admin, causing chaos since forever.",
        "HD Admin? Yeah, let’s not.",
        "Another HD Admin? Oh joy.",
        "HD Admin, why do you keep coming back?",
        "HD Admin? Just when I thought the game was safe.",
        "HD Admin ruins my day, every day.",
        "Oh, it’s HD Admin... not again.",
        "HD Admin, making everything worse, one game at a time.",
        "HD Admin? Yeah, that’s enough for today.",
        "HD Admin, always causing problems.",
        "HD Admin? Oh great, here we go again.",
        "HD Admin, the game’s biggest nuisance.",
        "HD Admin? Just leave already.",
        "HD Admin? Yeah, no thanks.",
        "More HD Admin? Pass.",
        "HD Admin? Get out of here.",
        "HD Admin? Not today.",
        "HD Admin, making games unplayable.",
        "HD Admin? This again?",
        "HD Admin, ruining Roblox since its inception.",
        -- New sarcastic messages about ForeverHD
        "ForeverHD: The mastermind behind HD Admin. What a legacy...",
        "Oh look, ForeverHD brought us HD Admin. How original.",
        "Thank you ForeverHD for creating HD Admin. Said no one, ever.",
        "ForeverHD, the gift that keeps on disappointing. Thanks for HD Admin!",
        "Just when we thought Roblox was safe, ForeverHD brings us HD Admin.",
        "ForeverHD, truly the unsung hero of Roblox... If the hero was chaos.",
        "HD Admin: ForeverHD’s idea of a joke.",
        "ForeverHD: Making Roblox worse, one HD Admin at a time.",
        "I didn’t know ForeverHD was behind this chaos. Now I do, and I regret it.",
        "HD Admin: The proud creation of ForeverHD. Enjoy the disappointment.",
        "ForeverHD’s HD Admin. Because who doesn’t love a little chaos?",
        "Thanks to ForeverHD, HD Admin is now a thing. How lucky are we?",
        "ForeverHD’s HD Admin: Making every game better… at ruining it.",
        "HD Admin by ForeverHD: Because the world really needed more problems.",
        "ForeverHD, the genius behind HD Admin. Truly a role model.",
        "Let’s thank ForeverHD for HD Admin. It’s not like we had enough problems already.",
        "ForeverHD made HD Admin. So, thanks for that... I guess?",
        "ForeverHD, where chaos is the product and HD Admin is the proof.",
        "HD Admin by ForeverHD. Because subtlety is overrated.",
        "A round of applause for ForeverHD. HD Admin has arrived.",
        "ForeverHD and HD Admin: The perfect storm of frustration.",
        "HD Admin, brought to you by ForeverHD. Get ready for disappointment.",
        "Thanks ForeverHD for HD Admin. It’s just what the community needed… Not.",
        "ForeverHD: Bringing HD Admin to ruin every game.",
        "ForeverHD, where ruining Roblox is an art form.",
        "HD Admin: ForeverHD’s masterpiece of chaos.",
        "ForeverHD, the developer that just won’t quit… ruining things.",
        "Who knew ForeverHD’s legacy would be HD Admin? What a joke.",
        "ForeverHD: The developer behind the chaos of HD Admin. Congrats, I guess.",
        "Thank you, ForeverHD, for HD Admin. Your contribution to chaos is unmatched.",
        "HD Admin by ForeverHD: The gift that keeps on giving… frustration.",
        "ForeverHD, the reason we all wish for HD Admin to go away.",
        "ForeverHD, truly a visionary. And by visionary, I mean chaos creator.",
        "ForeverHD made HD Admin… and now we’re all paying the price.",
        "HD Admin: ForeverHD’s legacy of annoyance.",
        "ForeverHD, bringing HD Admin and the drama we didn’t want.",
        "HD Admin is forever here… Thanks, ForeverHD.",
        "ForeverHD, bringing the chaos with every HD Admin update."
    }

    -- Detect the chat service (TextChatService for new chat, DefaultChatSystemChatEvents for old chat)
    local chatService = game:GetService("TextChatService")
    local legacyChatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")

    local function sendMessage(message)
        if chatService and chatService:FindFirstChild("TextChannels") then
            -- New chat system
            local generalChannel = chatService.TextChannels:FindFirstChild("RBXGeneral")
            if generalChannel then
                generalChannel:SendAsync(message)
            end
        elseif legacyChatEvents then
            -- Old chat system
            legacyChatEvents.SayMessageRequest:FireServer(message, "All")
        end
    end

    -- Show startup messages
    sendMessage("HD Admin Remover [Premium Version] Made By Natsukawa")
    task.wait(2)
    sendMessage("Blue app: nnatsukawa")

    -- Send sarcastic messages
    for _, message in ipairs(sarcasticMessages) do
        sendMessage(message)
        task.wait(1)
    end
end

sendSarcasticMessages()
