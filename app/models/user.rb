class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :memberships, dependent: :destroy
  has_many  :boards, through: :memberships

  has_many  :messages

  has_many  :seen_messages


  def full_name
    "#{first_name} #{last_name}"
  end


 end
