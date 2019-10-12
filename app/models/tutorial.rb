# frozen_string_literal: true

class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

  validates_presence_of :title, :description
  validates :thumbnail, format: { with: /\.(png|jpg)\Z/i }
end
