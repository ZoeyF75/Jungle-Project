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

  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.new(
        :name => 'Frog',
        :email => 'frogs@gmail.com',
        :password => 'password',
        :password_confirmation => 'password'
      )
      @user.save
    end

    it 'should log a user in with valid credentials' do
      user = User.authenticate_with_credentials('Frogs@gmail.com', 'password')
      expect(user).to eq(@user)
    end

    it 'should not log user in with invalid credentials' do
      user = User.authenticate_with_credentials('Frogs@gmail.com', 'not')
      expect(user).not_to eq(@user)
    end

    it 'should accept an email address with white space before and/or after' do
      user = User.authenticate_with_credentials('  Frogs@gmail.com  ', 'password')
      expect(user).to eq(@user)
    end

    it 'should accept an email address regardless of case' do
      user = User.authenticate_with_credentials('FROGS@GMAIL.com', 'password')
      expect(user).to eq(@user)
    end

  end
end
