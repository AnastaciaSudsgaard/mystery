class Message < ApplicationRecord
  belongs_to :login_user
  belongs_to :room
end
