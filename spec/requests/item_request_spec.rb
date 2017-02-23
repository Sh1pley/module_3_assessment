require 'rails_helper'

RSpec.describe '/api/v1/item/1' do
  before do
    @items_list = create_list(:item, 20)
  end

  it 'should respond with 200' do
    get "/api/v1/items/1"

    expect(response).to be_success
  end

  it 'should contain specific items' do
    get '/api/v1/items/1'

    item = response.body
    expect(item).to be_a(String)
    
    parsed_item = JSON.parse(item)
    
    expect(parsed_item).to have_key "id"
    expect(parsed_item).to have_key "name"
    expect(parsed_item).to have_key "description"

    expect(parsed_item).to_not have_key "created_at"
    expect(parsed_item).to_not have_key "updated_at"
  end

  it 'should respond with 204 for DELETE request' do
    delete "/api/v1/items/1"

    expect(response._status_code).to be("204")
  end

end