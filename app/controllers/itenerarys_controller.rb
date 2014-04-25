class ItenerarysController < ApplicationController
  def show
    @itenerary = Itenerary.find(params[:id])
  end

  def update
  end

  def create
  end

  def destroy
  end
end
