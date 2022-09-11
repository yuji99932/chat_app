class AddOtherToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :other, :text
  end
end
