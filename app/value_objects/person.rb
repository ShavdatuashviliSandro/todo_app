class Person
  attr_reader :email ,:first_name, :last_name, :dob

  def initialize(email:,first_name:, last_name:, dob:)
    @email = email
    @first_name = first_name
    @last_name = last_name
    @dob = dob
  end
end