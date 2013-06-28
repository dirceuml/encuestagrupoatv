class CreateControlpersonas < ActiveRecord::Migration
  def change
    create_table :controlpersonas do |t|
      t.string :numerodocumento
      t.integer :estado

      t.timestamps
    end
  end
end
