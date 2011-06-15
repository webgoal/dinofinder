class CreateDinosaurs < ActiveRecord::Migration
  def self.up
    create_table :dinosaurs do |t|
      t.string :name
      t.decimal :height

      t.timestamps
    end
  end

  def self.down
    drop_table :dinosaurs
  end
end
