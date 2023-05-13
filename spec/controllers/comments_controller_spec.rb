require "rails_helper"
RSpec.describe CommentsController, type: :controller do

    before{sign_in user}
    let!(:user) { create(:user) }

    describe "#create" do
      
      let!(:post) { create(:post, user: user) }
  
      context "with valid params" do
        subject { process :create, method: :post, params: params}

        let(:params) {{ comment: attributes_for(:comment, post_id: post.id), post_id: post.id } }
        
  
        it "creates a new comment" do
            expect {subject}.to change(Comment, :count).by(1)
        end
  
        it "assigns the comment to the correct post" do
            subject
            expect(assigns(:comment).post).to eq(post)
        end
  
        it "assigns the comment to the current user" do
            subject
            expect(assigns(:comment).user).to eq(user)
        end
  
        it "redirects to the post page" do
            subject
            expect(response).to redirect_to(post_path(post))
        end
      end
  
      context "with invalid params" do
        subject { process :create, method: :post, params: params}
        

        let(:params) {{ comment: attributes_for(:comment, body: nil), post_id: post.id } }
        
  
        it "does not create a new comment" do
            expect {subject}.to_not change(Comment, :count)
        end
  
        it "assigns an error message to flash" do
            subject
            expect(flash[:notice]).to eq("you can't create comments without text")
        end
  
        it "renders the post page" do
            subject
            expect(response).to redirect_to(post_path(post))
        end
      end
    end

  
  end
  