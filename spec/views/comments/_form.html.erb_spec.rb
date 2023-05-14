require 'rails_helper'

RSpec.describe 'comments/_form', type: :view do
  let(:post) { create(:post) }
  let(:comment) { build(:comment) }

  before do
    assign(:post, post)
    assign(:comment, comment)
    render partial: 'comments/form', locals: { post: post, comment: comment }
  end
  
  it 'renders the post form' do
    expect(rendered).to have_selector('form')
    expect(rendered).to have_field('comment_body') 

    expect(rendered).to have_selector('input[type="submit"]')
  end
end