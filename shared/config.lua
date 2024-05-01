return {
    target = 'ox_target',
    requiredItem = 'trojan_usb',
    hackDuration = '25000',
    minimumPolice = 0,
    minigameIcons = 3,
    minigameTime = 5000,
    dirty = 'black_money',
    amount = math.random(3000,7000),
    alertChance = 100,
    dispatchType = 'ps-dispatch',
    atms = {
        `prop_atm_01`,
        `prop_atm_02`,
        `prop_atm_03`,
        `prop_fleeca_atm`
    },

--- REGARDING THE COOLDOWN. IT IS HANDLED BY XT-COOLDOWNS
-- The cooldowns:isActive callback checks if the global cooldown is active before checking if the specific cooldown is active.

-- Copy
-- -- Check if cooldown is active
-- local isActive = lib.callback.await('cooldowns:isActive', false, cooldownName)

-- -- Enables cooldown
-- local toggle = lib.callback.await('cooldowns:enable', false, cooldownName)
}