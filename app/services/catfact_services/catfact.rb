module CatfactServices
  class Catfact
    include HTTParty
    base_uri 'catfact.ninja'
    
    # Define query parameters with defaults
    def initialize(max_length=1000, limit=1)
      @fact_options = { query: { max_length: max_length } }
      @facts_options = { query: { max_length: max_length, limit: limit } }
      @breed_options = { query: { limit: limit } }
    end

    def fact
      self.class.get('/fact', @fact_options)
    end

    def facts
      self.class.get("/facts", @facts_options)
    end

    def breeds
      self.class.get("/breeds", @breed_options)
    end

    def daily_fact
      if Fact.last && Fact.last.created_at.at_beginning_of_day > Fact.all[-2].created_at.at_beginning_of_day
        Fact.last.body
      else
        response = fact
        catfact = JSON.parse(response&.body || "{}")["fact"]
        Fact.create(body: catfact)
        return catfact
      end
    end
  end
end