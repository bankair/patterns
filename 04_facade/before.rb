pattern = ARGV.shift
paths = ARGV
paths.each do |path|
  lines = File.readlines(path).select do |line|
    line.include? pattern
  end
  puts lines
end
