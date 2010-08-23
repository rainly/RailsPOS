page.replace_html 'right_bar', :partial => "show"
page.select('.current').each do |tab|
  tab.remove_class_name('current')
end
page << 'setup_rightscroll();'
#page.select("#tab_id_#{@tab.id}").first.add_class_name('current')