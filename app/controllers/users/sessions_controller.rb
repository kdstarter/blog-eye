class Users::SessionsController < Devise::SessionsController

  def create
    remove_old_onliner
    super
  end

  def destroy
    remove_old_onliner
    super
  end

end