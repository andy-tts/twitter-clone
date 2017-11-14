class CreateHootTags < ActiveRecord::Migration[5.1]
  def change
    create_table :hoot_tags do |t|
      t.integer :hoot_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
