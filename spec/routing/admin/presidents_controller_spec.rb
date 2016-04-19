require 'rails_helper'

RSpec.describe Admin::PresidentsController, type: :routing do
  it { expect(get('/admin/presidents')).to route_to('admin/presidents#index') }
  it { expect(get('/admin/presidents/1')).to route_to('admin/presidents#show', id: '1') }
  it { expect(get('/admin/presidents/new')).to route_to('admin/presidents#new') }
  it { expect(post('/admin/presidents')).to route_to('admin/presidents#create') }
  it { expect(get('/admin/presidents/1/edit')).to route_to('admin/presidents#edit', id: '1') }
  it { expect(put('/admin/presidents/1')).to route_to('admin/presidents#update', id: '1') }
  it { expect(delete('/admin/presidents/1')).to route_to('admin/presidents#destroy', id: '1') }
end
