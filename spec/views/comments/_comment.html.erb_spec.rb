require 'rails_helper'

RSpec.describe 'comments/_comment', type: :view do
  let(:current_user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { create(:comment, post: post) }

  before do
    sign_in current_user
    render partial: 'comments/comment', locals: { comment: comment }
  end

  context 'when the comment is authored by the current user' do
    let(:comment) { create(:comment, post: post, user: current_user) }

    it 'renders the comment with a destroy link' do
      expect(rendered).to have_selector('b', text: current_user.username)
      expect(rendered).to have_content(comment.body)
      expect(rendered).to have_link('Destroy', href: post_comment_path(post, comment))
    end
  end

  context 'when the comment is not authored by the current user' do
    let(:comment_author) { create(:user) }
    let(:comment) { create(:comment, post: post, user: comment_author) }

    it 'renders the comment without a destroy link' do
      expect(rendered).to have_selector('b', text: comment_author.username)
      expect(rendered).to have_content(comment.body)
      expect(rendered).not_to have_link('Destroy')
    end
  end
end
