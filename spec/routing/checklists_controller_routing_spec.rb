require 'rails_helper'

RSpec.describe ChecklistsController, type: :routing do
  it { expect(get('/checklists')).to route_to('checklists#index') }
  it { expect(get('/checklists/1')).to route_to('checklists#show', id: '1') }
  it { expect(get('/checklists/new')).to route_to('checklists#new') }
  it { expect(post('/checklists')).to route_to('checklists#create') }
  it { expect(get('/checklists/1/edit')).to route_to('checklists#edit', id: '1') }
  it { expect(put('/checklists/1')).to route_to('checklists#update', id: '1') }
end
