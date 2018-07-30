class Supports::CommentSupport
  attr_reader :comment, :current_user

  def initialize comment, current_user
    @comment = comment
    @current_user = current_user
    @blog = @comment.blog
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
