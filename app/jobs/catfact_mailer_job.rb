class CatfactMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "this is the catfacts mailer"
  end
end
