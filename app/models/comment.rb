class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  delegate :name, to: :user, allow_nil: true

  ATTRIBUTES_PARAMS = %i(blog_id body).freeze
end
