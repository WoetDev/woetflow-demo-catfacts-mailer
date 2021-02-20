module UsersHelper
  def fact_number
    " (##{Fact.last.id})" if Fact.last
  end
end
