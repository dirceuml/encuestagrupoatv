class CreateRespuestas < ActiveRecord::Migration
  def change
    create_table :respuestas do |t|
      t.integer :survey_id
      t.integer :question_id
      t.integer :respuesta

      t.timestamps
    end
  end
end
