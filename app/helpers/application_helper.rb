module ApplicationHelper
  
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end
  
  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me', new_contact_path} if you would like to work together."
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end
  
  def copyright_generator
    DarkstarudViewTool::Renderer.copyright "DarkStar UD", "All rights reserved"
  end
  
  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: new_contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
      },
      {
        url: tech_news_path,
        title: 'Tech News'
      },
    ]
  end
  
  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end
  
  def active? path
    "active" if current_page? path
  end
  
  
  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    
    if alert
      alert_generator alert
    end
  end
  
  def alert_generator msg
    js add_gritter(msg, title: "Eugene Wilkins III Portfolio", sticky: false)
  end
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  
  def markdown(content)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
  
  def gravatar_helper ref
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(ref.email)}",class: "img-circle", width: 60
  end
  
end