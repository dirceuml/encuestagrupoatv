class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end  
  
  def responder
    survey = 1 #params[:survey_id]
    
    @survey = Survey.find(survey)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surveys }
    end
  end
  
  # POST /crear_en_bloque
  # POST /crear_en_bloque.json
  def registrar_respuestas
    grupo = Respuesta.maximum("grupo")
    #grupo = Respuesta.all(:select => "Max(grupo) as max_grupo").first.max_grupo
    
    if grupo.nil?
      grupo = 1
    else
      grupo = grupo.to_i() + 1
    end
    
    ActiveRecord::Base.transaction do       
      params[:respuesta].each do |question|      
   
        @respuesta = Respuesta.new(
          :survey_id => 1,#params[:survey_id],
          :question_id => params[:respuesta][question[1]],
          :respuesta => question[1],
          :codigoarea => params[:codigoarea],
          :grupo => grupo
        )

        if !@respuesta.save                    
          flash[:notice] = 'Ocurrio un error al registrar las respuestas'
          format.html { render action: "responder" }
        else
          documento = Persona.find(params[:id_persona]).numerodocumento
          @control = Controlpersona.find_by_numerodocumento(documento)
          if @control.update_attributes(:estado => 2)
            if @guardados.nil?
              @guardados = [@respuesta.id]
            else
              @guardados.push(@respuesta)
            end
          end                    
        end
      end        
    end

    respond_to do |format|
      format.html { render 'surveys/salir' } 
      format.json { render json: @alumno.errors, status: :unprocessable_entity }
    end    
  end
  

  def show
    @survey = Survey.find(params[:id])
  end

  def entrar
    numero = params[:numerodocumento]
    
    #if numero != ""
    if !numero.nil? && numero != ""
      @personas = Persona.find_by_numerodocumento(numero)

      if @personas.nil?      
        @mensajeerror = "Lo sentimos, no esta registrado en la base de datos de personas"
        #render :action => 'entrar'
      else
        @mensajeerror = ""
        estado = Controlpersona.find_by_numerodocumento(@personas.numerodocumento).estado

        if estado == 2
          @mensajeerror = "Usted ya ha contestado la encuesta"
          #render :action => 'entrar'
        else
          @mensajeerror = ""
          
          #ir a la encuesta          
          redirect_to responderencuesta_path(:id_persona => @personas.id) and return
        end
      end      
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personas }
    end
  end

  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times { question.answers.build }
    end
  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      redirect_to @survey, :notice => "Successfully created survey."
    else
      render :action => 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end
end
