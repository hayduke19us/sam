class Journey < ActiveRecord::Base
  belongs_to :user

  validates :name, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :name }

end
