class User < ApplicationRecord
  has_secure_password
  include SimpleCaptcha::ModelHelpers
  apply_simple_captcha

end
