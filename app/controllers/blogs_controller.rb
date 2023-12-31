class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    # 找到指定的blogs,  migration,   is_top   默认false,  修改之后是true
    #@top_blogs = Blog.where('is_top = ?', true).order('created_at desc')
    # 找到普通的blogs
    @blogs = Blog.all
    #@blogs = @blogs.where('title like ?', "%#{params[:blog_title]}%") if params[:blog_title].present?
    #@blogs = @blogs.where('content like ?', "%#{params[:blog_content]}%") if params[:blog_content].present?
    @blogs = @blogs.where('content like ? or title like ?', "%#{params[:blog_content]}%", "%#{params[:blog_content]}%") if params[:blog_content].present?
    @total_count = @blogs.all.size
    #@blogs = @blogs.order('created_at desc').page(params[:page]).per(100)
    @blogs = @blogs.order('id desc').page(params[:page]).per(100)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: '操作成功' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: '操作成功' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: '操作成功' }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :category_id, :is_top)
    end
end
