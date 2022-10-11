class SubjectController < ApplicationController
  before_action :authenticate_user!

  def index
    @parameter = params[:group]
    @parameter = 'all' if @parameter == ''

    @page_param = params[:pagenation]
    @subject = if @parameter == 'is'
                 Subject.where(username: current_user.name).and(Subject.where(test: 0))
               elsif @parameter == 'notis'
                 Subject.where(username: current_user.name).and(Subject.where(test: 1))
               elsif @parameter == 'all'
                 Subject.where(username: current_user.name)
               else
                 Subject.where(username: current_user.name)
               end
    @pagenumber = (@subject.count / 12).to_i
    @pagenation = @page_param.to_i

    if @subject.count < (@pagenation - 1) * 12
      @pagenation -= 1

    elsif @pagenation <= 0
      @pagenation = 1
    end
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.create(subject_params)
    if @subject.save!
      redirect_to document_new_path(content: @subject.subjectname), notice: '作成しました.'
    else
      render :new
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    subject = Subject.find(params[:id])
    if subject.update(subject_params)
      redirect_to root_path, notice: '更新しました'
    else
      render action: :edit, notice: '変更に誤りがあります。'
    end
  end

  def destroy
    subject = Subject.find(params[:id])
    Document.where(username: subject.username).and(Document.where(subjectname: subject.subjectname)).destroy_all
    subject.destroy
    redirect_to root_path
  end

  private

  def subject_params
    params.require(:subject).permit(:username, :subjectname, :test)
  end
end
