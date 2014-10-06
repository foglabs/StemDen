class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new
  end

end
