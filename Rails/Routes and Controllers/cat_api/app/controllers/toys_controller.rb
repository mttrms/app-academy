class ToysController< ApplicationController
  def index
    render json: Toy.all
  end

  def show
    render json: Toy.find(params[:id])
  end

  def create
    # self.params => Parameters < HashWithIndifferentAccess < Hash
    # .permit will whitelist attributes when mass assigning
    toy = Toy.new(toy_params)

    if toy.save
      render json: toy
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
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
    self.params[:toy].permit(:cat_id, :name, :ttype)
  end
end
