module ApplicationHelper
    
  def flash_to_alert(flash_name)
    s = ""
    s = "success" if flash_name == 'notice'
    s = "danger" if flash_name == 'error' || flash_name == 'recaptcha_error'
    s = "danger" if flash_name == 'error' || flash_name == 'recaptcha_error'
    s = "warning" if flash_name == 'alert'
    s
  end

  def breadcrumbs
    s = ""
    if @breadcrumbs_array && !@breadcrumbs_array.empty?
      s << "<ol class='breadcrumb'>"
      @breadcrumbs_array.each do |i|
        if i[:active]
          s << "<li class='active'>#{i[:title]}</li>"
        else
          if i[:link]
            s << "<li><a href='#{i[:link]}'>#{i[:title]}</a></li>"
          else
            s << "<li>#{i[:title]}</li>"
          end
        end
      end
      s << "</ol>"
    end
    s.html_safe
  end
    
end
