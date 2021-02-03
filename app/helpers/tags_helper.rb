module TagsHelper
  # This will be used to generate custom selectors so that
  def get_tag_class(tag)
    case tag
    when 'c++'
      selector = 'cplusplus'
    when 'c#'
      selector = 'csharp'
    else
      selector = tag
    end
    # this is the html class, refer to it in application.scss
    "tag-#{selector}"
  end
end
