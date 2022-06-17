# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show edit update destroy assign_product_details]

      def index
        @products = Product.all
        render json: @products, status: 200
      end

      def show
        render json: @product, status: 200
      end

      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(name: product_params[:name])
          render json: @product, status: :ok
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
        head :no_content
      end

      def assign_product_details
        if @product.update(product_details: [product_params[:product_details].first])
          render json: @product, status: :ok
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'product not found' }, status: :not_found
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:data).permit(:name, product_details: [])
      end
    end
  end
end
