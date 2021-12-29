# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "example@user.ru")
  end

  # метод assert, будет успешным при возвращении true от @user.valid?, и провальным при возвращении false.
  test "should be valid" do
    assert @user.valid?
  end
end
