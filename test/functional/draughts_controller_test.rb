require 'test_helper'

class DraughtsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Draught.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Draught.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Draught.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to draught_url(assigns(:draught))
  end
  
  def test_edit
    get :edit, :id => Draught.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Draught.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Draught.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Draught.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Draught.first
    assert_redirected_to draught_url(assigns(:draught))
  end
  
  def test_destroy
    draught = Draught.first
    delete :destroy, :id => draught
    assert_redirected_to draughts_url
    assert !Draught.exists?(draught.id)
  end
end
