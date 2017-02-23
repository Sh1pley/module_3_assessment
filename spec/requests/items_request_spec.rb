require 'rails_helper'

RSpec.describe '/api/v1/items' do
  before do
    @items = create_list(:item, 20)
  end
  
  it 'should respond with 200' do
    get "/api/v1/items"

    expect(response).to be_success
  end

  it 'should contain specific items' do
    get '/api/v1/items'

    items = response.body
    binding.pry
  end
end