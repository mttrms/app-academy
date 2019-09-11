require_relative '03_associatable'

# Phase IV
module Associatable
  def has_one_through(name, through_name, source_name)

    define_method(name) do
      # Grab association options
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

      # Set required tables & keys for query
      source_table_name = source_options.table_name
      source_class = source_options.model_class
      source_fk = source_options.foreign_key
      through_table_name = through_options.table_name
      through_pk = through_options.primary_key

      results = DBConnection.execute(<<-SQL, self.attributes[through_pk])
        SELECT #{source_table_name}.*
        FROM #{through_table_name}
        JOIN #{source_table_name} ON #{through_table_name}.#{source_fk} = #{source_table_name}.#{through_pk}
        WHERE #{through_table_name}.#{through_pk} = ?
      SQL

      source_class.parse_all(results).first
    end
  end
end
