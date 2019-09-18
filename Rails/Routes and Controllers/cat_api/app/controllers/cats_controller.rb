class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  # 1. GET /cat/news to fetch a form
  # 2. Fill out form, click submit
  # 3. POST /cats the data in the form
  # 4. Invoke create action
  # 5. Redirect to /cats/#{id}

  def new
    # /cats/new
    # show a form to create a new object
    render :new
  end

  def create
    # POST /cats
    # { "cat": { "name": "Sally" } }
    @cat = Cat.new(name: params[:cat][:name])

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    # /cats/:id/edit
    # show a form to edit an existing object
  end

  def update
  end

  def destroy
    # DELETE /cats/:id
    # _method="DELETE" so rails understands to do a destroy
    cat = Cat.find(params[:id])
    cat.destroy

    redirect_to cats_url
  end
end
