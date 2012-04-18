class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.role? :admin
      can :manage, :all
    else
      can :read, :all

      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user
      end
      can :destroy, Comment do |comment|
        comment.try(:user) == user
      end

      if user.role?(:author)
        can :create, Article
        can :update, Article do |article|
          article.try(:author) == user
        end
        can :destroy, Article do |article|
          article.try(:author) == user
        end

        can :create, Category
        can :update, Category
      end
    end
  end
end
