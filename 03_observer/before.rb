User = Struct.new(:firstname, :lastname) do
  def fullname
    "#{firstname} #{lastname}"
  end
end

class TextField
  def initialize(user)
    @user = user
    display
  end

  private

  def display
    puts @user.fullname
  end
end

alice = User.new('Alice', 'Dupond')

textfield = TextField.new(alice)

# Show "Alice Dupond"

alice.lastname = 'Leclerc'

