require 'test_helper'

class IpadsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Ipad.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Ipad.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Ipad.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ipad_url(assigns(:ipad))
  end
  
  def test_edit
    get :edit, :id => Ipad.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Ipad.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ipad.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Ipad.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ipad.first
    assert_redirected_to ipad_url(assigns(:ipad))
  end
  
  def test_destroy
    ipad = Ipad.first
    delete :destroy, :id => ipad
    assert_redirected_to ipads_url
    assert !Ipad.exists?(ipad.id)
  end
end
