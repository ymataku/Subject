class DocumentController < ApplicationController
  before_action :authenticate_user!
  
  def index_api
    user_name = Document.where(username: current_user.name)
    subject_name = Document.where(subjectname: params[:content])
    render json:user_name.and(subject_name)
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    modified_params = params_modify(params.require(:document))
    document = Document.create(modified_params)
    if document.save
      redirect_to document_path(document, content: params[:content]), notice: '作成しました.'
    else
      render :new
    end
  end

  def destroy
    document = Document.where(id:params[:id])
    document.destroy_all
    redirect_to document_index_path(content: params[:content], pagenation: params[:pagenation])
  end

  def destroy_api
    document = Document.find(params[:id])
    document.destroy
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    modified_params = params_modify(params.require(:document))
    document = Document.find(params[:id])
    if document.update(modified_params)
      redirect_to document_path(document, content: params[:content]), notice: '更新しました。'
    else
      render :edit
    end
  end

  private

  def params_modify(params)
    if params == nil
      p 'params is nil'
      return
    end

    params[:title] = 'no title' if params[:title] == ''
    params[:difficulty] = case params[:difficulty]
                          when '1','2'
                            'easy'
                          when '3'
                            'medium'
                          when '4','5'
                            'difficult'
                          else
                            'all'
                          end
    return params.permit(:username, :subjectname, :title, :content, :difficulty)
  end

end
