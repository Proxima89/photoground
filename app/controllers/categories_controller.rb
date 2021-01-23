class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
 
  def create  # Admin can created category
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save  # Saves created category
        format.html { redirect_to @category, notice: 'Category was successfully created.' }  # Saves the newly created category and redirects to a page
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new } # Otherwise sends error and redirects to a page 
        format.json { render json: @category.errors, status: :unprocessable_entity } 
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update # Updates the newly created categories
    respond_to do |format| 
      if @category.update(category_params) 
        format.html { redirect_to @category, notice: 'Category was successfully updated.' } # Saves the updated category and reditrects to a new page
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit } # Otherwise if error occures will redirect to same page
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category)
    end
end
