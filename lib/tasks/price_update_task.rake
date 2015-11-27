desc 'trigger updates'
task trigger_price_updates: :environment do
	Product.update_prices
	Wishes.all.each do |wish|
	  catches = wish.find_catches
	  catches.each do |caught|
	    CatchMailer.catch(wish.user, caught, wish).deliver_now unless wish.notified
	    wish.update(notified: true)
	  end
	end
end
