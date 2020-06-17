# data object, does not carry logic
class Customer
  def initialize(user_id:, name:, position: )
    @user_id = user_id
    @name = name
    @position = position
  end

  attr_reader :user_id, :name, :position
end