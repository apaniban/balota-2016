require 'rails_helper'

RSpec.describe Admin::PartiesController, type: :routing do
  it { expect(get('/admin/parties')).to route_to('admin/parties#index') }
  it { expect(get('/admin/parties/1')).to route_to('admin/parties#show', id: '1') }
  it { expect(get('/admin/parties/new')).to route_to('admin/parties#new') }
  it { expect(post('/admin/parties')).to route_to('admin/parties#create') }
  it { expect(get('/admin/parties/1/edit')).to route_to('admin/parties#edit', id: '1') }
  it { expect(put('/admin/parties/1')).to route_to('admin/parties#update', id: '1') }
  it { expect(delete('/admin/parties/1')).to route_to('admin/parties#destroy', id: '1') }
end
