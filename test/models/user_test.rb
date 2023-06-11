require "test_helper"

class UserTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper
  # test "the truth" do
  #   assert true
  # end

  test 'should send email after user creation' do
    user = User.new(email: 'myemail@gmail.com', password: 'password')

    assert_emails 1 do
      user.save
    end
  end
end
