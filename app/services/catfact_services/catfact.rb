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
  end
end