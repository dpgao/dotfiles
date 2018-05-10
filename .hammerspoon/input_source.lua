local mappings = {
    help = 'com.apple.inputmethod.SCIM.ITABC',
    forwarddelete = 'com.apple.inputmethod.TCIM.Pinyin',
    padclear = 'com.apple.keylayout.ABC'
}

for k, v in pairs(mappings) do
    hs.hotkey.bind('', k, function () hs.keycodes.currentSourceID(v) end)
end
