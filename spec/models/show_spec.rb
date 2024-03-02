require 'rails_helper'

RSpec.describe Show, type: :model do

  describe 'validations' do
    it 'validate require fields' do
      should validate_presence_of(:image)
      should validate_presence_of(:rating)
      should validate_presence_of(:title)
    end

    it 'validate relation with Characters' do
      should have_and_belong_to_many(:characters)
    end
  end

end
