module Admin::PostsHelper

  def sources_collection
    Post::SOURCES.map.with_index {|key, index| [key, index]}
  end

  def statuses_collection
    Post::STATUSES.map.with_index {|key, index| [key, index]}
  end
end
