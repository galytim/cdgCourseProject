require 'rails_helper'

RSpec.describe 'posts/_form', type: :view do
  let(:post) { Post.new }

  before do
    render partial: 'posts/form', locals: { post: post }
  end

  it 'renders the post form' do
    expect(rendered).to have_selector('form')
    expect(rendered).to have_field('post_body') 
    expect(rendered).to have_field('post_image', type: 'file')

    expect(rendered).to have_selector('input[type="submit"]')
  end
end