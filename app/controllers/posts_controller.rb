class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    if request.content_type =~ /xml/
      params[:message] = Hash.from_xml(request.body.read)["message"]
      post = Post.create(content: params[:message])
      render xml:
      '<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>' +
      '<url>' +
      "https://pesho-notes.herokuapp.com/messages/api/" + post.id.to_s +
      '</url>'
    elsif request.content_type =~ /json/
      post = Post.create(content: params[:message])
      render json: {url: "https://pesho-notes.herokuapp.com/messages/api/" + post.id.to_s}
    elsif request.content_type =~ /form/
      @post = Post.new({content: params[:content]})
    
        if @post.save
          redirect_to "https://pesho-notes.herokuapp.com/messages/api/" + @post.id.to_s
          #render "send", locals: { url: "https://pesho-notes.herokuapp.com/notes/api/" + @post.id.to_s}
          #format.html { render "send", locals: { url: "https://pesho-notes.herokuapp.com/notes/api/" + @post.id.to_s } } #"https://pesho-notes.herokuapp.com/posts/"
          #format.json { render :show, status: :created, location: @post }
        else
          render :new
          #format.html { render :new }
          #format.json { render json: @post.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body)
    end
end
