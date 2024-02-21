class DetailsController < ApplicationController

  before_action :find_person
  before_action :find_person_detail, only: %i[show edit update destroy]

  def index
    @person_detail = Detail.all.includes(:persons)
    render json: {status: :ok}
  end
    
  def new
    @person_detail = Detail.new
  end

  def create
    if @person.detail.present?
        @person_detail = @person.detail_build(detail_params)
    else
      @person_detail = @person.build_detail(detail_params)
    end
    
    if @person_detail.save
      redirect_to persons_path, notice: 'Person detail was successfully created.'
    else
      render :new
    end  
  end

  def update
    @person_detail.update(detail_params)
    redirect_to person_detail_path(@person, @person_detail), message: "Person details was successfully Updated."
  end

  def show
    @person_detail
  end

  def destroy
    @person_detail.destroy
    redirect_to persons_path, notice: "Person details was successfully destroyed."
  end


  private
  
  def find_person
    @person = Person.find(params[:person_id])
  end

  def find_person_detail
    @person_detail = @person.detail
  end

  def detail_params
    params.require(:detail).permit(:title, :age, :phone )
  end

end
