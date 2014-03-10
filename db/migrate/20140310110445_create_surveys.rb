class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :email
      t.datetime :responded_at
      t.integer :rating
      t.text :comment
      t.string :token

      t.timestamps
    end
    
    add_index :surveys, :token
  end
end
