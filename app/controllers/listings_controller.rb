class ListingsController < ApplicationController
    #before_filter :authenticate_user!

    def index
    	@listings = Listing.all
    end

    include ListingsHelper


    def new
        redirect_to "/" unless user_signed_in? && is_admin?
        @listing = Listing.new
    end

    def create
      Listing.create(params[:listing].permit(:title, :description, :starting_price, :rrp, :time_per_bid))
      redirect_to "/"
    end

    def show
        @listing = Listing.find(params[:id])
    end


end