class PrintersController < ApplicationController
  layout "print"
  
  def show
    @tab = Tab.find_by_id(params[:id])
  end
  
  def print
    @tab = Tab.find_by_id(params[:id])
    reciept = render_to_string "printers/show"
    kit = PDFKit.new(reciept, :margin_right => 0, :margin_left => 0, :margin_bottom => 0, :margin_top =>0)
    kit.stylesheets << 'public/stylesheets/print.css'
    file = kit.to_file("/posprint_#{@tab.id}.pdf")
    system("lpr -P star_pos /posprint_#{@tab.id}.pdf")
    File.delete("/posprint_#{@tab.id}.pdf")
  
    respond_to do |format|
      format.html
      format.js
    end
  end
end
