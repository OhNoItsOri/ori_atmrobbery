local sharedConfig = require 'shared.config'

lib.callback.register('ori_atmrobbery:server:useTrojan', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    player.Functions.RemoveItem(sharedConfig.requiredItem , 1)
end)

lib.callback.register('ori_atmrobbery:server:addmoney', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    player.Functions.AddItem(sharedConfig.dirty, sharedConfig.amount)
end)

lib.callback.register('ori_atmrobbery:server:copCheck', function()
    local amount = exports.qbx_core:GetDutyCountType('leo')
    return amount >= sharedConfig.minimumPolice
end)