require 'tdd'

describe "#my_uniq" do
  my_array = [1,1,2,3,4]
  it "returns a new array" do
    expect(my_uniq(my_array)).to be_an_instance_of(Array)
  end

  it "returns only unique elements" do
    expect(my_uniq(my_array)).to eq([1,2,3,4])
  end

  it "maintains the order of the elements" do
    complex_array = [5,0,5,1,5,2,5,0,4,7]
    expect(my_uniq(complex_array)).to eq([5,0,1,2,4,7])
  end
end 

describe "Array#two_sum" do
  my_arr = [-1, 0, 2, -2, 1]

  it "exists as an Array method" do
    expect(my_arr).to respond_to(:two_sum)
  end

  it "returns an array" do
    expect(my_arr.two_sum).to be_an_instance_of(Array)  
  end

  it "returns a new array" do
    expect(my_arr.two_sum).not_to be(my_arr)
  end

  it "sorts each pair smallest to largest" do
    expect([-1, 3, 3, 3, 1].two_sum).to eq([[0, 4]])
  end

  it "sorts the array of pairs smallest to largest" do
    expect(my_arr.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "Array#my_transpose" do
  my_grid = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  it "exists as an Array method" do
    expect(my_grid).to respond_to(:my_transpose)
  end
  
  it "returns an array" do
    expect(my_grid.my_transpose).to be_an_instance_of(Array)
  end

  it "returns a new array" do
    expect(my_grid.my_transpose).not_to be(my_grid)
  end

  it "transposes the grid" do
    expect(my_grid.my_transpose).to eq([
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ])
  end
end
