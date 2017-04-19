module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_action :set_page_defaults
  end
  
 def set_page_defaults
    @page_title = "Dark Star UD | Eugene's Portfolio Website"
    @seo_keywords = "Eugene Wilkins III Portfolio"
  end
  
end