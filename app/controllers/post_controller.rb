class PostController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
    # form에서 글쓰는 창이니까, 아무것도 없다.
  end

  def create
    # params[:username]  params[:title] params[:content]
    # 1번 방법
    Post.create(:username => params[:username],
              :title => params[:title],
              :content => params[:content])
    # 1-1번 방법
    # Post.create(username: params[:username],
    #           title: params[:title],
    #           content: params[:content])
    # 2번 방법
    # post = Post.new
    # post.username = params[:username]
    # post.title = params[:title]
    # post.content = params[:content]
    # post.save

    redirect_to '/'
  end

  def show
    # 어떤 글을 보여주겠다.
    # @변수를 통해서 erb 파일에서 보여준다.
    @post = Post.find(params[:id])
  end

  def destroy
    # @id = params[:id]
    # post = Post.find(@id)
    # post.destroy
    Post.find(params[:id]).destroy
    # '/' 루트페이지로 보낸다.
    redirect_to '/'
  end
end
