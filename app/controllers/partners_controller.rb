class PartnersController < ApplicationController
  def index
    @awesome_partners = Entity.where(:level => "awesome")
    @cool_partners = Entity.where(:level => "cool")

    @schools = Entity.where("level NOT IN ['awesome', 'cool'] and type = 'school'")
    @companies = Entity.where("level NOT IN ['awesome', 'cool'] and type = 'company'")
    @user_groups = Entity.where("level NOT IN ['awesome', 'cool'] and type = 'user-group'")
  end
end
