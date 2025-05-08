Events.OnGameStart.Add(function()
    if getActivatedMods():contains("ammomaker") then
        local recipesToUnhide = {
            "Base.Make 5.7mm Ammo [VFEP93]",
            "Base.Make 4.6mm Ammo [VFEP93]",
        }

        for _, recipeName in ipairs(recipesToUnhide) do
            local recipe = getScriptManager():getRecipe(recipeName)
            if recipe then
                recipe:setIsHidden(false)
            end
        end
    end
end)