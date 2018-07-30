class Supports::BlogSupport
  attr_reader :blog, :current_user

  def initialize blog, current_user
    @blog = blog
    @current_user = current_user
  end

  def blog
    @blog
  end

  def comments
    @comments ||= @blog.comments
  end

  def new_comment
    @comment = current_user.comments.build
  end
end
