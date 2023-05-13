require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  it 'routes root to profiles#feed' do
    expect(get: '/').to route_to(controller: 'profiles', action: 'feed')
  end



  it 'routes /profiles to profiles#index' do
    expect(get: '/profiles').to route_to('profiles#index')
  end

  it 'routes /profiles/:id to profiles#show' do
    expect(get: '/profiles/1').to route_to('profiles#show', id: '1')
  end



  it 'routes /feed to profiles#feed' do
    expect(get: '/feed').to route_to('profiles#feed')
  end




  it 'routes /follow/:id to follows#follow' do
    expect(post: '/follow/1').to route_to('follows#follow', id: '1')
  end



  it 'routes /like/:id to likes#like' do
    expect(post: '/like/1').to route_to('likes#like', id: '1')
  end



  it 'routes /posts/new to posts#new' do
    expect(get: '/posts/new').to route_to('posts#new')
  end

  it 'routes /posts to posts#create' do
    expect(post: '/posts').to route_to('posts#create')
  end

  it 'routes /posts/:id to posts#show' do
    expect(get: '/posts/1').to route_to('posts#show', id: '1')
  end

  it 'routes /posts/:id/edit to posts#edit' do
    expect(get: '/posts/1/edit').to route_to('posts#edit', id: '1')
  end

  it 'routes /posts/:id to posts#update' do
    expect(patch: '/posts/1').to route_to('posts#update', id: '1')
  end

  it 'routes /posts/:id to posts#destroy' do
    expect(delete: '/posts/1').to route_to('posts#destroy', id: '1')
  end



  it 'routes /posts/:post_id/comments to comments#create' do
    expect(post: '/posts/1/comments').to route_to('comments#create', post_id: '1')
  end

  it 'routes /posts/:post_id/comments/:id to comments#destroy' do
    expect(delete: '/posts/1/comments/2').to route_to('comments#destroy', post_id: '1', id: '2')
  end
end
