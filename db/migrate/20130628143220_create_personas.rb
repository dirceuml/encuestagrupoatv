class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.integer :codigopersona
      t.string :nombrecompleto
      t.string :numerodocumento

      t.timestamps
    end
  end
end
