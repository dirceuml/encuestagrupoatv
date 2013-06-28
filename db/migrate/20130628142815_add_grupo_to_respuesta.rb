class AddGrupoToRespuesta < ActiveRecord::Migration
  def change
    add_column :respuestas, :grupo, :string
  end
end
