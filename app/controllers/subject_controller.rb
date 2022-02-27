class SubjectController < ApplicationController
  before_action:authenticate_user!
  def index
    @parameter = params[:group]
    @page_param = params[:pagenation]
    if @parameter == "is"
      @subject = Subject.where(username:current_user.name).and(Subject.where(test:0))
    elsif @parameter == "notis"
      @subject = Subject.where(username:current_user.name).and(Subject.where(test:1))
    elsif @parameter == "all"
      @subject = Subject.where(username:current_user.name)
    else
      @subject = Subject.where(username:current_user.name)      
    end
    @pagenumber = (@subject.count / 12).to_i
    @pagenation = @page_param.to_i

    if @subject.count < (@pagenation-1)*12
      @pagenation = @pagenation - 1
    
    elsif @pagenation <= 0
      @pagenation = 1
    end

  
  end
  
  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subjects = Subject.new
  end
  
  def create
    @subject = Subject.create(subject_params)
    redirect_to document_new_path(content:@subject.subjectname),notice:"作成しました."
  end

  def edit

  end

  def update

  end

  def destroy
    destroy = Document.where(username:current_user.name).and(Document.where(subjectname:params[:content]))
  end

  private
  def subject_params
    params.require(:subject).permit(:username,:subjectname,:test)
  end

end
