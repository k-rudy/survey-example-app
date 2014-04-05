class CreateSources < ActiveRecord::Migration
  def up
    create_table :sources do |t|
      t.references :user
      t.string :source
      t.timestamps
    end
  end

  def down
    drop_table :sources
  end
end
