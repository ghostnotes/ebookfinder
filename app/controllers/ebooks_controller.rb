require 'amazon/ecs'

class EbooksController < ApplicationController
  def show
    session[:search_key] = nil if session[:search_key].present?
  end

  def search
    @search_key = params[:title]
    if @search_key.present?
      @amazon_response = Amazon::Ecs.item_search(
          @search_key,
          { response_group: 'Small, ItemAttributes, Images', search_index: 'KindleStore' }
      )

      session[:search_key] = @search_key
    else
      session[:search_key] = nil
    end

    render template: 'ebooks/show'
  end
end
