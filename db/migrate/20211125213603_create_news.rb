class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :time
      t.string :name
      t.string :publisher

      t.timestamps
    end
  end
end
