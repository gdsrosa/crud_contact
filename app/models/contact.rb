class Contact < ApplicationRecord
  belongs_to :type
  has_one :address
  accepts_nested_attributes_for :address
end
