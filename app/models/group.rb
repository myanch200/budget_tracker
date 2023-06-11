class Group < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :group_users
  has_many :users, through: :group_users
end
