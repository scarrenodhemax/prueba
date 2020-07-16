class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    @people = Person.all

    render json: @people
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    if request.content_type == "application/json"
      @person = Person.new(person_params)
      if @person.save
        render json: @person, status: :created
      else
        render json: @person.errors, status: :bad_request #:unprocessable_entity
      end
    else
      render status: :bad_request
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    if @person.destroy
      render status: :ok
    else
      render status: :not_found
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find_by(nationalId: params[:nationalId])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:nationalId, :name, :lastName, :age, :originPlanet, :pictureUrl)
    end
end
