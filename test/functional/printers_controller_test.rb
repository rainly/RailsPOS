require 'test_helper'

class PrintersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Printer.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Printer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Printer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to printer_url(assigns(:printer))
  end
  
  def test_edit
    get :edit, :id => Printer.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Printer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Printer.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Printer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Printer.first
    assert_redirected_to printer_url(assigns(:printer))
  end
  
  def test_destroy
    printer = Printer.first
    delete :destroy, :id => printer
    assert_redirected_to printers_url
    assert !Printer.exists?(printer.id)
  end
end
