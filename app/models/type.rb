class Type < ApplicationRecord
  has_many :contacts, dependent: :destroy
end
