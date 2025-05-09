Events.OnGameStart.Add(function()
    if getActivatedMods():contains("ammomaker") then
        local recipesToUnhide = {
            "Base.Make 5.7x28mm [VFE]",
            "Base.Make 4.6x30mm [VFE]",
        }

        for _, recipeName in ipairs(recipesToUnhide) do
            local recipe = getScriptManager():getRecipe(recipeName)
            if recipe then
                recipe:setIsHidden(false)
                print("Unhid recipe: " .. recipeName)
            else
                print("Recipe not found: " .. recipeName)
            end
        end
    end
end)