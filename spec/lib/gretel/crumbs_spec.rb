require "rails_helper"

RSpec.describe(Gretel::Crumbs) do
  before { Gretel::Crumbs.reset! }

  it 'bradcrumbs_routes' do
    expect(Gretel::Crumbs.breadcrumb_routes).to eq true
  end
end
