class HistogramController < ApplicationController
  def index
    render :index, locals: { data: [] }
  end
end
