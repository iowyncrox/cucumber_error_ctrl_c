require 'cucumber'

class TestsController < ApplicationController
  # GET /tests
  # GET /tests.json
  def index
    features = "features/search.feature"
    args = features.split.concat %w(--format html)
    begin
      Cucumber::Cli::Main.new(args).execute!
    rescue SystemExit => e
      p "Cucumber done"
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tests }
    end
  end
end