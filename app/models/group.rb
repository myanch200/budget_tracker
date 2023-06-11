class Group < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id", default: -> { Current.user }
  has_many :group_users
  has_many :users, through: :group_users

  scope :for_user, ->(user) do
    left_joins(:group_users)
      .where(owner: user)
      .or(where(group_users: { user: user }))
      .distinct
      .order(:name)
  end
end
