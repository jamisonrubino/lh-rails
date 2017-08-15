require 'rails_helper'

RSpec.describe "collaborators/index", type: :view do
  before(:each) do
    assign(:collaborators, [
      Collaborator.create!(
        :user_id => 2
      ),
      Collaborator.create!(
        :user_id => 2
      )
    ])
  end

  it "renders a list of collaborators" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
