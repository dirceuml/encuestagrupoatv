class Respuesta < ActiveRecord::Base
  attr_accessible :question_id, :respuesta, :survey_id, :codigoarea, :grupo
  belongs_to :survey
  belongs_to :question
end
