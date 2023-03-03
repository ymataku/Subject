class DocumentController < ApplicationController
  before_action :authenticate_user!
  include StringCheck
  def index
    @nav = params[:group]
    @pagenation = params[:pagenation].to_i
    @parameter = params[:content]
    
    user_name = Document.where(username: current_user.name)
    subject_name = Document.where(subjectname: params[:content])
    @document =  user_name.and(subject_name)

    if @document.count < (@pagenation - 1) * 12
      @pagenation -= 1
    elsif @pagenation <= 0
      @pagenation = 1
    end
   
  end

  def index_api
    user_name = Document.where(username: current_user.name)
    subject_name = Document.where(subjectname: params[:content])
    @test = user_name.and(subject_name)
    render json:@test
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    doc = string_check_test(params.require(:document))
    document = Document.create(doc)
    # document = Document.create(document_params)
    # string_check(document)
    
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
    document = Document.find(params[:id])
    test = string_check_test(params.require(:document))
    
    
    if document.update(test)
      redirect_to document_path(document, content: params[:content]), notice: '更新しました。'
    else
      render :edit
    end
  end

  private

  def document_params
    params.require(:document).permit(:username, :subjectname, :title, :content, :difficulty)
  end

  def string_check_test(params)
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

  def string_check(document)

    if document.class == nil
      p 'document is nil'
      return 
    end 
    p 'this is document'
    p document
    document.title = 'no title' if document.title == ''
    document.difficulty = case document.difficulty
                          when '1','2'
                            'easy'
                          when '3'
                            'medium'
                          when '4','5'
                            'difficult'
                          else
                            'all'
                          end
  end

end
