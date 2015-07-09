class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :reason
      t.datetime :appointment_details
      t.references :patient
      t.references :scheduler
      t.timestamps null: false
    end
  end
end
