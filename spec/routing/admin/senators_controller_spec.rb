require 'rails_helper'

RSpec.describe Admin::SenatorsController, type: :routing do
  it { expect(get('/admin/senators')).to route_to('admin/senators#index') }
  it { expect(get('/admin/senators/1')).to route_to('admin/senators#show', id: '1') }
  it { expect(get('/admin/senators/new')).to route_to('admin/senators#new') }
  it { expect(post('/admin/senators')).to route_to('admin/senators#create') }
  it { expect(get('/admin/senators/1/edit')).to route_to('admin/senators#edit', id: '1') }
  it { expect(put('/admin/senators/1')).to route_to('admin/senators#update', id: '1') }
  it { expect(delete('/admin/senators/1')).to route_to('admin/senators#destroy', id: '1') }
end
