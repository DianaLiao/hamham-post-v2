class Membership < ApplicationRecord
  belongs_to  :board
  belongs_to  :user

  # validates :user_id, uniqueness: {scope: :group_id, message: "can only join group once"}
end
