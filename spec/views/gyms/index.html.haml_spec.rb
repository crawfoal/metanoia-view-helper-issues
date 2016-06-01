require 'rails_helper'

RSpec.describe 'gyms/index.html.haml', type: :view do
  context "when the user's current role isn't admin" do
    it "doesn't show the link to create a new gym" do
      user = create :athlete
      user.add_role :admin
      set_current_user(user)
      assign(:gyms, create_list(:gym, 2))

      render

      expect(rendered).to_not have_selector '#new_gym'
    end
  end
end
