class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.page(params[:page]).per(2)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to action: :new, alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.user_id == current_user.id
      if @prototype.update(prototype_params)
        flash[:success] = 'Prototype was successfully updated.'
        redirect_to action: :index
      end
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.user_id == current_user.id
      if @prototype.destroy
        flash[:success] = 'Prototype was successfully deleted.'
        redirect_to action: :index
      end
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end
end
