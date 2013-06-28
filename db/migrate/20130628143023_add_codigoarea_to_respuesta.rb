class AddCodigoareaToRespuesta < ActiveRecord::Migration
  def change
    add_column :respuestas, :codigoarea, :string
  end
end
