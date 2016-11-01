class OrderGetdownJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    puts "fdsafdsa"
  end
end
