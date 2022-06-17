# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductsController do
      describe '#assign_product_details' do
        context 'when the endpoint works as expected' do
          let(:product) { Product.create(name: 'test product', product_details: ['light']) }

          let(:request_body) do
            {
              data: {
                product_details: ['small']
              }
            }
          end

          let(:expected_response) do
            {
              'name': 'test product',
              'product_details': ['small']
            }.as_json
          end

          it 'assigns product details to a product' do
            put :assign_product_details, params: { id: product.id }, body: request_body.to_json, as: :json

            expect(response).to have_http_status(:ok)
            api_response = JSON.parse(response.body).except('created_at', 'updated_at', 'id')
            expect(api_response).to eq(expected_response)
          end
        end
      end
    end
  end
end
