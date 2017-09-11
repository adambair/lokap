# http://guides.rubyonrails.org/configuring.html#custom-configuration

# config/payment.yml:
production:
  environment: production
  merchant_id: production_merchant_id
  public_key:  production_public_key
  private_key: production_private_key
development:
  environment: sandbox
  merchant_id: development_merchant_id
  public_key:  development_public_key
  private_key: development_private_key
 
# config/application.rb
module MyApp
  class Application < Rails::Application
    config.payment = config_for(:payment)
  end
end

Rails.application.config.payment

UnfriendlyId::Openbay.encode
UnfriendlyId::Openbay.encode

UnfriendlyId.config[:openbay]

UnfriendlyId.encode
# => [:openbay_id, :confirmation_code]

UnfriendlyId::OpenbayId.encode
UnfriendlyId::ConfirmationCode.encode

UnfriendlyId.openbay_id.encode(12345)
UnfriendlyId.confirmation_code.encode(12345)


Rails.configuration.unfriendly_id.encoders[:openbay_id]

Rails.configuration.unfriendly_id['merchant_id'] # => production_merchant_id or development_merchant_id

Rails.configuration.payment['merchant_id'] # => production_merchant_id or development_merchant_id
