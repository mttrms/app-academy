require_relative '03_associatable'

# Phase IV
module Associatable
  def has_one_through(name, through_name, source_name)

    define_method(name) do
      # Grab association options
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

      # Set required tables & keys for query
      source_table = source_options.table_name
      source_pk = source_options.primary_key
      source_fk = source_options.foreign_key

      through_table = through_options.table_name
      through_pk = through_options.primary_key

      key_val = self.attributes[through_pk]

      results = DBConnection.execute(<<-SQL, key_val)
        SELECT #{source_table}.*
        FROM #{through_table}
        JOIN #{source_table}
        ON #{through_table}.#{source_fk} = #{source_table}.#{source_pk}
        WHERE #{through_table}.#{through_pk} = ?
      SQL

      source_options.model_class.parse_all(results).first
    end
  end
end
