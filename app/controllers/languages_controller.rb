class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update, :destroy]

  # GET /languages
  def index
    @languages = Language.all
  end

  # GET /languages/new
  def new
    @language = Language.new
  end

  # GET /languages/1/edit
  def edit
  end

  # POST /languages
  def create
    @language = Language.new(language_params)
    respond_to do |format|
      if @language.save
        format.html { redirect_to languages_path, notice: 'Language was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /languages/1
  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to languages_path, notice: 'Language was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /languages/1
  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url, notice: 'Language was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_params
      params.require(:language).permit(:language)
    end
end
