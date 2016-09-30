class MaterialsController < ApplicationController
  def index
    @materials = Material.all
  end
end
