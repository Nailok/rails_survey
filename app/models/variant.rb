class Variant < ApplicationRecord
  belongs_to :question
  has_many :answers
  validates :title, presence: true
end
