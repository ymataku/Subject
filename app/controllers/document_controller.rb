class DocumentController < ApplicationController
  before_action:authenticate_user!
  def index
    parameter = params[:group]
    if parameter == "difficult"
      @document = Document.where(username:current_user.name).and(Document.where(subjectname: params[:content]).and(Document.where(difficulty:5).or(Document.where(difficulty:4))))
    elsif parameter == "medium"
      @document = Document.where(username:current_user.name).and(Document.where(subjectname: params[:content]).and(Document.where(difficulty:3)))
    elsif parameter == "easy"
      @document = Document.where(username:current_user.name).and(Document.where(subjectname: params[:content]).and(Document.where(difficulty:2).or(Document.where(difficulty:1))))
    elsif parameter == "all"
      @document = Document.where(username:current_user.name).and(Document.where(subjectname: params[:content]))   
    else
      @document = Document.where(username:current_user.name).and(Document.where(subjectname: params[:content]))      
    end

    print("this is search innner")
    print(@value);
    
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
    @query = params[:content]
    if @query.present?
      print(@query)
    end
  end

  def create
    @document = Document.create(document_params)
    @pamams = params[:content]
    if document_params.present?
      print(document_params)
    end
    redirect_to document_path(@document),notice:"作成しました."
  end

  private
  def document_params
    params.require(:document).permit(:username,:subjectname,:title,:content,:difficulty)
  end
end
