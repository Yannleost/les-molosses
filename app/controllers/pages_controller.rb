class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def legislation
  end

  def contact
  end

  def qui_sommes_nous
  end

end
