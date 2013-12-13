 class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = '*'
  end

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = '*'
      render :text => '', :content_type => 'text/plain'
    end
  end
end
