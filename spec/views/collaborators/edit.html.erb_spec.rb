require 'rails_helper'

RSpec.describe "collaborators/edit", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!(
      :user_id => 1
    ))
  end

  it "renders the edit collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborator_path(@collaborator), "post" do

      assert_select "input#collaborator_user_id[name=?]", "collaborator[user_id]"
    end
  end
end
