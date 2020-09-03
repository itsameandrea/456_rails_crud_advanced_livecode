class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :type
      t.string :address

      t.timestamps
    end
  end
end
