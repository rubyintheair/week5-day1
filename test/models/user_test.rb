require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have a name" do 
    a = User.new
    a.name = "Adam"
    assert a.name == "Adam"
  end

  test "should have a name - another way" do 
    a = User.new name: "Quy"
    assert a.name == "Quy"
  end

  test "should have a name - assert_equal way" do 
    a = User.new name: "Quy"
    assert_equal "Quy", a.name
  end

  test "should have email" do 
    a = User.new email: "a@gmail.com"
    assert_equal "a@gmail.com", a.email
  end

  test "should have name" do 
    a = User.new email: "ab@gmail"
    assert_equal nil, a.name
  end

  test "should have password" do 
    a = User.new password: "quynguyen"
    assert_equal "quynguyen", a.password
  end

  test "should not store plain password to database" do 
    User.create! email: "abc@mail", password: "quynguyen"
    a = User.last
    assert_equal "abc@mail", a.email 
    assert_equal nil, a.password
  end

  test "should not store plain password to db - case 2" do 
    User.create! email: "a@gmail", password: "love"
    a = User.last
    assert_nil a.password
  end 

  test "#authenticate should work" do 
    a = User.create! email: "a@gmail", password: "12345"
    
    assert_equal false, a.authenticate("wrong")
    assert_equal a, a.authenticate(12345)
    assert_equal a, a.authenticate("12345")
    assert_equal false, a.authenticate(nil)
    assert_equal false, a.authenticate("")
    assert_equal false, a.authenticate(User.last)
  end
  

end
