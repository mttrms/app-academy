module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.new(name: name)
    toy.toyable_type = self.class.name
    toy.toyable_id = self.id
    toy.save
  end

end
