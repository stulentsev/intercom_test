# {"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"}
class Customer
  def initialize(user_id:, name:, position: )
    @user_id = user_id
    @name = name
    @position = position
  end

  attr_reader :user_id, :name, :position
end