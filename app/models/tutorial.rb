class Tutorial < ApplicationRecord
  validates :title, presence: true, length: {minimum: 1}
  has_many :videos, ->  { order(position: :ASC) }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos
end
