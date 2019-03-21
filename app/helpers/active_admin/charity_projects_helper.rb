module ActiveAdmin::CharityProjectsHelper
  def cutText(text, max)
    ret = text[0..max - 1]
    ret = ret + '...' if text.size > max
    ret
  end
end