class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def destroy
    @food = Food.delete([params])
  end

  def create
    @food = Food.create
  end
end
