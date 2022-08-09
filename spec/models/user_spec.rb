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


  describe '.authenticate_with_credentials' do

    it 'successfully authenticates with valid credentials' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "gl.steven.ngov@gmail.com", :password => "12345", :password_confirmation => "12345")
      @user.save
      @auth = User.authenticate_with_credentials("gl.steven.ngov@gmail.com", "12345")
      expect(@auth).to eq(@user)
    end

    it 'does not authenticate if email is not found in the database' do
      @auth = User.authenticate_with_credentials("gl.steven.ngov@gmail.com", "12345")
      expect(@auth).to be_nil
    end

    it 'does not authenticate if password is incorrect' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "gl.steven.ngov@gmail.com", :password => "12345", :password_confirmation => "12345")
      @user.save
      @auth = User.authenticate_with_credentials("gl.steven.ngov@gmail.com", "abcde")
      expect(@auth).to be_nil
    end

    it 'successfully authenticates with leading and trailing spaces in the email field' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "example@domain.com", :password => "12345", :password_confirmation => "12345")
      @user.save
      @auth = User.authenticate_with_credentials(" example@domain.com ", "12345")
      expect(@auth).to eq(@user)
    end

    it 'successfully authenticates for both uppercase and lowercase characters in the email field' do
      @user = User.new(:first_name => "Steven", :last_name => "Ngov", :email => "eXample@domain.COM", :password => "12345", :password_confirmation => "12345")
      @user.save
      @auth = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "12345")
      expect(@auth).to eq(@user)
    end

  end
end
