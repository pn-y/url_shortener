class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :link, foreign_key: true, index: true, null: false
      t.string :ip

      t.timestamps
    end
  end
end
