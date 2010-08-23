# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def drawer_id
    if @drawer.size == 0
      return "No Open Drawers"
    elsif @drawer.size == 1
      return "Drawer ID: #{@drawer.first.id} Opened: #{@drawer.first.created_at.to_formatted_s(:short) } "
    else
      return "Error Muliple Open Drawers"
    end
  end
  
  def current_drawer
    return session['drawer']
  end
  
  def current_tab
    return session['tab']
  end
end
