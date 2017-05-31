class Button; end
class OsxButton < Button; end
class WindowsButton < Button; end

class Gui
  attr_accessor :controls
  def initialize(os_type)
    self.controls = []
    if os_type == :osx
      controls << OsxButton.new
    else
      controls << WindowsButton.new
    end
  end
end

gui = Gui.new(:osx)
