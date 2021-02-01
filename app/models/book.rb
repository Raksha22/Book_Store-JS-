class Book < ApplicationRecord
  has_many :taggings, dependent: :destroy
  accepts_nested_attributes_for :taggings

end
