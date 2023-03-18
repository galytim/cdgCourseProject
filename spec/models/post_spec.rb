require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new() }
  it "description" do
    expect(subject).to be_valid 
  end
   
end
