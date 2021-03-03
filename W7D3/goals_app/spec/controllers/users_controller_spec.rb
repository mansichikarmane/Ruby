require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_params) {{user: {username: 'lilly_llama', password: 'password'}}}
  let(:invalid_params) {{user: {username: 'bob', password: ''}}}
  let(:user) { User.find_by(username: 'lilly_llama')}
  describe "POST #create" do
    context "with valid params" do
      before :each do
        post :create, params: valid_params
      end
      it "creates user" do
        expect(User.last.username).to eq("lilly_llama")
      end
      it "logs in user" do
        expect(session[:session_token]).to eq(user.session_token)
      end
      it "redirects to user's show page" do
        expect(response).to redirect_to(users_url)
      end

    end

    context "with invalid params" do
      before :each do
        post :create, params: invalid_params
      end
        it "renders the new template" do
          expect(response).to render_template(:new)
        end
        # it "adds errors to flash" do
        #   expect(flash[:errors]).to be_present
        # end
    end 
  end

  describe " GET #new" do
    it "renders the new user template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  
end