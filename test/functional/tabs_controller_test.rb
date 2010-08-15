require 'test_helper'

class TabsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Tab.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Tab.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Tab.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tab_url(assigns(:tab))
  end
  
  def test_edit
    get :edit, :id => Tab.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Tab.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tab.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Tab.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tab.first
    assert_redirected_to tab_url(assigns(:tab))
  end
  
  def test_destroy
    tab = Tab.first
    delete :destroy, :id => tab
    assert_redirected_to tabs_url
    assert !Tab.exists?(tab.id)
  end
end
