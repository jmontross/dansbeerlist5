class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.date :date
      t.string :eventpic_file_name
      t.integer :eventpic_file_size
      t.datetime :eventpic_updated_at
      t.string :eventpic_content_type

      t.timestamps
    end
  end
end
