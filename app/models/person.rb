class Person < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_one :detail, dependent: :destroy
end
