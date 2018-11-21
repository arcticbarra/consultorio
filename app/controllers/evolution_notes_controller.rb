class EvolutionNotesController < ApplicationController
  before_action :set_evolution_note, only: [:show, :edit, :update, :destroy]

  # GET /evolution_notes
  # GET /evolution_notes.json
  def index
    @evolution_notes = EvolutionNote.where(patient_id: params[:patient_id])
  end

  # GET /evolution_notes/1
  # GET /evolution_notes/1.json
  def show
  end

  # GET /evolution_notes/new
  def new
    @evolution_note = EvolutionNote.new
  end

  # GET /evolution_notes/1/edit
  def edit
  end

  # POST /evolution_notes
  # POST /evolution_notes.json
  def create
    @evolution_note = EvolutionNote.new(evolution_note_params)

    respond_to do |format|
      if @evolution_note.save
        format.html { redirect_to @evolution_note, notice: 'Evolution note was successfully created.' }
        format.json { render :show, status: :created, location: @evolution_note }
      else
        format.html { render :new }
        format.json { render json: @evolution_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evolution_notes/1
  # PATCH/PUT /evolution_notes/1.json
  def update
    respond_to do |format|
      if @evolution_note.update(evolution_note_params)
        format.html { redirect_to @evolution_note, notice: 'Evolution note was successfully updated.' }
        format.json { render :show, status: :ok, location: @evolution_note }
      else
        format.html { render :edit }
        format.json { render json: @evolution_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evolution_notes/1
  # DELETE /evolution_notes/1.json
  def destroy
    @evolution_note.destroy
    respond_to do |format|
      format.html { redirect_to evolution_notes_url, notice: 'Evolution note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evolution_note
      @evolution_note = EvolutionNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evolution_note_params
      params.fetch(:evolution_note, {})
    end
end
