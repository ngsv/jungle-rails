require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is invalid without a password field' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "gl.steven.ngov@gmail.com", :password => nil, :password_confirmation => "123")
      expect(@user).to be_invalid
    end

    it 'is invalid without a password_confirmation field' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "gl.steven.ngov@gmail.com", :password => "123", :password_confirmation => nil)
      expect(@user).to be_invalid
    end

    it 'is invalid if password and password_confirmation does not match' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "gl.steven.ngov@gmail.com", :password => "123", :password_confirmation => "abc")
      expect(@user).to be_invalid
    end

    it 'is invalid without a first_name field' do
      @user = User.new(:first_name => nil, :last_name => "Ngov", :email => "gl.steven.ngov@gmail.com", :password => "123", :password_confirmation => "123")
      expect(@user).to be_invalid
    end

    it 'is invalid without a last_name field' do
      @user = User.new(:first_name => "Steven", :last_name => nil, :email => "gl.steven.ngov@gmail.com", :password => "123", :password_confirmation => "123")
      expect(@user).to be_invalid
    end

    it 'is invalid without an email field' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => nil, :password => "123", :password_confirmation => "123")
      expect(@user).to be_invalid
    end

    it 'is invalid if email is not unique' do
      @existing_user = User.new(:first_name => "Bob", :last_name => "Marley", :email => "test@test.COM", :password => "123", :password_confirmation => "123")
      @existing_user.save
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "TEST@TEST.com", :password => "123", :password_confirmation => "123")
      expect(@user).to be_invalid
    end

  end
end
