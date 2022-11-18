--[[
  ___ ___             __                __                                  __            
 |   Y   .---.-.--.--|  |--.-----.---.-|  .-----.--.--.-----.---.-.-----.--|  .-----.----.
 |.      |  _  |  |  |  _  |  -__|  _  |  |  -__|_   _|__ --|  _  |     |  _  |  -__|   _|
 |. _/   |___._|___  |_____|_____|___._|__|_____|__.__|_____|___._|__|__|_____|_____|__|  
 |:  |   |     |_____|                                                                    
 |::.|:. | _______           __       __             __ ___                               
 `--- ---'|   _   .----.----|__.-----|  |_.-----.   |__|_  `.                             
          |   1___|  __|   _|  |  _  |   _|__ --|    __  |  |                             
          |____   |____|__| |__|   __|____|_____|   |__|_|  |                             
          |:  1   |            |__|                    |___,'                             
          |::.. . |                                                                       
          `-------'                                                                       
                        NC Goggle Finder by maybealexsander
                        every one of my scripts will have this "watermark" on it                                                                         
                        (used for deeznutsware)                                                                                                                                                      
]]

local DebugMode = true -- gives more output

























local Client = game:GetService("Players").LocalPlayer
local Character = Client.Character
local Root = Character.HumanoidRootPart
local FPPSupport

local Notify = function(Title, Text)
	game.StarterGui:SetCore("SendNotification", {
		Title = Title;
		Text = Text;
    })
end

if not fireproximityprompt then
    Notify("Nc goggles finder", "Your exploit/executor doesnt support fireproximityprompt(), autocollect goggle will not work")
    FPPSupport = false
end
if fireproximityprompt then
    if DebugMode == true then
        Notify("Debug mode", "fireproximityprompt() is supported")
    end
    FPPSupport = true
end
task.wait(5)
Notify("Starting main script..")

--[[
if not Nightvision and Blackout.Value == false then
    print("Attempt to find the person who has goggles since the script couldnt detect a blackout event")
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Character:FindFirstChild("NightcrawlerGoggle") then
            print(v.Parent, "has nc")
            Found = true
        end
    end
    if Found == false then
        print("Unable to find player with goggles")
    end
end
-- using this for later because this is barely useful
]]
local Blackout = workspace:FindFirstChild("Events").Blackout
if Blackout.Value == false then
    Notify("Nc goggles finder", "Blackout event not detected, script will wait until blackout event")
    repeat
        task.wait()
    until Blackout.Value == true
    if Blackout.Value == true then
        Notify("Nc goggles finder", "Blackout event detected, starting goggles finder")
        repeat
            task.wait()
            if Blackout.Value == false then
                Notify("Nc goggle finder", "Blackout event ended")
                break
            end
        until workspace.Terrain:FindFirstChild("Nightvision")
        if workspace.Terrain:FindFirstChild("Nightvision") then
            local Nightvision = workspace.Terrain:FindFirstChild("Nightvision")
            if DebugMode == true then
                Notify("Nc goggles finder", "Goggles found, script will fire attempt to collect")
            end
            for i, v in next, (Nightvision:GetChildren()) do
                if v.Name == "Hitbox" then
                    Root.CFrame = v.CFrame
                    task.wait(1)
                    if FPPSupport == true then
                        if v:FindFirstChild("Attachment") then
                            fireproximityprompt(v:FindFirstChild("Attachment").GiveItem)
                        end
                    else
                        if DebugMode == true then
                            Notify("Debug mode", "Autocollect goggle has been disabled; goggles will be not collected automatically")
                        end
                    end
                else
                    if v.Name == "HitBox" then
                        Root.CFrame = v.CFrame
                        task.wait(1)
                        if FPPSupport == true then
                            if v:FindFirstChild("Attachment") then
                                fireproximityprompt(v:FindFirstChild("Attachment").GiveItem)
                            end
                        else
                            if DebugMode == true then
                                Notify("Debug mode", "Autocollect goggle has been disabled; goggles will be not collected automatically")
                            end
                        end
                    end
                end
            end
        end
    end
else
    Notify("Nc goggles finder", "Blackout event detected with first sight, starting goggles finder")
    repeat
        task.wait()
        if Blackout.Value == false then
            Notify("Nc goggle finder", "Blackout event ended")
            break
        end
    until workspace.Terrain:FindFirstChild("Nightvision")
    if workspace.Terrain:FindFirstChild("Nightvision") then
        local Nightvision = workspace.Terrain:FindFirstChild("Nightvision")
        if DebugMode == true then
            Notify("Nc goggles finder", "Goggles found, script will fire attempt to collect")
        end
        for i, v in next, (Nightvision:GetChildren()) do
            if v.Name == "Hitbox" then
                Root.CFrame = v.CFrame
                task.wait(1)
                if FPPSupport == true then
                    if v:FindFirstChild("Attachment") then
                        fireproximityprompt(v:FindFirstChild("Attachment").GiveItem)
                    end
                else
                    if DebugMode == true then
                        Notify("Debug mode", "Autocollect goggle has been disabled; goggles will be not collected automatically")
                    end
                end
            else
                if v.Name == "HitBox" then
                    Root.CFrame = v.CFrame
                    task.wait(1)
                    if FPPSupport == true then
                        if v:FindFirstChild("Attachment") then
                            fireproximityprompt(v:FindFirstChild("Attachment").GiveItem)
                        end
                    else
                        if DebugMode == true then
                            Notify("Debug mode", "Autocollect goggle has been disabled; goggles will be not collected automatically")
                        end
                    end
                end
            end
        end
    end
end
