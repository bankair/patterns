class Button; end
class OsxButton < Button; end
class WindowsButton < Button; end

class ButtonFactory
  def self.get_button(os_type)
    if os_type == :osx
      controls << OsxButton.new
    else
      controls << WindowsButton.new
    end
  end
end

class Gui
  attr_accessor :controls
  def initialize(button)
    self.controls = [button]
  end
end

gui = Gui.new(ButtonFactory.get_button(:osx))
