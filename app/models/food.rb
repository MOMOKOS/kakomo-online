class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :drink
  belongs_to :scene
  belongs_to :allergy
  belongs_to :day

  with_options presence: true do
    validates :image, :name, :description
    validates :price, numericality: { with: /\d[0-9]/, message: 'Half-width number' }
  end

  validates :price,
            numericality: { greater_than_or_equal_to: 1000, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :genre_id, :drink_id, :scene_id, :allergy_id, :day_id
  end
end
