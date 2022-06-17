# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :set_company, only: %i[show edit update destroy]

      def index
        @companies = Company.all
        render json: @companies, status: 200
      end

      def show
        render json: @company, status: 200
      end

      def create
        @company = Company.new(company_params)

        if @company.save
          render json: @company, status: :created
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      def update
        if @company.update(company_params)
          render json: @company, status: :ok
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @company.destroy
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'company not found' }, status: :not_found
      end

      # Only allow a list of trusted parameters through.
      def company_params
        params.require(:company).permit(:name)
      end
    end
  end
end
