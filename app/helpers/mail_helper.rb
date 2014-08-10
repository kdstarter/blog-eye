# coding: utf-8
module MailHelper
  include ActionView::Helpers::DateHelper

  def distance_of_time(seconds=0)
    ActionView::Helpers::DateHelper.distance_of_time_in_words(seconds)
  end
  
end
