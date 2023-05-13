require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  before do
    assign(:post, Post.new) 
    render
  end
  
  it 'renders the post form' do
    expect(rendered).to render_template(partial: '_form')
  end
 
end
