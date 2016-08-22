require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess
  
  test 'should not create records with wrong file format' do
    file = fixture_file_upload('files/wrong_format.csv','text/csv')
    

    assert_not Product.load(file)
  end

  test 'should populate db when good file uploaded' do
    file = fixture_file_upload('files/transactions.csv','text/csv')

    assert Product.load(file)
  end
end
