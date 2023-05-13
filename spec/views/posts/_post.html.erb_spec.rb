require 'rails_helper'

RSpec.describe 'posts/_post', type: :view do
  let(:user) { create(:user) }
  let(:post){create(:post, user: create(:user))}
  before {sign_in user}

  it 'displays post information' do
    
    assign(:post, post)

    render partial: 'posts/post', locals: { post: post }

    expect(rendered).to have_link(post.user.username, href: profile_path(post.user))
    expect(rendered).to have_css("img[src*='#{post.image_url}']")
    expect(rendered).to have_content('like')
    expect(rendered).to have_content("likes: #{post.liked_users.count}")
    expect(rendered).to have_content(post.body)
    expect(rendered).to have_link("all comments (#{post.comments.count})", href: post_path(post))
    expect(rendered).to have_content(post.created_at)
  end
end
