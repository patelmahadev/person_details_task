class PersonsController < ApplicationController
  before_action :find_person, except: %i[create index new]

  def index
    @persons = Person.all
  end
  
  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to persons_path, notice: "Person was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    unless @person.update(person_params)
      redirect_to persons_path, notice: "Person was successfully Updated.", status: :ok
    else
      render json: @person, status: :ok
    end
  end

  def show
    render json: @person
  end

  def destroy    
    @person.destroy
    redirect_to persons_path, notice: "Person was successfully destroyed."
  end


  private
  
  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :email )
  end
end
