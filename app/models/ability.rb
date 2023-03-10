class Ability
  include CanCan::Ability

  def initialize(user)
    # all users logged-in or not can read public recipes
    can :read, Recipe, public: true # all users authenticated or not can view public recipes

    # additional permissions for logged in users (they can read their own posts)
    return unless user.present?

    can(:manage, Recipe, user:) # user can perform crud operation his/her own Recipe
    can(:manage, Food, user:) # user can perform crud operation his/her own Food
    # can(:read, Recipe, user:)
    # can(:destroy, Recipe, user:)

    # can(:read, Food, user:)
    # can(:destroy, Food, user:)
    # can(:update, Food, user:)

    # additional permissions for administrators
    # return unless user.admin?
    # can :read, Recipe
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
