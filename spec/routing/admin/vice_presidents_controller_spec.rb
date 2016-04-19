require 'rails_helper'

RSpec.describe Admin::VicePresidentsController, type: :routing do
  it { expect(get('/admin/vice_presidents')).to route_to('admin/vice_presidents#index') }
  it { expect(get('/admin/vice_presidents/1')).to route_to('admin/vice_presidents#show', id: '1') }
  it { expect(get('/admin/vice_presidents/new')).to route_to('admin/vice_presidents#new') }
  it { expect(post('/admin/vice_presidents')).to route_to('admin/vice_presidents#create') }
  it { expect(get('/admin/vice_presidents/1/edit')).to route_to('admin/vice_presidents#edit', id: '1') }
  it { expect(put('/admin/vice_presidents/1')).to route_to('admin/vice_presidents#update', id: '1') }
  it { expect(delete('/admin/vice_presidents/1')).to route_to('admin/vice_presidents#destroy', id: '1') }
end
