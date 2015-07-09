class CreateSchedulers < ActiveRecord::Migration
  def change
    create_table :schedulers do |t|
      t.string :name
      t.string :role
      t.timestamps null: false
    end
  end
end
