function open(name)
    return function()
        hs.application.launchOrFocus(name)

        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

local Open = {
  app = open
}

return Open
