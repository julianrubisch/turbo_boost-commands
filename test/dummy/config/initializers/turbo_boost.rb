# frozen_string_literal: true

# NOTE: this line is only required by the test/dummy app, regular apps will not need this
require "turbo_boost/streams"

# Configuration can be accessed multiple ways.
# All options return the same configuration object.
#
# - TurboBoost::Commands.config
# - Rails.application.config.turbo_boost_commands
#
# Options:
# - apply_client_state_overrides, opt-(in/out) of client state overrides (false)
# - apply_server_state_overrides, opt-(in/out) of server state overrides (false)
# - max_cookie_size, Max size for the state management cookie in bytes (ActionDispatch::Cookies::MAX_COOKIE_SIZE / 3)
# - validate_client_token, opt-(in/out) of client token validation (false)
#
TurboBoost::Commands.config.tap do |config|
  config.apply_client_state_overrides = false
  config.apply_server_state_overrides = false

  # NOTE: We're being extra cautious with cookie size by targeting a max of 4 kilobytes for ALL cookies across the domain.
  # SEE: http://browsercookielimits.iain.guru/
  # SEE: https://stackoverflow.com/questions/52203972/maximum-cookie-size-of-current-browsers-year-2018
  config.max_cookie_size = 1.kilobyte

  config.validate_client_token = false
end
