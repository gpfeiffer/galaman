class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :store_location
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied."
    redirect_to root_url
  end

  # def store_location
  #   # store last url as long as it isn't a /users path
  #   url = request.fullpath
  #   session[:previous_url] = url unless url =~ /\/users/
  # end

  # def after_sign_in_path_for(resource)
  #   session[:previous_url] || root_path
  # end

  # how to convert a hash with components mins, secs, cens into time
  def time_from_msc(opts)
    m = opts[:mins].to_i
    s = opts[:secs].to_i
    c = opts[:cens].to_i
    100 * (60 * m + s) + c
  end

  # how to find the discipline, or create a new one
  def find_discipline(opts)
    #FIXME: Why do these have to be strings, and not keys:
    #FIXME: find list of keys automatically in discipline model
    keys = ['distance', 'course', 'stroke', 'mode']
    subs = opts.reject { |k, v| not keys.include?(k) }
    Discipline.where(subs).first || Discipline.create(subs)
  end

end
