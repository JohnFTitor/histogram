class HistogramController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    text = histogram_params[:text]
    data = Text.generate_word_count(text)
    respond_to do |format|
      format.html { render :index, locals: { data: } }
    end
  end

  def index
    render :index, locals: { data: [] }
  end

  private

  def histogram_params
    params.permit(:text, :file)
    if params[:file] && File.exist?(params[:file])
      path = params[:file].tempfile.to_path.to_s
      params[:text] = File.read(path)
    end
    params
  end
end
