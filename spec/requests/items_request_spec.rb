require 'rails_helper'

RSpec.describe '/api/v1/items' do
  before do
    @items_list = create_list(:item, 20)
  end

  it 'should respond with 200' do
    get "/api/v1/items"

    expect(response).to be_success
  end

  it 'should contain specific items' do
    get '/api/v1/items'

    items = response.body
    expect(items).to be_a(String)

    parsed_items = JSON.parse(items)
    
    expect(parsed_items.first).to have_key "id"
    expect(parsed_items.first).to have_key "name"
    expect(parsed_items.first).to have_key "description"

    expect(parsed_items.first).to_not have_key "created_at"
    expect(parsed_items.first).to_not have_key "updated_at"
  end

  it 'should respond with new item and 201 response after a post request' do
    params = {
      name: "Test",
      description: "Moar Test!"
    }
    post "/api/v1/items", params

    expect(response._status_code).to be(201)

    item = JSON.parse(response.body)

    expect(item).to have_key "id"
    expect(item).to have_key "name"
    expect(item).to have_key "description"
    
    expect(item).to_not have_key "created_at"
    expect(item).to_not have_key "updated_at"
  end
end