class DocumentController < ApplicationController
  before_action:authenticate_user!
  def index
    print("this is current user name")
    print(current_user.name)
    @document = Document.where(username:current_user.name).and(Document.where(subjectname: params[:content]))
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
