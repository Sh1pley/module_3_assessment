require 'rails_helper'

RSpec.describe '/api/v1/items' do
  it 'should respond with 200' do
    get "/api/v1/items"

    expect(response).to be_success
  end
end