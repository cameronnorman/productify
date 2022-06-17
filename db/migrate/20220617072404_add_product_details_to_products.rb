# frozen_string_literal: true

class AddProductDetailsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_details, :json
  end
end
