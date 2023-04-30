require 'rails_helper'

RSpec.describe Post, type: :model do
  
  subject { build(:post) }
  context 'associations' do
    it 'is not invalid' do
      is_expected.to be_valid   
    end
  end
end