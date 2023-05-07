require "rails_helper"

RSpec.describe PostsController, type: :controller do
    let(:user) {create :user}
    
    before { sign_in user }

    describe "#show" do
        subject { process :show, params: params }
        let!(:post) {create :post, user: user}
        let(:params) {{ id: post.id }}

        it "assigns @post" do
            subject
            expect(assigns(:post)).to eq(post)
        end
        it "renders the :new template" do
            subject
            expect(response).to render_template :show
        end
    end

    describe "#create" do

        
        context "with valid parametrs" do
            subject { process :create, method: :post, params: params }
            let(:params)  {{ post: attributes_for(:post)}}

            it "creates a post" do
                expect{ subject }.to change(Post, :count).by(1)
            end

            it "redirects to post page" do
                subject
                expect(response).to redirect_to post_path(Post.last)
            end

            it  "asssigns post to current user" do
                subject
                expect(assigns(:post).user).to eq user
            end
        end
        context "with invalid parametrs" do
            subject { process :create, method: :post, params: params }
            let(:params)  {{ post: { image: "" }}}
            it "doesn`t create the post" do
                expect { subject }.to not_change(Post, :count)
            end
            it "renders :new template" do
                subject
                expect(response).to render_template :new
            end
        end
        
    end

    describe "#new" do
        subject { process :new}
        it "assigns @post" do
            subject
            expect(assigns(:post)).to be_a_new Post
        end
        it "renders the :new template" do
            subject
            expect(response).to render_template :new
        end
    end

    describe "#destroy" do
        subject { process :destroy, method: :delete, params: params }
        let!(:post) {create :post, user: user}
        let(:params) {{ id: post.id }}
        context "when post belongs to the user" do
            it "deletes the post" do
              expect { subject }.to change(Post, :count).by(-1)
            end
        
            it "redirects to the feed page" do
                subject
              expect(response).to redirect_to(feed_path)
            end
          end

        context "when post doesn't belong to the user" do
            let(:other_user) { create(:user) }
            before { sign_in other_user }
        
            it "doesn't delete the post" do
                expect { subject }.to raise_exception(ActiveRecord::RecordNotFound).and not_change(Post, :count)
            end
        end
    end


    describe "#edit" do
        subject { process :edit, params: params }
        let!(:post) {create :post, user: user}
        let(:params) {{ id: post.id }}

        it "assigns @post" do
            subject
            expect(assigns(:post)).to eq(post)
        end
        it "renders the :new template" do
            subject
            expect(response).to render_template :edit
        end
    end

    describe "#update" do
        let(:post) { create(:post, user: user) }
        
        context "with invalid parameters" do
            subject {process :update, method: :patch, params: params}
            let!(:params) {{ id: post.id, post: { body: ""}}}

            it "doesn`t update the post" do
                expect { subject }.not_to(change { post.reload.body })
            end

            it "renders the :edit template" do
                subject
                expect(response).to render_template :edit
            end
        end

        context "with valid parameters" do
            subject {process :update, params: params}
            
            let(:params)  {{ id: post.id, post: { body: "New body" }}}
            it "updates the post" do
                expect { subject }.to change { post.reload.body }.to("New body")
            end
            it "redirects to post page" do
                subject
                expect(response).to redirect_to post_path(post)
            end    
            end    
          

        

        context "when user try update not own post" do
            subject {process :update, params: params}
            let(:params)  {{ id: post.id, post: { body: "New body" }}}
            let(:other_user) { create(:user) }
            
            before { sign_in other_user }
            
            it "raises ActiveRecord::RecordNotFound" do
                expect { process :edit, params: { id: post.id } }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
end
