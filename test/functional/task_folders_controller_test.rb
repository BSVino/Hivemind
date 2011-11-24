require 'test_helper'

class TaskFoldersControllerTest < ActionController::TestCase
  setup do
    @task_folder = task_folders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_folder" do
    assert_difference('TaskFolder.count') do
      post :create, task_folder: @task_folder.attributes
    end

    assert_redirected_to task_folder_path(assigns(:task_folder))
  end

  test "should show task_folder" do
    get :show, id: @task_folder.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_folder.to_param
    assert_response :success
  end

  test "should update task_folder" do
    put :update, id: @task_folder.to_param, task_folder: @task_folder.attributes
    assert_redirected_to task_folder_path(assigns(:task_folder))
  end

  test "should destroy task_folder" do
    assert_difference('TaskFolder.count', -1) do
      delete :destroy, id: @task_folder.to_param
    end

    assert_redirected_to task_folders_path
  end
end
