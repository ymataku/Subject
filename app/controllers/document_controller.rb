class DocumentController < ApplicationController
  before_action:authenticate_user!
  def index
    @query = params[:content]
    @document = Document.where(subjectname:@query)
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
    params.require(:document).permit(:subjectname,:title,:content,:difficulty)
  end
end
