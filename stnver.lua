plr = game.Players.LocalPlayer
Players = game:GetService("Players")
RS = game:GetService("RunService")
function getKiller()
   for i, player in ipairs(Players:GetPlayers()) do
       if player.Character then
           if player.Character:FindFirstChild("Weapon") then
               return player    
           end
       end
   end
end
faces = {Enum.NormalId.Top,Enum.NormalId.Bottom,Enum.NormalId.Left,Enum.NormalId.Right,Enum.NormalId.Front,Enum.NormalId.Back}
function cham(part,color, trans)
   for i, face in ipairs(faces) do
       newSurface = Instance.new("SurfaceGui",part)    
       newSurface.Face = face
       newSurface.AlwaysOnTop = true
       newSurface.Name = 'cham'
       frame = Instance.new("Frame", newSurface)
       frame.Size = UDim2.new(1,0,1,0)
       frame.BackgroundColor3 = color
       frame.BorderSizePixel = 16
       frame.BackgroundTransparency = trans
   end
end
function hasChams(player)
   if player.Character.Head:FindFirstChild("cham") then
       return true
   end
   return false
end
function giveChams(player)
   for i, child in ipairs(player.Character:GetChildren()) do
       cham(child,Color3.fromRGB(0,255,0),0.6)
   end
end
function colorCode(player)
   killer = getKiller()
   for i, child in ipairs(player.Character:GetChildren()) do
       for j, v in ipairs(child:GetChildren()) do
           if v.Name == 'cham' then    
               if killer.Name == player.Name then
                   v.Frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
               else
                   v.Frame.BackgroundColor3 = Color3.fromRGB(0,255,0)
               end
           end
       end
   end
end
RS.RenderStepped:connect(function()
   for i, player in ipairs(Players:GetPlayers()) do
       if player.Name ~= plr.Name then
           if hasChams(player) then colorCode(player) else giveChams(player) end            
       end
   end
end)