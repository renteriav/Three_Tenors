class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.date :date
      t.time :time
      t.string :ticket_link
      t.string :location_website

      t.timestamps
    end
  end
end
