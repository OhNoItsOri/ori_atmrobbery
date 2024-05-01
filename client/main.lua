local sharedConfig = require 'shared.config'

local function useTrojan()
    Wait(500)
    lib.callback('ori_atmrobbery:server:useTrojan')
    Wait(1000)
    TriggerEvent('ori_atmrobbery:client:hackHandler')
end

local function checkCopAmount()
    if lib.callback('ori_atmrobbery:server:copCheck') then
        useTrojan()
    else
        exports.qbx_core:Notify('Not Enough Cops', 'error')
    end
end

local function startRobbing()
    if lib.progressCircle({
        duration = sharedConfig.hackDuration,
        label = 'Robbing ATM',
        useWhileDead = false,
        canCancel = true,
        position = 'bottom',
        disable = { car = true, move = true, },
        anim = {
            dict = 'anim@scripted@player@freemode@tun_prep_grab_midd_ig3@male@', clip = 'tun_prep_grab_midd_ig3'},
    }) 
    then
        checkCopAmount()
    else
        exports.qbx_core:Notify('Stopped hacking', 'error')
    end
end

local function alertPolice()
    local callChance = math.random(1, 100)
    if sharedConfig.alertChance >= callChance then 
        if sharedConfig.dispatchType == 'ps-dispatch' then
            exports['ps-dispatch']:AtmTheft()
        end
    end
end

local function useTarget()
    if sharedConfig.target == 'ox_target' then
        exports.ox_target:addModel(sharedConfig.atms, {{
            name = 'startRobbery',
            icon = 'fas fa-money-check',
            label = 'Rob ATM',
            items = sharedConfig.requiredItem,
            distance = 2,
            onSelect = function()
                local isActive = lib.callback.await('cooldowns:isActive', false, 'atmrobbery')
                if not isActive then
                    startRobbing()
                    alertPolice()
                else
                    exports.qbx_core:Notify('Does Not Respond to Your Device', 'error')
                end
            end
        }})
    end 
end

AddEventHandler('ori_atmrobbery:client:hackHandler', function()
    local success = exports['howdy-hackminigame']:Begin(sharedConfig.minigameIcons, sharedConfig.minigameTime)
    if success then
        exports.qbx_core:Notify('Success!', 'success')
        local toggle = lib.callback.await('cooldowns:enable', false, 'atmrobbery')
        lib.callback('ori_atmrobbery:server:addmoney')
    else
        exports.qbx_core:Notify('Colours are hard', 'error')
    end
end)


CreateThread(function()
    useTarget()
end)
