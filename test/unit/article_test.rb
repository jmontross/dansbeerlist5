
require '../test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  
  test "article creation " do 
    admin_user
    puts "we has admin user #{@admin_user}"
    # test = Post.new
    #     puts test
    #     test.assert == "stuff"
  end
  
  # test "the truth" do
  #   assert true
  # end
end
