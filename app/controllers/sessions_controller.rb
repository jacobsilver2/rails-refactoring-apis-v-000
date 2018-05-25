class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gitPost = GithubService(session[:token])
    gitPost.authenticate!(ENV["GITHUB_CLIENT", ENV["GITHUB_SECRET"], params[:code])
    gitPost.get_username

    # user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # user_json = JSON.parse(user_response.body)
    # session[:username] = user_json["login"]

    redirect_to '/'
  end
end