require "spec_helper"
require_relative "../lib/adyen/errors"

# rubocop:disable Metrics/BlockLength

RSpec.describe Adyen::Payments, service: "payments service" do
  before(:all) do
    @shared_values = {
      client: nil,
      ws_user: "username",
      ws_password: "password",
      service: "Payment",
      version: 32
    }
  end

  # client instance to be used in dynamically generated tests
  client = create_client(:basic)

  # methods / values to test for
  # format is defined in spec_helper
  test_sets = [
    ["authorise", "resultCode", "Authorised"],
    ["adjust_authorisation", "response", "[adjustAuthorisation-received]"],
    ["authorise3d", "resultCode", "Authorised"],
    ["cancel", "response", "[cancel-received]"],
    ["cancel_or_refund", "response", "[cancelOrRefund-received]"],
    ["capture", "response", "[capture-received]"],
    ["refund", "response", "[refund-received]"]
  ]

  generate_tests(client, "Payment", test_sets, client.payments)
end

# rubocop:enable Metrics/BlockLength
