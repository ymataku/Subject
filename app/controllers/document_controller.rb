class DocumentController < ApplicationController
  before_action:authenticate_user!
  
  def index
    # @document = Document.all
    @query = params[:content]
    @hello = "ちんちん"
    @document = Document.all
    
  end

  def new
    @document = Document.new
    @query = params[:content]
    
    
    
    if @query.present?
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      print(@query)
    end

  end

  def create
    @document = Document.create(document_params)
    if document_params.present?
      print(document_params)
    end
    redirect_to document_index_path,notice:"作成しました."
  end

  private
  def document_params
    params.require(:document).permit(:subjectname,:title,:content,:difficulty)
  end
end
