class ControlpersonasController < ApplicationController
  # GET /controlpersonas
  # GET /controlpersonas.json
  def index
    @controlpersonas = Controlpersona.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @controlpersonas }
    end
  end

  # GET /controlpersonas/1
  # GET /controlpersonas/1.json
  def show
    @controlpersona = Controlpersona.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @controlpersona }
    end
  end

  # GET /controlpersonas/new
  # GET /controlpersonas/new.json
  def new
    @controlpersona = Controlpersona.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @controlpersona }
    end
  end

  # GET /controlpersonas/1/edit
  def edit
    @controlpersona = Controlpersona.find(params[:id])
  end

  # POST /controlpersonas
  # POST /controlpersonas.json
  def create
    @controlpersona = Controlpersona.new(params[:controlpersona])

    respond_to do |format|
      if @controlpersona.save
        format.html { redirect_to @controlpersona, notice: 'Controlpersona was successfully created.' }
        format.json { render json: @controlpersona, status: :created, location: @controlpersona }
      else
        format.html { render action: "new" }
        format.json { render json: @controlpersona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /controlpersonas/1
  # PUT /controlpersonas/1.json
  def update
    @controlpersona = Controlpersona.find(params[:id])

    respond_to do |format|
      if @controlpersona.update_attributes(params[:controlpersona])
        format.html { redirect_to @controlpersona, notice: 'Controlpersona was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @controlpersona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controlpersonas/1
  # DELETE /controlpersonas/1.json
  def destroy
    @controlpersona = Controlpersona.find(params[:id])
    @controlpersona.destroy

    respond_to do |format|
      format.html { redirect_to controlpersonas_url }
      format.json { head :no_content }
    end
  end
end
