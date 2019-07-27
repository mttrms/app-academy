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
