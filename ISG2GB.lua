-- File is open source; if you want it, give credit, and if you steal it, you are gay :)
local gameName = "Impossible Squid Game 2 Glass Bridge"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local Window = Library:NewWindow("Arbix Hub | " .. gameName)

local Section = Window:NewSection("Farm")

Section:CreateToggle("Teleport to Chest", function(state)
    local player = game.Players.LocalPlayer -- Get the local player
    local chest = workspace.Finish.Chest -- Reference to the Chest part

    -- Function to simulate touch
    local function simulateTouch()
        local touchInterest = Instance.new("TouchInterest") -- Create a new TouchInterest instance
        touchInterest.Parent = chest -- Parent it to the Chest part
        touchInterest.Touched:Fire(player.Character) -- Fire the Touched event with the player's character
        touchInterest:Destroy() -- Clean up the TouchInterest instance
    end

    -- Function to teleport the player
    local function teleportToChest()
        if chest then
            player.Character:MoveTo(chest.Position) -- Move the player to the Chest's position
            wait(0.1) -- Wait a moment to ensure the player has teleported
            simulateTouch() -- Simulate the touch event
        else
            warn("Chest not found in workspace.Finish")
        end
    end

    -- If the toggle is enabled, teleport the player
    if state then
        teleportToChest()
    end
end)

local Section = Window:NewSection("Segment")

Section:CreateButton("Show Wrong Segment", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ZDgv3hDW"))()
        end)

