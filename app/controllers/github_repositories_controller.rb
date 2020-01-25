# frozen_string_literal: true

class GithubRepositoriesController < ApplicationController
  include Pagy::Backend

  def index
    @repositories = []
    fetch_repositories unless github_params[:name].blank?
  end

  private def fetch_repositories
    result = github_client.search_repositories(
      github_params[:name],
      page: github_params[:page],
      per_page: 5
    )
    @repositories = result.items
    @paginated_repositories, = pagy_array(
      @repositories,
      page: github_params[:page],
      count: result.total_count
    )
  end

  private def github_client
    @github_client ||= Octokit::Client.new
  end

  private def github_params
    params.permit(%i(name page))
  end
end
