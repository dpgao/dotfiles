local configWatcher = hs.pathwatcher.new('~/.hammerspoon/', hs.reload):start()

require('input_source')
require('quit_mode')
