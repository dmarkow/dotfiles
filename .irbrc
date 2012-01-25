# This is the common irbrc file used by all rvm ruby installations.
# This file will be overriden every time you update rvm.

# Turn on completion.
begin
  require "readline"

  require "irb/completion" rescue nil

  # Turn on history saving.
  # require "irb/ext/save-history"
  # IRB.conf[:HISTORY_FILE] = File.join(ENV["HOME"], ".irb-history")

  # Use an alternate way to on history saving until save-history is fixed.
  #
  #   bug:   http://redmine.ruby-lang.org/issues/show/1556
  #   patch: http://pastie.org/513500
  #
  # This technique was adopted from /etc/irbrc on OS X.
  histfile = File.expand_path(".irb-history", ENV["HOME"])

  if File.exists?(histfile)
    lines = IO.readlines(histfile).collect { |line| line.chomp }
    Readline::HISTORY.push(*lines)
  end

  Kernel::at_exit do
    maxhistsize = 1000
    histfile = File::expand_path(".irb-history", ENV["HOME"])
    lines = Readline::HISTORY.to_a.reverse.uniq.reverse
    lines = lines[-maxhistsize, maxhistsize] if lines.compact.length > maxhistsize
    File::open(histfile, "w+") { |io| io.puts lines.join("\n") }
  end

rescue LoadError
  puts "Readline was unable to be required, if you need completion or history install readline then reinstall the ruby.\nYou may follow 'rvm notes' for dependencies and/or read the docs page https://rvm.beginrescueend.com/packages/readline/ . Be sure you 'rvm remove X ; rvm install X' to re-compile your ruby with readline support after obtaining the readline libraries."
end

