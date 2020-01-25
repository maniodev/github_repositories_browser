# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def pagination(repositories)
    pagy_bootstrap_nav(@paginated_repositories) unless repositories.empty?
  end
end
