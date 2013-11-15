module EbooksHelper
  FOOTER_TEXT = 'Copyright &copy; 2013 ghostnotes All Rights Reserved.'.html_safe

  def get_footer_class(amazon_response)
    if amazon_response.nil? || amazon_response.items.blank?
      footer_class = 'footer-fix-bottom'
    else
      footer_class = 'footer'
    end
    content_tag(:footer, content_tag(:div, content_tag(:small, FOOTER_TEXT), class: 'container text-center'), class: footer_class)
  end

  def show_error_message(amazon_response)
    if amazon_response.present? && amazon_response.items.empty?
      close_button = button_tag('&times;'.html_safe, type: 'button', class: 'close', data: { dismiss: 'alert' })
      content_tag(:div, close_button + 'There are no results. Check the word you input, please?', class: 'alert alert-error text-left')
    end
  end
end
