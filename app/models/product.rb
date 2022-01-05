class Product < ApplicationRecord
    #Valitating fields
    validates :title, :description, :image_url, :price, presence: true

    #Validates that price is greater than or equal to 0.01
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }

    #Validates that the title is unique
    validates :title, uniqueness: true

    #Validates the URL for images
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png|jpeg)\z}i,
        message: 'Must be a URL for GIF, JPG, JPEG or PNG image.'
    }
end
