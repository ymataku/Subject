class SubjectController < ApplicationController
  before_action:authenticate_user!

  def index
    @subject = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subjects = Subject.new
  end
  
  def create
    @subject = Subject.create(subject_params)
    # redirect_to subject_path(@subject),notice:"作成しました."
    redirect_to document_new_path(content:@subject.subjectname),notice:"作成しました."

  end

  def edit

  end

  def update
  end

  private
  def subject_params
    params.require(:subject).permit(:subjectname,:test)
    
  end



  
end
