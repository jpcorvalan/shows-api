require 'rails_helper'

RSpec.describe Character, type: :model do

  describe 'validations' do
    it 'validate require fields' do
      should validate_presence_of(:age)
      should validate_presence_of(:history)
      should validate_presence_of(:image)
      should validate_presence_of(:name)
      should validate_presence_of(:weight)
    end

    it 'validate relation with Shows' do
      should have_and_belong_to_many(:shows)
    end
  end

end
