class Button; end
class OsxButton < Button; end
class WindowsButton < Button; end

class ButtonFactory
  def self.get_button
    raise 'Not implemented'
  end

  def self.get_factory(os_type)
    if os_type == :osx
      OsxButtonFactory
    else
      WindowsButtonFactory
    end
zsh:1: command not found: q
end

class OsxButtonFactory < ButtonFactory
  def self.get_button
    OsxButton.new
  end
end

class WindowsButtonFactory < ButtonFactory
  def self.get_button
    WindowsButton.new
  end
end

class Gui
  attr_accessor :controls
  def initialize(button)
    self.controls = [button]
  end
end

factory = ButtonFactory.get_factory(:osx)
gui = Gui.new(factory.get_button)
