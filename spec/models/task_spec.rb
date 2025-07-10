require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
