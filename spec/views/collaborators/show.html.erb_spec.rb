require 'rails_helper'

RSpec.describe "collaborators/show", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!(
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
