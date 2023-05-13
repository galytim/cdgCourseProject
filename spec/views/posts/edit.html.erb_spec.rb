require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do
  let(:post) {create(:post)}
  before do
    assign(:post, post) 
    render
  end

  it 'renders the post form' do
    expect(rendered).to render_template(partial: '_form')
  end
 
end
