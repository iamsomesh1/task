class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.date :dob
      t.text :address

      t.timestamps
    end
  end
end
