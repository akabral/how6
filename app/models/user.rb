class User < ApplicationRecord
  ROLES = [:admin, :user]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # TODO: remover sign_up mais a frente :registerable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def user_role
    ROLES[self.role]
  end
end
