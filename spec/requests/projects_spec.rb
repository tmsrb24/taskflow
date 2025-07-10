require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user, scope: :user
  end

  describe "GET /projects" do
    it "succeeds" do
      get projects_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /projects" do
    context "with valid parameters" do
      it "creates a new project" do
        expect {
          post projects_path, params: { project: { name: "New Project", description: "A test project" } }
        }.to change(Project, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new project" do
        expect {
          post projects_path, params: { project: { name: "" } }
        }.to_not change(Project, :count)
      end
    end
  end
end
