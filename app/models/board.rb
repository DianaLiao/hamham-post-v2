class Board < ApplicationRecord
  has_many  :messages
  has_many  :posters, through: :messages, source: :user

  has_many  :memberships, dependent: :destroy
  has_many  :members, through: :memberships, source: :user


end
