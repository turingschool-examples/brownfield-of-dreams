class Tutorial < ApplicationRecord
  has_many :videos, ->  { order(position: :ASC) }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

  def self.class_content
    where(classroom: true)
  end

  def self.non_class_content
    where(classroom: false)
  end
end
