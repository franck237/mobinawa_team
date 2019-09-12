class AddStatusToCountry < ActiveRecord::Migration[5.2]
  def change
  	remove_column :countries, :statut, :boolean
  	add_column :countries, :status, :boolean
  end
end
