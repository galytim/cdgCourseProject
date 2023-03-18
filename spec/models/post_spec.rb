RSpec.describe "Post" do
    subject {Post.new(body: "fsdf",status:"public", image_data:"{}")}
    it "is_not_valid" do 
        is_expected.to invalid
    end
end
