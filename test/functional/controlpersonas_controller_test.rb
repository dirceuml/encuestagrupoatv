require 'test_helper'

class ControlpersonasControllerTest < ActionController::TestCase
  setup do
    @controlpersona = controlpersonas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:controlpersonas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create controlpersona" do
    assert_difference('Controlpersona.count') do
      post :create, controlpersona: { estado: @controlpersona.estado, numerodocumento: @controlpersona.numerodocumento }
    end

    assert_redirected_to controlpersona_path(assigns(:controlpersona))
  end

  test "should show controlpersona" do
    get :show, id: @controlpersona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @controlpersona
    assert_response :success
  end

  test "should update controlpersona" do
    put :update, id: @controlpersona, controlpersona: { estado: @controlpersona.estado, numerodocumento: @controlpersona.numerodocumento }
    assert_redirected_to controlpersona_path(assigns(:controlpersona))
  end

  test "should destroy controlpersona" do
    assert_difference('Controlpersona.count', -1) do
      delete :destroy, id: @controlpersona
    end

    assert_redirected_to controlpersonas_path
  end
end
