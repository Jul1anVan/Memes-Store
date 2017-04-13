class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:customer).permit(:province_id, :first_name,
                                     :last_name, :address, :city, :postal_code,
                                     :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:customer).permit(:province_id, :first_name,
                                     :last_name, :address, :city, :postal_code,
                                     :email, :password,
                                     :password_confirmation, :current_password)
  end
end
