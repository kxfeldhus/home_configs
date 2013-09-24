require 'rubygems'
require 'irb/completion'
require 'pp'
require 'interactive_editor'


IRB.conf[:EVAL_HISTORY] = 100000000
IRB.conf[:SAVE_HISTORY] = 100000000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_PROMPT]   = true
IRB.conf[:USE_READLINE] = true

# begin
#  require 'wirble'
#  Wirble.init
#  Wirble.colorize
# rescue
# end
