require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#factories' do
    it 'should have a valid factory' do
      user = build :user
      expect(user).to be_valid
    end
  end

  describe '#validations' do
    it 'should validate presence of email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it 'should validate case insensitive uniqueness of email' do
      user = create(:user)
      duplicate_user = build(:user, email: user.email.upcase)
      expect(user).to be_valid
      expect(duplicate_user).not_to be_valid
    end

    it 'should validate minimum length of email' do
      user = build(:user, email: 'abc')
      expect(user).not_to be_valid
      expect(user.errors.messages[:email]).to include("is too short (minimum is 4 characters)")
    end

    it 'should validate maxiumm length of email' do
      user = build(:user, email: 'x'*300)
      expect(user).not_to be_valid
      expect(user.errors.messages[:email]).to include("is too long (maximum is 254 characters)")
    end
  end
end
