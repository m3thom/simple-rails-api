class BridgeapiWebhooksController < ApplicationController
  skip_before_action :authenticate_user!

  # @example POST /bridgeapi_webhooks
  # @note This POST method will be called from Bridgeapi.
  # For more information https://docs.bridgeapi.io/docs/webhooks-events
  #
  def create
    if is_request_valid?
      # Process to create only if the request is valid request from the Bridgeapi.
      # TO IMPLEMENT: Create a row in DB with Sidekiq.
      p 'Yes! valid, lets create!'
    end
    # No matter what, we must return status 200 to the Bridgeapi.
    render json: {}, status: :ok
  end

  private

  # This method implement based on https://docs.bridgeapi.io/docs/secure-your-webhooks#2-use-the-provided-secret-to-check-the-signatures
  #
  def is_request_valid?
    begin
      # BridgeApi-Signature: v1=E5637CDB3A54ECA10DDA9D515E588B6BECDABA414537FFC488B63474081B90DF,v1=82918263E23D1A67DD5B47E190AB62EAF9DDBB9920F48569120ED67E95286CF4
      signature_header = request.headers['BridgeApi-Signature']
      return false if signature_header.blank?

      # We could have up to 2 signatures and the latest is the first one.
      signature_data = signature_header.split(',').first
      # 'v1=E5637CDB3A54ECA10DDA9D515E588B6BECDABA414537FFC488B63474081B90DF'

      signature = signature_data.split('=').last
      # 'E5637CDB3A54ECA10DDA9D515E588B6BECDABA414537FFC488B63474081B90DF'

      secret = ENV['BRIDGE_WEBHOOKS_SECRET']

      data = bridgeapi_webhook_params.to_json

      result = OpenSSL::HMAC.hexdigest("SHA256", secret, data)

      signature == result.upcase
    rescue
      false
    end
  end

  def bridgeapi_webhook_params
    params.fetch(:bridgeapi_webhook)
  end
end
