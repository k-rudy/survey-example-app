class AddFullTextIntexToSurveys < ActiveRecord::Migration
  def change
    execute "
        create index on surveys using gin(to_tsvector('english', email));
        create index on surveys using gin(to_tsvector('english', comment));"
  end
end
