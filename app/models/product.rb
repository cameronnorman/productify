# frozen_string_literal: true

class Product < ApplicationRecord
  validates :product_details, length: { minimum: 1 }
end
