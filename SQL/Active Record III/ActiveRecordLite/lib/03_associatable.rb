require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @class_name = (options[:class_name] || name).to_s.camelize
    @foreign_key = options[:foreign_key] || "#{class_name.underscore}_id".to_sym
    @primary_key = options[:primary_key] || :id
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @class_name = (options[:class_name] || name).singularize.camelize
    @foreign_key = options[:foreign_key] || "#{self_class_name}_id".underscore.to_sym
    @primary_key = options[:primary_key] || :id
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)

    define_method(name) do
      foreign_key = options.send(:foreign_key)
      model_class = options.model_class

      model_class
        .where(id: self.attributes[foreign_key])
        .first
    end
  end

  def has_many(name, options = {})
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
