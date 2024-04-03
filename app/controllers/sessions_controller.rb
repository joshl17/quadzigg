class SessionsController < ApplicationController
  skip_before_action :redirect_to_signin
  def signin
    redirect_to cognito_signin_url, allow_other_host: true
  end

  def signout
    redirect_to cognito_signout_url, allow_other_host: true
  end

  def signup
    redirect_to cognito_signup_url, allow_other_host: true
  end

private

  def cognito_signin_url
    puts "entering cognito_signin_url method"
    CognitoUrls.login_uri(ENV['AWS_COGNITO_APP_CLIENT_ID'],
                          signin_redirect_uri)
  end

  def cognito_signup_url
    CognitoUrls.signup_uri(ENV['AWS_COGNITO_APP_CLIENT_ID'],
                           signin_redirect_uri)
  end

  def cognito_signout_url
    CognitoUrls.logout_uri(ENV['AWS_COGNITO_APP_CLIENT_ID'],
                           signout_redirect_uri)
  end

  def signin_redirect_uri
    puts "entering signin redirect uri method"
    auth_sign_in_url
  end

  def signout_redirect_uri
    auth_sign_out_url
  end
end
