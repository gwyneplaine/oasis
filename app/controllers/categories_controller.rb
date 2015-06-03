class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  def show
    @category = Category.find params[:id]
  end
  def index
    @categories = Category.all
  end

  def create
    @category = Category.create category_params

    #Cloudinary Magic
    imgfile = params[:category][:image]
    if imgFile
      cloudObj = Cloudinary::Uploader.upload(imgfile.path) 
      #Resave category object
      @category.image = cloudObj['url']
      @category.save
    end

    redirect_to categories_path
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    category = Category.find params[:id]
    category.update category_params
    redirect_to category
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to categories_path
  end
  private 
  def category_params
    params.require(:category).permit(:slug, :description, :name)
  end 
end
