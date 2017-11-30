class AddCountryToVisits < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :country, :string
  end
end
