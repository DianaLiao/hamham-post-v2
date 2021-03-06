class Message < ApplicationRecord
  belongs_to  :board
  belongs_to  :user

  # has_many  :views, source: :seen_message
  # has_many  :viewers, through: :seen_messages, source: :user

  def readable_date_time
    self.created_at.localtime.strftime("%m/%d/%Y at %I:%M%p")
  end

end
