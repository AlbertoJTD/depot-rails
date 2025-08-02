# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  image_url   :string
#  price       :decimal(8, 2)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  has_many :line_items
  has_many :order, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item
  #Valitating fields
  validates :title, :description, :image_url, :price, presence: true

  #Validates that price is greater than or equal to 0.01
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  #Validates that the title is unique
  validates :title, uniqueness: true
  validates :title, length: { minimum: 10 }

  #Validates the URL for images
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png|jpeg)\z}i,
      message: 'Must be a URL for GIF, JPG, JPEG or PNG image.'
  }

  private

  #Ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
