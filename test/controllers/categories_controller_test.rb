require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

	def setup
		#setup the tests by creating a category with name sports and a user that's an admin
		@category = Category.create(name:"sports")
		@user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
	end
		
	test "should get categories index" do
		get categories_path
		assert_response :success
	end
	
	test "should get new" do
		sign_in_as(@user, "password")
		get new_category_path
		assert_response :success
	end
	
	test "should get show" do
		get category_path(@category)
		assert_response :success
	end
	
	test "should redirect create when admin not logged in" do
		#assert that the category count should not change when we try to post a category named "sports"
		#it could be any category name, we just need to provide something as an example
		assert_no_difference 'Category.count' do
			post categories_path, params: {category: {name: "sports"} }
		end
		#also assert that there should be a redirect to the categories_path
		assert_redirected_to categories_path
	end

end