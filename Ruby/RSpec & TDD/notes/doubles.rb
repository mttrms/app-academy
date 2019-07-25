# Doubles
# When we write unit tests, we want each of our specs to test just one thing. This
# can be complicated when classes interact with other classes. Imagine:

class Order
  def initialize(customer)
    @customer = customer
  end

  def send_confirmation_email
    email(
      to: @customer.email_address,
      subject: "Order Confirmation",
      body: self.summary
    )
  end
end

# `Order` object needs a `Customer` object, when we call #send_confirmation_email
# the associated Customer object is used. If we want to test #send_confirmation_email
# we'll have to supply `Order` a `Customer` object.

RSpec.describe Order do
  subject(:order) do
    customer = Customer.new(
      :first_name => "Ned",
      :last_name => "Ruggeri",
      :email_address => "ned@nedz.io"
    )
    Order.new(customer)
  end

  it "sends emial successfully" do
    expect do
      subject.send_confirmation_email
    end.not_to raise_exception
  end
end

# This is troublesome because the spec for  #send_confirmation_email should only test that method
# (not Customer#email_address). If there is a problem with Customer#email_address, our spec ^ 
# will also break, even though it shouldn't. Will clog up spec failures.

# Another problem is if `Order` and `Customer` both have methods that interact with the other.
# Difficult to TDD when classes/files rely on eachother. We don't want to waste time building an
# actual `Customer`, when an object that "looks like" a Customer would be good enough.

# Test Doubles - also called a *mock* is a fake object that we can use to create the desired
# isoluation. Example below:

class Order
    def initialize(customer, product)
        @customer = customer
        @product = product
    end

    def send_confirmation_email
      email(
        to: @customer.email_address,
        subject: "Order Confirmation",
        body: self.summary
      )
    end

    def charge_customer
        @customer.debit_account(@product.cost)
    end
end

#RSPEC FILE
RSpec.describe Order do
  let(:customer) { double("customer") }
  subject(:order) { Order.new(customer) }

  it "sends email successfully" do
    allow(customer).to receive(:email_address).and_return("ned@appacademy.io")

    expect do
      order.send_confirmation_email
    end.to_not raise_exception
  end
end

# A method *stub* stands in for a method. `allow(double).to receive(:method)` `and_return(return_value)`
# This lets us totally isolate the test from the Customer class. Alternative one liner below:
let(:customer) { double("customer", :email_address => "ned@appacademy.io") }

# Method Expectations
# If the tested object is supposed to call methods on other objects, we should test the proper methods are called:

RSpec.describe Order
  let(:customer) { double('customer') }
  let(:product) { double('product', :cost => 5.99) }
  subject(:order) { Order.new(customer, product) }

  it "subtracts item cost from customer account" do
    expect(customer).to receive(:debit_account).with(5.99)
    order.charge_customer
  end
end

# Integration tests
# Mocks / Doubles let us write unit tests that isolate functionality of a single calss. For unit tests:
# In each spec, test one thing only. What if the `Customer` class didn't have a #debit_account method
# and it was #subtract_funds instead?

# Integration tests use real objects instead of mocks so we can verify classes interact correctly. A
# thorough test suite will have both unit and integration tests. 
