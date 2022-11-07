require "test_helper"

class ModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model = models(:one)
  end

  test "should get index" do
    get models_url, as: :json
    assert_response :success
  end

  test "should create model" do
    assert_difference("Model.count") do
      post models_url, params: { model: { email: @model.email, fullname: @model.fullname, password_digest: @model.password_digest, user: @model.user, username: @model.username } }, as: :json
    end

    assert_response :created
  end

  test "should show model" do
    get model_url(@model), as: :json
    assert_response :success
  end

  test "should update model" do
    patch model_url(@model), params: { model: { email: @model.email, fullname: @model.fullname, password_digest: @model.password_digest, user: @model.user, username: @model.username } }, as: :json
    assert_response :success
  end

  test "should destroy model" do
    assert_difference("Model.count", -1) do
      delete model_url(@model), as: :json
    end

    assert_response :no_content
  end
end
