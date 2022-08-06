class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :country
      t.string :phone
      t.string :job
      t.timestamps
    end
  end
end
