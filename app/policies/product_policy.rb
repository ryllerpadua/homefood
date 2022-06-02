class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope ==> Product (classe do model , mesma coisa que Product.all)
      scope.all
    end

  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    user
  end

  def edit?
    # user ==> current_user
    # record ==> o objeto que eu estou passando (neste caso: @product)
    # record.user == user => abreviaçao de if e else, se for true, retorna true, senão retorna o padrão do Policy(false)
    # como os metodos edit e update tem os mesmos conteudos , eu posso criar um novo metodo para ambos (ex: is_owner?)
    owner?
  end

  def update?
    # record.user == user
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
