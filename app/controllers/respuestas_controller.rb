class RespuestasController < ApplicationController
  # GET /respuestas
  # GET /respuestas.json
  def index
    @respuestas = Respuesta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @respuestas }
    end
  end

  # GET /respuestas/1
  # GET /respuestas/1.json
  def show
    @respuesta = Respuesta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @respuesta }
    end
  end

  # GET /respuestas/new
  # GET /respuestas/new.json
  def new
    @respuesta = Respuesta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @respuesta }
    end
  end

  # GET /respuestas/1/edit
  def edit
    @respuesta = Respuesta.find(params[:id])
  end

  # POST /respuestas
  # POST /respuestas.json
  def create
    @respuesta = Respuesta.new(params[:respuesta])

    respond_to do |format|
      if @respuesta.save
        format.html { redirect_to @respuesta, notice: 'Respuesta was successfully created.' }
        format.json { render json: @respuesta, status: :created, location: @respuesta }
      else
        format.html { render action: "new" }
        format.json { render json: @respuesta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /respuestas/1
  # PUT /respuestas/1.json
  def update
    @respuesta = Respuesta.find(params[:id])

    respond_to do |format|
      if @respuesta.update_attributes(params[:respuesta])
        format.html { redirect_to @respuesta, notice: 'Respuesta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @respuesta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respuestas/1
  # DELETE /respuestas/1.json
  def destroy
    @respuesta = Respuesta.find(params[:id])
    @respuesta.destroy

    respond_to do |format|
      format.html { redirect_to respuestas_url }
      format.json { head :no_content }
    end
  end
end
