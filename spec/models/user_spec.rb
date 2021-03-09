require 'rails_helper'

RSpec.describe User, type: :model do
  describe('Validations') do
    it('should have valid password and password confirmation field') do
      @user = User.create(
        :name => 'Frog',
        :email => 'FrogsAreCoole@gmail.com',
        :password => 'HelloWorld',
        :password_confirmation => 'HelloWorld'
      )
      expect(@user).to be_valid
    end
    it('should error w/o password') do
      @user = User.create(
        :name => 'Frog',
        :email => 'FrogsAreCoole@gmail.com',
        :password => nil,
        :password_confirmation => 'HelloWorld'
      )
      expect(@user).to_not be_valid
    end
    it('should error w/o password_confirmation') do
      @user = User.create(
        :name => 'Frog',
        :email => 'FrogsAreCoole@gmail.com',
        :password => 'HelloWorld',
        :password_confirmation => nil
      )
      expect(@user).to_not be_valid
    end

    it('should have passwords that match') do
      @user = User.create(
        :name => 'Frog',
        :email => 'FrogsAreCoole@gmail.com',
        :password => 'HelloWorld',
        :password_confirmation => 'notHelloWorld'
      )
      expect(@user).to_not be_valid
    end

    it('should have unique email') do
      @user = User.create(
        :name => 'Frog',
        :email => 'FrogsAreCoole@gmail.com',
        :password => 'HelloWorld',
        :password_confirmation => 'HelloWorld'
      )
      @user2 = User.create(
        :name => 'Frog2',
        :email => 'FrogsAreCoole@gmail.com',
        :password => 'HelloWorld2',
        :password_confirmation => 'HelloWorld2'
      )
      expect(@user2).to_not be_valid
    end
    it('should not be valid w/o email') do
      @user = User.create(
        :name => 'Frog',
        :email => nil,
        :password => 'HelloWorld',
        :password_confirmation => 'HelloWorld'
      )
      expect(@user).to_not be_valid
    end
    it('should not be valid w/o name') do
      @user = User.create(
        :name => nil,
        :email => 'FrogsAreCoole@gmail.com',
        :password => 'HelloWorld',
        :password_confirmation => 'HelloWorld'
      )
      expect(@user).to_not be_valid
    end
    it('password should have minimum length of 8') do
      @user = User.create(
        :name => 'Frog',
        :email => 'FrogsAreCoole@gmail.com',
        :password => 'H',
        :password_confirmation => 'H'
      )
      expect(@user).to_not be_valid
    end
  end
end
