class AddLinkToHoots < ActiveRecord::Migration[5.1]
  def change
  	add_column :hoots, :link, :string
  end
end
