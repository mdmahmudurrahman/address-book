class Dashboard::ContactAddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @contact_addresses = current_user.contact_addresses
    @address_count = @contact_addresses.count
    @contact_address = ContactAddress.new
  end

  def create
    @contact_address = current_user.contact_addresses.new contact_address_params

    if @contact_address.save
      flash["success"] = "Address saved successfully"
    else
      flash["warning"] = @contact_address.errors.full_messages.take(2).join(" ,")
    end

    redirect_to dashboard_contact_addresses_path
  end

  private

  def contact_address_params
    params.require(:contact_address).permit :title, :street, :street_no, :city, 
      :state, :zip_code, :country
  end
end
