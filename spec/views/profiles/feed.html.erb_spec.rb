require 'rails_helper'

RSpec.describe 'profiles/feed', type: :view do
    let(:user) { create(:user) }
    let(:posts){ create_list(:post, 5)} 
    let(:post) {create(:post)}
  before { sign_in user}
  it 'renders posts in reverse order' do
    
    assign(:posts, posts) 

    render 

    reversed_posts = posts.reverse 

    reversed_posts.each do |post|
      expect(rendered).to have_rendered("posts/_post").with_options(post: post)
    end
  end
end