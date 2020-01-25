# frozen_string_literal: true

require "rails_helper"

RSpec.describe GithubRepositoriesController, :controller do
  let(:github_client) do
    instance_double(Octokit::Client, search_repositories: result)
  end
  let(:result) { double("result", items: [repo], total_count: 1) }
  let(:repo) { { name: "Repo name" } }

  before do
    allow(Octokit::Client).to receive(:new).and_return(github_client)
  end

  describe "#index" do
    it "doesn't fetch repositories on page rendering" do
      get :index

      expect(github_client).not_to have_received(:search_repositories)
      expect(assigns(:repositories)).to eq []
    end

    context "when search form is submitted" do
      it "doesn't fetch repositories when name parameter is empty" do
        get :index, params: { name: "" }

        expect(github_client).not_to have_received(:search_repositories)
        expect(assigns(:repositories)).to eq []
      end

      it "calls github client and fetch repositories" do
        get :index, params: { name: "repo" }

        expect(github_client).to have_received(:search_repositories)
        expect(assigns(:repositories)).to eq [repo]
      end
    end
  end
end
