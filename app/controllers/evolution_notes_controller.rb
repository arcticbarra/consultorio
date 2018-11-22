class EvolutionNotesController < ApplicationController
  before_action :set_evolution_note, only: [:show, :edit, :update, :destroy]

  # GET /evolution_notes
  # GET /evolution_notes.json
  def index
    if current_user.doctor
      @evolution_notes = EvolutionNote.all
    else
      @evolution_notes = EvolutionNote.where(patient_id: params[:patient_id])
    end
  end

  # GET /evolution_notes/1
  # GET /evolution_notes/1.json
  def show
  end

  # GET /evolution_notes/new
  def new
    @patient = Patient.find(params[:patient_id])
    @evolution_note = @patient.evolution_notes.new
  end

  # GET /evolution_notes/1/edit
  def edit
  end

  # POST /evolution_notes
  # POST /evolution_notes.json
  def create
    @evolution_note = EvolutionNote.new(evolution_note_params)
    @evolution_note.doctor_id = current_user.doctor.id
    @evolution_note.patient_id =params[:patient_id]

    respond_to do |format|
      if @evolution_note.save
        format.html { redirect_to patient_evolution_notes_path(@evolution_note.patient), notice: 'Evolution note was successfully created.' }
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
        format.html { redirect_to patient_evolution_notes_path(@evolution_note.patient), notice: 'Evolution note was successfully created.' }
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
      params.require(:evolution_note).permit(:diagnosis, :treatment, :patient_id)
    end
end
