class ToysController< ApplicationController
  def index
    # /cats/:cat_id/toys
    cat = Cat.find(params[:cat_id])
    render json: cat.toys
  end

  def show
    # /cats/:cat_id/toys/:id
    # /toys/:id << Prefer
    render json: Toy.find(params[:id])
  end

  def new
    @cat = Cat.find(params[:cat_id])
    @toy = Toy.new
    render :new
  end

  def create
    # POST /toys
    # self.params => Parameters < HashWithIndifferentAccess < Hash
    # .permit will whitelist attributes when mass assigning
    @toy = Toy.new(toy_params)
    @cat = @toy.cat


    if @toy.save
      redirect_to cat_url(@cat)
    else
      render :new
      # render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    render json: toy
  end

  def update
    toy = Toy.find(params[:id])

    success = toy.update(toy_params)
    if success
      render json: toy
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def toy_params
    self.params[:toy].permit(:name, :ttype, :cat_id)
  end
end
