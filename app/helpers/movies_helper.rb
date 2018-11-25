module MoviesHelper
  def not_commented_by_user?(user_id, movie_id)
    !Comment.exists?(user_id: user_id, movie_id: movie_id)
  end
end
