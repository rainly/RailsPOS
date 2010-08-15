require 'test_helper'

class DrawersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Drawer.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Drawer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Drawer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to drawer_url(assigns(:drawer))
  end
  
  def test_edit
    get :edit, :id => Drawer.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Drawer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Drawer.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Drawer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Drawer.first
    assert_redirected_to drawer_url(assigns(:drawer))
  end
  
  def test_destroy
    drawer = Drawer.first
    delete :destroy, :id => drawer
    assert_redirected_to drawers_url
    assert !Drawer.exists?(drawer.id)
  end
end
