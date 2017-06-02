require 'set'

class User
  attr_reader :firstname, :lastname

  def initialize(firstname, lastname)
    self.firstname = firstname
    self.lastname = lastname
  end

  def firstname=(value)
    @firstname = value
    notify_all
  end

  def lastname=(value)
    @lastname = value
    notify_all
  end

  def fullname
    "#{firstname} #{lastname}"
  end

  def add_observer(observer)
    observers << observer
    observer.notify(self)
  end

  private

  def observers
    @observers ||= Set.new
  end

  def notify_all
    observers.each { |observer| observer.notify(self) }
  end
end

class TextField
  def initialize(user)
    user.add_observer(self)
  end

  def notify(user)
    display(user)
  end

  private

  def display(user)
    puts user.fullname
  end
end

alice = User.new('Alice', 'Dupond')

textfield = TextField.new(alice)

# Show "Alice Dupond"

alice.lastname = 'Leclerc'

# Here, TextField should display 'Alice Leclerc' on his own
