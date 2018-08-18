class BlogsController < ApplicationController
  before_action :logged_in_user, :check_blocked_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :correct_blog, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:new, :create]
  before_action :check_rights_delete, only: [:destroy]
  before_action :check_rights_update, only: [:edit, :update]

  def index
    @blogs = Blog.join_with_conections(current_user).ordered_by_created_at.page(params[:page]).per Settings.pagination.blog
  end

  def show
    @support = Supports::BlogSupport.new @blog, current_user
  end

  def new
    @blog = current_user.blogs.new
  end

  def create
    @blog = current_user.blogs.new blog_params
    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit; end

  def update
    if @blog.update_attributes blog_params
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      redirect_to current_user
    else
      redirect_to @blog
    end
  end

  private

  def blog_params
    params.require(:blog).permit Blog::ATTRIBUTES_PARAMS
  end

  def correct_blog
    @blog = Blog.find_by id: params[:id]
    return if @blog.present?
    redirect_to root_url
  end

  def check_rights_delete
    rights_delete @blog, current_user
  end

  def check_rights_update
    rights_update @blog, current_user
  end
end
