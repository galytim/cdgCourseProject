
require 'rails_helper'

RSpec.describe 'profiles/index', type: :view do
  let(:users) { create_list(:user, 5) } 

  it 'displays links to user profiles' do
    assign(:users, users) 

    render 
    users.each do |user|
      expect(rendered).to have_link(user.email, href: profile_path(user))
    end
  end
end
