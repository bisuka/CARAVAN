class BlogsController < ApplicationController

# 　記事一覧＋topページ
  def index
  	@blogs = Blog.all
  end

# 　詳細表示ページ
  def show
    @blog = Blog.find(params[:id])
  end

# 　新規投稿ページ
  def new
  	@blog = Blog.new
  end

# 　記事を保存
  def create
    blog = Blog.new(blog_params)
    binding.pry
    blog.save
    redirect_to blogs_path(blog.id)
  end

# 　記事編集
  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
