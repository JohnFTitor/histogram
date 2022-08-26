class HistogramController < ApplicationController
  def index
    path = "public/some.txt"
    @data = Text.generate_word_count(File.read(path))
  end
end
