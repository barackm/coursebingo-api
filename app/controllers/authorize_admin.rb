class AuthorizeAdmin
  def initialize(user)
    @user = user
  end

  def call
    admin
  end

  def admin
    @user if @user.is_admin?
  end
end
