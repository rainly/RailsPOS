require 'test_helper'

class BottlesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Bottle.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Bottle.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Bottle.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to bottle_url(assigns(:bottle))
  end
  
  def test_edit
    get :edit, :id => Bottle.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Bottle.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bottle.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Bottle.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bottle.first
    assert_redirected_to bottle_url(assigns(:bottle))
  end
  
  def test_destroy
    bottle = Bottle.first
    delete :destroy, :id => bottle
    assert_redirected_to bottles_url
    assert !Bottle.exists?(bottle.id)
  end
end
