require "rails_helper"

RSpec.describe Dashboard::ContactAddressesController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status :success
      expect(response).to render_template :index
    end

    let!(:user_address){FactoryBot.create :contact_address, user: @user}

    it "returns all of the user address" do
      get :index
      expect(assigns(:contact_addresses)).to eq(@user.contact_addresses)
      expect(assigns(:address_count)).to eq(1)
      expect(assigns(:address_count)).not_to eq(0)
    end
  end

  describe "POST #create" do
    let(:contact_address_params) do
      {
        title: "Address 2",
        country: "Germany",
        city: "Berlin",
        state: "Berlin",
        street: "Welserstraße",
        street_no: "10",
        zip_code: "10777"
      }
    end

    let(:invalid_params) do
      {
        title: "Address 2"
      }
    end

    it "create success" do
      post :create, params: {contact_address: contact_address_params}
      expect(flash[:success]).to eq "Address saved successfully"
      expect(response).to redirect_to action: :index
    end

    it "create failed" do
      post :create, params: {contact_address: invalid_params}
      expect(flash[:warning]).to be_present
      expect(response).to redirect_to action: :index
    end
  end
end
