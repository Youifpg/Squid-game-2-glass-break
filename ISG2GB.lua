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
    local segmentSystem = workspace:FindFirstChild("segmentSystem")
if not segmentSystem then
    warn("segmentSystem not found in workspace.")
    return
end

local segments = segmentSystem:FindFirstChild("Segments")
if not segments then
    warn("Segments not found in segmentSystem.")
    return
end

-- Counter for segments with changed colors
local changedSegmentCount = 0

-- Iterate through each segment
for _, segment in ipairs(segments:GetChildren()) do
    if segment:IsA("Model") then -- Ensure it's a model
        local folder = segment:FindFirstChild("Folder")
        if folder then
            -- Get all children in the folder
            local parts = folder:GetChildren()
            local segmentChanged = false -- Track if any part in this segment was changed
            for _, part in ipairs(parts) do
                if part:IsA("Part") and part:FindFirstChild("breakable") then
                    -- Check if the breakable property is true
                    if part.breakable.Value == true then
                        -- Change the color to yellow
                        part.BrickColor = BrickColor.new("Bright yellow")
                        segmentChanged = true -- Mark that this segment has changed
                    end
                end
            end
            -- If any part in this segment was changed, increment the counter
            if segmentChanged then
                changedSegmentCount = changedSegmentCount + 1
            end
        end
    end
end

-- Print the total number of segments that had their parts changed
print("Total segments with changed colors: " .. changedSegmentCount)
end)
        end)

