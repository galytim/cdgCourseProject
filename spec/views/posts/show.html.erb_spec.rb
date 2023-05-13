require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let!(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  before{ sign_in user}



  context 'when the viewer is the author' do
    it 'displays edit and delete links' do
      assign(:post, post)
      render
      expect(rendered).to have_link('Edit', href: edit_post_path(post))
      expect(rendered).to have_link('Destroy', href: post_path(post))
    end
  end

  context 'when the viewer is not the author' do
  

    it 'does not display edit and delete links' do
      sign_in other_user
      assign(:post, post)
      render
      expect(rendered).not_to have_link('Edit')
      expect(rendered).not_to have_link('Destroy')
    end
  end


  context 'when the post has comments' do
    
      let(:comment) { create(:comment, post: post) }
      


    it 'displays comments' do
      assign(:post, post)
      assign(:comments, [comment])
      render

      expect(rendered).to have_content('Comments:')
      expect(rendered).to render_template(partial: 'comments/_comment', count: 1)
    end
  end

  context 'when the post has no comments' do
    it 'displays no comments message' do
      assign(:post, post)
      assign(:comments, [])
      render
      
      expect(rendered).not_to render_template(partial: 'comments/_comment')
    end
  end

end
