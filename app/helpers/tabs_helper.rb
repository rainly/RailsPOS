module TabsHelper
  def option_selected_class(option, option_id, alteration)
    css_class = "option_#{option_id}"
    if alteration.blank?
      if option == Tab::DEFAULT_OPTION
        css_class += ' highlight'
      end
    elsif alteration == option
      css_class += ' highlight'
    end
    css_class
  end
end
