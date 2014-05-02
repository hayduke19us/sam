class InteractionsController < ApplicationController

  def symposium
    itenerary = Itenerary.find(params[:id])
    @interactions = itenerary.interactions 
  end

end
