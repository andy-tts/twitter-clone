class CreateHoots < ActiveRecord::Migration[5.1]
  def change
    create_table :hoots do |t|
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
