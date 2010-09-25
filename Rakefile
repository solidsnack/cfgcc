

task :doc do
  if system *%w|which ronn|
    system *%w| ronn --html cfgcc.1.ronn |
    system *%w| ronn --roff cfgcc.1.ronn |
  else
    abort "No `ronn' command; can't build docs."
  end
end

