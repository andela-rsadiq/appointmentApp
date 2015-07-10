class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :reason
      t.date :appointment_date
      t.time :appointment_time
      t.references :patient
      t.references :scheduler
      t.timestamps null: false
    end
  end
end
