module ViewsHelper
  
  # html页面title
  def title(page_title)
    content_for(:title){page_title}
  end

end