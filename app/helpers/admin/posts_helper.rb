module Admin::PostsHelper

  def sources_collection
    Post::SOURCES.map.with_index {|key, index| [key, index]}
  end

end
