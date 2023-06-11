# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id', default: -> { Current.user }
  has_many :group_users
  has_many :users, through: :group_users

  scope :for_user, lambda { |user|
    left_joins(:group_users)
      .where(owner: user)
      .or(where(group_users: { user: }))
      .distinct
      .order(:name)
  }
end
