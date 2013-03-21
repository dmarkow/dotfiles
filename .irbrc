require 'rubygems'
require "irb/completion"

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:EVAL_HISTORY] = 10000
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irb-history")

railsrc_path = File.expand_path("~/.irbrc_rails")
if (ENV['RAILS_ENV'] || defined?(Rails)) && File.exist?(railsrc_path)
  begin
    load railsrc_path
  rescue Exception
    warn "Couldn't load: #{railsrc_path} because of #{$!.message}"
  end
end
