module UsersHelper
  def fact_number
    " (##{Fact.count})" if Fact.last
  end
end
