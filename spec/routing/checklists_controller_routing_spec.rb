require 'rails_helper'

RSpec.describe ChecklistsController, type: :routing do
  it { expect(get('/checklist')).to route_to('checklists#show') }
  it { expect(get('/checklist/edit')).to route_to('checklists#edit') }
  it { expect(put('/checklist')).to route_to('checklists#update') }

  it { expect(get('/checklist/new')).to_not be_routable }
  it { expect(post('/checklist')).to_not be_routable }
  it { expect(delete('/checklist')).to_not be_routable }
end
