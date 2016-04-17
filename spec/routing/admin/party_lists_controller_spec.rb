require 'rails_helper'

RSpec.describe Admin::PartyListsController, type: :routing do
  it { expect(get('/admin/party_lists')).to route_to('admin/party_lists#index') }
  it { expect(get('/admin/party_lists/1')).to route_to('admin/party_lists#show', id: '1') }
  it { expect(get('/admin/party_lists/new')).to route_to('admin/party_lists#new') }
  it { expect(post('/admin/party_lists')).to route_to('admin/party_lists#create') }
  it { expect(get('/admin/party_lists/1/edit')).to route_to('admin/party_lists#edit', id: '1') }
  it { expect(put('/admin/party_lists/1')).to route_to('admin/party_lists#update', id: '1') }
  it { expect(delete('/admin/party_lists/1')).to route_to('admin/party_lists#destroy', id: '1') }
end
