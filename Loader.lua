--[[

╭━━━┳━━┳━━━━┳━━╮╭╮╱╭┳╮╱╱╭╮╱╱╱╭╮╱╭┳╮╱╭┳━━╮╱╭━╮╭━╮╭╮╱╱╭━━━┳━━━┳━━━┳━━━┳━━━╮
┃╭━╮┣┫┣┫╭╮╭╮┃╭╮┃┃┃╱┃┃┃╱╱┃┃╱╱╱┃┃╱┃┃┃╱┃┃╭╮┃╱╰╮╰╯╭╯┃┃╱╱┃╭━╮┃╭━╮┣╮╭╮┃╭━━┫╭━╮┃
┃╰━╯┃┃┃╰╯┃┃╰┫╰╯╰┫┃╱┃┃┃╱╱┃┃╱╱╱┃╰━╯┃┃╱┃┃╰╯╰╮╱╰╮╭╯╱┃┃╱╱┃┃╱┃┃┃╱┃┃┃┃┃┃╰━━┫╰━╯┃
┃╭━━╯┃┃╱╱┃┃╱┃╭━╮┃┃╱┃┃┃╱╭┫┃╱╭╮┃╭━╮┃┃╱┃┃╭━╮┃╱╭╯╰╮╱┃┃╱╭┫┃╱┃┃╰━╯┃┃┃┃┃╭━━┫╭╮╭╯
┃┃╱╱╭┫┣╮╱┃┃╱┃╰━╯┃╰━╯┃╰━╯┃╰━╯┃┃┃╱┃┃╰━╯┃╰━╯┃╭╯╭╮╰╮┃╰━╯┃╰━╯┃╭━╮┣╯╰╯┃╰━━┫┃┃╰╮
╰╯╱╱╰━━╯╱╰╯╱╰━━━┻━━━┻━━━┻━━━╯╰╯╱╰┻━━━┻━━━╯╰━╯╰━╯╰━━━┻━━━┻╯╱╰┻━━━┻━━━┻╯╰━╯

]]--
local function a()local b="https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Games/Blade%20Ball.lua"local c;local d,e=pcall(function()c=game:HttpGet(b,true)end)if not d then warn("Failed to retrieve the script: "..e)return end;if not c or c==""then warn("The script content is empty or could not be loaded.")return end;d,e=pcall(function()local f=loadstring(c)if f then f()else warn("Failed to load the script: The content is not valid.")end end)if not d then warn("Failed to execute the script: "..e)else print("Script executed successfully.")end end;a()
