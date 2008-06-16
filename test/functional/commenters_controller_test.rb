require File.dirname(__FILE__) + '/../test_helper'

class CommentersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:commenters)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_commenter
    assert_difference('Commenter.count') do
      post :create, :commenter => { }
    end

    assert_redirected_to commenter_path(assigns(:commenter))
  end

  def test_should_show_commenter
    get :show, :id => commenters(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => commenters(:one).id
    assert_response :success
  end

  def test_should_update_commenter
    put :update, :id => commenters(:one).id, :commenter => { }
    assert_redirected_to commenter_path(assigns(:commenter))
  end

  def test_should_destroy_commenter
    assert_difference('Commenter.count', -1) do
      delete :destroy, :id => commenters(:one).id
    end

    assert_redirected_to commenters_path
  end
end
