require 'rubygems'
require 'irb/completion'
require 'pp'


IRB.conf[:EVAL_HISTORY] = 100000000
IRB.conf[:SAVE_HISTORY] = 100000000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_PROMPT]   = true
IRB.conf[:USE_READLINE] = true

begin
require 'interactive_editor'
require 'awesome_print' # awesome_print
#  require 'wirble'
#  Wirble.init
#  Wirble.colorize
rescue
end
