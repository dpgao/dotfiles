local quitMode = hs.hotkey.modal.new('cmd', 'q')

function quitMode:entered()
    hs.timer.doAfter(1, function ()
        quitMode:exit()
    end)
end

quitMode:bind('cmd', 'q', function ()
    quitMode:exit()
    hs.application.frontmostApplication():kill()
end)
