require 'rails_helper'

RSpec.describe 'athletes/climb_logs/index.html.haml', type: :view do
  helper FontAwesome::Rails::IconHelper

  it 'does not yield errors (including n+1 query errrors)' do
    athlete = DataSetUp.athlete_with_climbs_logged
    set_current_user(athlete)
    assign(:climb_logs_tree, ClimbLogsTree.new(athlete.athlete_story))
    expect { render }.to_not raise_error
  end
end
