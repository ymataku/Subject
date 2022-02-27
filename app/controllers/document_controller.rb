class DocumentController < ApplicationController
  before_action:authenticate_user!
  
  def index
    parameter = params[:group]
    @pagenation = params[:pagenation].to_i
    @parameter = params[:content]
    @params = parameter
    
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
    if @document.count < (@pagenation-1)*12
      @pagenation = @pagenation - 1
      
    elsif @pagenation <= 0
      @pagenation = 1
    end
    
    print(@document.to_json)
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    document = Document.create(document_params)
    if document_params.present?
      print(document_params)
    end
    redirect_to document_path(document,content:params[:content]),notice:"作成しました."
  end

  def destroy 
    document = Document.where(id:params[:id])
    document.destroy_all
    redirect_to document_index_path(content:params[:content],pagenation:params[:pagenation])
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update 
    @document = Document.find(params[:id])
    if @document.update(document_params)
      redirect_to document_path(@document,content:params[:content]), notice: "更新しました。"
    end
  end


  private
  def document_params
    params.require(:document).permit(:username,:subjectname,:title,:content,:difficulty)
  
  end
end
