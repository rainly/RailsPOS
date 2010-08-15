require 'test_helper'

class MiscsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Misc.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Misc.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Misc.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to misc_url(assigns(:misc))
  end
  
  def test_edit
    get :edit, :id => Misc.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Misc.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Misc.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Misc.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Misc.first
    assert_redirected_to misc_url(assigns(:misc))
  end
  
  def test_destroy
    misc = Misc.first
    delete :destroy, :id => misc
    assert_redirected_to miscs_url
    assert !Misc.exists?(misc.id)
  end
end
