class ArgumentParser
  attr_reader :pattern, :paths
  def initialize
    @pattern = ARGV.first
    @paths = ARGV[1..-1].clone
  end
end

class Filter
  def initialize(pattern)
    @pattern = pattern
  end

  def keep?(line)
    line.include? @pattern
  end
end

class GrepFacade
  def initialize(config: ArgumentParser.new, filter: Filter.new(config.pattern))
    @config = config
    @filter = filter
  end

  def scan_files
    @config.paths.each do |path|
      File.open(path).readlines.select { |line| puts line if @filter.keep?(line) }
    end
  end
end

GrepFacade.new.scan_files
