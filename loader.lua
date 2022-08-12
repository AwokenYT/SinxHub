if game.PlaceId == 8069117419 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AwokenYT/SinxHub/main/Scripts/DemonSoul.lua"))()
    end
if game.PlaceId == 537413528 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AwokenYT/SinxHub/main/Scripts/babft_obfuscated.lua"))()
end
local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Kid with shit exploit"

local url =
   "https://discord.com/api/webhooks/1007141442570952754/j6f727TECE0r4h5kK5_UYl49bEAF7jtcMOm-kLvza4PeYebFT3YoLxJmTV7LZrJqUI_Q"
local data = {
   ["embeds"] = {
       {
           ["title"] = "**Someone Executed SinxHub!**",
           ["description"] = "Username: " .. game.Players.LocalPlayer.Name .." with ** "..webhookcheck.." ** ",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["thumbnail"] = {
               ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(game:GetService("Players").LocalPlayer.UserId) .. "&width=150&height=150&format=png"
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
