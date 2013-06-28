class AlterRespuestasGrupo < ActiveRecord::Migration
  def change
    remove_column :respuestas, :grupo
    add_column :respuestas, :grupo, :integer
  end
end
