class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  # 1. GET /cat/new to fetch a form
  # 2. Fill out form, click submit
  # 3. POST /cats the data in the form
  # 3. Validation fails
  # 4. Render new template again
  # 5. Form is filled in with @cat data

  def new
    # /cats/new
    # show a form to create a new object
    @cat = Cat.new
    render :new
  end

  def create
    # POST /cats
    # { "cat": { "name": "Sally" } }
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
      # render json: cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    # /cats/:id/edit
    # show a form to edit an existing object
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def destroy
    # DELETE /cats/:id
    # _method="DELETE" so rails understands to do a destroy
    cat = Cat.find(params[:id])
    cat.destroy

    redirect_to cats_url
  end

  private
  def cat_params
    params[:cat].permit(:name, :skill)
  end
end
