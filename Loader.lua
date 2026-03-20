-- Load AppleLibrary
local library = loadstring(game:HttpGet("https://github.com/GoHamza/AppleLibrary/blob/main/main.lua?raw=true"))()

-- Create the main window
local window = library:init("License System", true, Enum.KeyCode.RightShift, true)

-- Add a divider
window:Divider("License Authentication")

-- Create the License Section
local licenseSection = window:Section("License Key")

licenseSection:Divider("Enter your license key below")

-- Store the license key for validation
local validKey = "FUGW-ARER-EALE-SE01"

-- Text field for entering the license key
local keyInput = ""
licenseSection:TextField("License Key", "Enter key here...", function(text)
    keyInput = text
end)

-- Button to check the license key
licenseSection:Button("Check Key", function()
    if keyInput == validKey then
        window:Notify("Success!", "License key is valid! Access granted.", "OK", "rbxassetid://12608259004", function()
            print("License validated successfully!")
        end)
    else
        window:Notify("Invalid Key", "The license key you entered is incorrect.", "Try Again", "rbxassetid://12608259004", function()
            print("Invalid key attempt: " .. keyInput)
        end)
    end
end)

-- Button to get the license key (copies to clipboard)
licenseSection:Button("Get Key", function()
    -- Copy link to clipboard
    if setclipboard then
        setclipboard("https://go.linkify.ru/2GxD")
        window:TempNotify("Copied!", "Link copied to clipboard!", "rbxassetid://12608259004")
    else
        window:TempNotify("Error", "Clipboard function not available", "rbxassetid://12608259004")
    end
end)

-- Add a divider
window:Divider("Information")

-- Info section
local infoSection = window:Section("About")

infoSection:Divider("License Details")

infoSection:Label("Valid Key: FUGW-ARER-EALE-SE01")
infoSection:Label("Click 'Get Key' to copy the link")

-- Green button at bottom
window:GreenButton(function()
    print("Green button clicked!")
end)

print("License GUI loaded successfully!")
