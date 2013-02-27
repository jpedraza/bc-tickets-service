class TicketsController < ApplicationController
  respond_to :html, :pdf

  def show
    @order = Order.find(params[:order_id])
    respond_to do |f|
      f.pdf { render :pdf => "test_name" }
      f.html { render :html => "test_name" }
    end
  end

  def index
    render :status => :forbidden, :text => "Nope."
  end
end
