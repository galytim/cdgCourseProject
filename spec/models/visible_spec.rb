require 'rails_helper'

RSpec.describe Visible do
  class TestClass
    include Visible
    attr_accessor :user
    def initialize(user)
      @user = user
    end
  end

  describe "#author?" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:test_object) { TestClass.new(user) }

    context "when the current user is the author" do
      it "returns true" do
        expect(test_object.author?(user)).to be true
      end
    end

    context "when the current user is not the author" do
      it "returns false" do
        expect(test_object.author?(other_user)).to be false
      end
    end
  end
end