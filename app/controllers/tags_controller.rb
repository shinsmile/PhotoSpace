class TagsController < ApplicationController

  before_action :set_tag, only: [:show, :edit, :update]

  # def show
  #   @prototypes = Prototype.all
  # end

  def show
    @prototypes = @tag.prototypes
    @Tags = Tag.where(name: @tag.name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
