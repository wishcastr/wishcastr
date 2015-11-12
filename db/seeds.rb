# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# 10.times do
#   User.create!(
#     name: Faker::Name.name,
#     email: Faker::Internet.safe_email,
#     postal_code: Faker::Address.postcode,
#     amz_id: rand(999999999),
#     amz_raccess_token: Faker::Internet.password,
#     amz_access_token: rand(999999999)
#   )

# end

samples = [
  {sku: "1250067057", affiliate_url: "http://www.amazon.com/Extreme-Ownership-U-S-Navy-SEALs/dp/1250067057%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1250067057", brand: "", title: "Extreme Ownership: How U.S. Navy SEALs Lead and Win", image_large: "http://ecx.images-amazon.com/images/I/41eQVmcqSpL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/41eQVmcqSpL._SL110_.jpg", description: "An instant New York Times bestseller. In Extreme Ownership, Jocko Willink and Leif Babin share hard-hitting, Navy SEAL combat stories that translate into lessons for business and life. With riveting first-hand accounts of making high-pressure decisions as Navy SEAL battlefield leaders, this book is equally gripping for leaders who seek to dominate other arenas. Jocko and Leif served together in SEAL Task Unit Bruiser, the most highly decorated Special Operations unit from the war in Iraq. Their efforts contributed to the historic triumph for U.S. forces in Ramadi. Through those difficult months of sustained combat, Jocko, Leif and their SEAL brothers learned that leadership--at every level--is the most important thing on the battlefield. They started Echelon Front to teach these same leadership principles to companies across industries throughout the business world that want to build their own high-performance, winning teams. This book explains the SEAL leadership concepts crucial to accomplishing the most difficult missions in combat and how to apply them to any group, team, or organization. It provides the reader with Jocko and Leif's formula for success: the mindset and guiding principles that enable SEAL combat units to achieve extraordinary results. It demonstrates how to apply these directly to business and life to likewise achieve victory."},
  {sku: "1338029991", affiliate_url: "http://www.amazon.com/Harry-Potter-Coloring-Book-Scholastic/dp/1338029991%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1338029991", brand: "", title: "Harry Potter Coloring Book", image_large: "http://ecx.images-amazon.com/images/I/61kvq74kVSL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/61kvq74kVSL._SL110_.jpg", description: "Clr Csm"},
  {sku: "1419717014", affiliate_url: "http://www.amazon.com/Diary-Wimpy-Kid-10-School/dp/1419717014%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1419717014", brand: "", title: "Diary of a Wimpy Kid #10: Old School", image_large: "http://ecx.images-amazon.com/images/I/61YgGsg-k-L.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/61YgGsg-k-L._SL110_.jpg", description: ""},
  {sku: "1607747308", affiliate_url: "http://www.amazon.com/Life-Changing-Magic-Tidying-Decluttering-Organizing/dp/1607747308%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1607747308", brand: "", title: "The Life-Changing Magic of Tidying Up: The Japanese Art of Decluttering and Organizing", image_large: "http://ecx.images-amazon.com/images/I/51H8x07Fd7L.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/517oqIVgrtL._SL110_.jpg", description: "First American Ed First Printing"},
  {sku: "1627792414", affiliate_url: "http://www.amazon.com/Killing-Reagan-Violent-Assault-Presidency/dp/1627792414%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1627792414", brand: "", title: "Killing Reagan: The Violent Assault That Changed a Presidency", image_large: "http://ecx.images-amazon.com/images/I/51pHkuCfmNL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51pHkuCfmNL._SL110_.jpg", description: "First Edition"},
  {sku: "0062225243", affiliate_url: "http://www.amazon.com/Pioneer-Woman-Cooks-Dinnertime-16-Minute/dp/0062225243%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0062225243", brand: "", title: "The Pioneer Woman Cooks: Dinnertime: Comfort Classics, Freezer Food, 16-Minute Meals, and Other Delicious Ways to Solve Supper!", image_large: "http://ecx.images-amazon.com/images/I/61guHHQ2ENL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/61guHHQ2ENL._SL110_.jpg", description: ""},
  {sku: "0312510780", affiliate_url: "http://www.amazon.com/First-100-Words-Roger-Priddy/dp/0312510780%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0312510780", brand: "", title: "First 100 Words", image_large: "http://ecx.images-amazon.com/images/I/51dxds64%2ByL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51KHHjiImCL._SL110_.jpg", description: "Brdbk"},
  {sku: "0545790352", affiliate_url: "http://www.amazon.com/Harry-Potter-Sorcerers-Stone-Illustrated/dp/0545790352%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0545790352", brand: "", title: "Harry Potter and the Sorcerer's Stone: The Illustrated Edition (Harry Potter, Book 1)", image_large: "http://ecx.images-amazon.com/images/I/51MIi4p2YyL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51MIi4p2YyL._SL110_.jpg", description: "Illustrated"},
  {sku: "0744016312", affiliate_url: "http://www.amazon.com/Fallout-Vault-Dwellers-Survival-Collectors/dp/0744016312%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0744016312", brand: "", title: "Fallout 4 Vault Dweller's Survival Guide Collector's Edition: Prima Official Game Guide (Prima Official Game Guides)", image_large: "http://ecx.images-amazon.com/images/I/51l7DDD1qNL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/419BrvasM3L._SL110_.jpg", description: "Spl Col"},
  {sku: "110188696X", affiliate_url: "http://www.amazon.com/Troublemaker-Surviving-Scientology-Leah-Remini/dp/110188696X%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D110188696X", brand: "", title: "Troublemaker: Surviving Hollywood and Scientology", image_large: "http://ecx.images-amazon.com/images/I/51228S%2BY3TL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51228S%2BY3TL._SL110_.jpg", description: ""},
  {sku: "B001E1Y5O6", affiliate_url: "http://www.amazon.com/VELCRO-ONE-WRAP-Self-Gripping-Cable-Reusable/dp/B001E1Y5O6%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB001E1Y5O6", brand: "Velcro", title: "VELCRO - ONE-WRAP Thin Self-Gripping Cable Ties: Reusable, Light Duty - 8\" x 1/2\" Ties, 100 Pack - Black", image_large: "http://ecx.images-amazon.com/images/I/31SGEFLLv%2BL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51rZ52-fm3L._SL110_.jpg", description: "100 Pack of adjustable, reusable, & low profile Black Velcro Brand Thin Ties\nToo Long? Cut to length. Too Short? Easily combine them\nTrusted & used in data & network centers across the globe\nEconomical, durable, adjustable and low profile\nWraps onto itself for secure hold\nGreat, reusable, alternative to zip ties\nTrusted & used in data & network centers across the globe\nEconomical, durable, adjustable and low profile\nWraps onto itself for secure hold"},
  {sku: "B004RMK4P8", affiliate_url: "http://www.amazon.com/50-PlayStation-Store-Gift-Card/dp/B004RMK4P8%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB004RMK4P8", brand: "SCEA", title: "$50 PlayStation Store Gift Card - PS3/ PS4/ PS Vita [Digital Code]", image_large: "http://ecx.images-amazon.com/images/I/51Wi3M4VYiL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51Wi3M4VYiL._SL110_.jpg", description: "Money card\nThe PlayStation Store wallet has a limit of $150\nDownload the latest games and add-ons: Discover and download tons of great PS4, PS3, and PS Vita games and DLC content to give you more\nAccess your favorite movies and TV shows: Rent or purchase the newest and biggest movies and TV shows available, and download or stream them instantly to your favorite PlayStation devices\nConnect with millions and start playing: Take your PlayStation games to the next level by downloading the latest multiplayer maps, missions, and characters to play online with friends"},
  {sku: "B009WHV3BM", affiliate_url: "http://www.amazon.com/Lightning-Digital-Adapter-Display-Generation/dp/B009WHV3BM%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB009WHV3BM", brand: "Apple", title: "Lightning Digital AV Adapter for iPhone 5, 5C, 5S, 6, 6 Plus / iPad Retina Display, mini, mini 2, mini 3, Air, Air 2 / iPod touch 5th Generation, 6th Generation", image_large: "http://ecx.images-amazon.com/images/I/319RtjdgM3L.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/319RtjdgM3L._SL110_.jpg", description: "Supports mirroring of what is displayed on your device screen to your HDMI-equipped TV, projector, or other compatible display\nSupports up to 1080p HD\nCustomer Care Number 1800- 271 -2273"},
  {sku: "B00AANMVNQ", affiliate_url: "http://www.amazon.com/Jackery-Bar-External-Battery-Charger/dp/B00AANMVNQ%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00AANMVNQ", brand: "Jackery", title: "Jackery Bar External Battery Charger - Portable Charger and Power Bank for iPhone 6s, 6s Plus, 6 Plus, 5, iPad Air, iPad Pro, Samsung Galaxy S6, S5 & Other Smart Devices - 6,000 mAh (Orange)", image_large: "http://ecx.images-amazon.com/images/I/31cKRA19GxL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/31Dw-gxdNWL._SL110_.jpg", description: "TRAVEL BATTERY CHARGER: Perfect portable travel charger for long flights, road trips, or whenever you need to charge your iPhone, iPad, and other smart devices.\nSMARTPHONES & TABLETS: Battery charger and power bank adds 2-3 full charges to your iPhone and 1-2 full charges to Samsung Galaxy.\nCOMPACT PORTABLE CHARGER: External battery travel charger is stylish and compact to easily fit into your bag to provide instant power to smartphones and tablets.\nADVANCED TECHNOLOGY: High-capacity battery pack and portable phone charger with 6000mAh battery capacity for iPhones, iPads, and Android devices.\nPOWERFUL BATTERY PACK: Panasonic grade A Li-ion polymer cell and premium microchips combined into a premium aluminum case to create a high-quality and powerful portable battery charger."},
  {sku: "B00AE9V3WQ", affiliate_url: "http://www.amazon.com/Aylio-Coccyx-Orthopedic-Comfort-Cushion/dp/B00AE9V3WQ%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00AE9V3WQ", brand: "Aylio", title: "Aylio Coccyx Orthopedic Comfort Foam Seat Cushion (Gray)", image_large: "http://ecx.images-amazon.com/images/I/51oo-qYMaUL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51pDb9r8UWL._SL110_.jpg", description: "Reduces pressure on the coccyx, tailbone and hip bones while sitting\nSuperior comfort for a chair, car seat, plane or wheelchair\nPatented design promotes healthy weight distribution, posture and spine alignment\nAssists in the relief and treatment of lower back pain, numbness, and pressure sores\nRemovable velvet cover is machine washable and allows for easy cleaning"},
  {sku: "B00DB9JV5W", affiliate_url: "http://www.amazon.com/Halo-5-Guardians-Xbox-One/dp/B00DB9JV5W%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00DB9JV5W", brand: "Microsoft", title: "Halo 5: Guardians", image_large: "http://ecx.images-amazon.com/images/I/51O0QLluCHL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51BDosZN95L._SL110_.jpg", description: "Standard\n<b>Xbox Live subscription required for online play.</b>\n<b>Intense story on a galactic scale:</b> Play as the Master Chief and Spartan Locke across three new worlds.\n<b>Your team is your weapon:</b> Play solo or with friends in a 4-player co-op experience.\n<b>Warzone:</b> New, 24-player massive-scale multiplayer mode.\n<b>Arena:</b> Pure, skill-based 4-vs-4 competitive combat.\n<b>New rewards system:</b> Earn Requisition Points to redeem for new gear.\n<b>Extensive multiplayer content:</b> Receive more than 15 new free maps and earn fresh, new content like weapons and gear, each month after launch."},
  {sku: "B00GDQ0RMG", affiliate_url: "http://www.amazon.com/Amazon-W87CUN-Fire-TV-Stick/dp/B00GDQ0RMG%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00GDQ0RMG", brand: "Amazon", title: "Amazon Fire TV Stick", image_large: "http://ecx.images-amazon.com/images/I/41KqCrQ2fuL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/510brCbRS2L._SL110_.jpg", description: "Fire TV Stick connects to your TV's HDMI port. It's an easy way to enjoy over 250,000 TV episodes and movies on Netflix, Amazon Video, HBO GO, and Hulu, plus games, music, and more\nCutting the cord? Watch the best of live TV on NBC News, NBA, and Sling TV, which includes ESPN, CNN, HDTV, AMC, A&E, Cartoon Network, and more.\n4x the storage and 2x the memory of Chromecast plus a dual-core processor and 1 GB of memory\nNo more buffering, ASAP learns what Amazon movies and shows you like so they start instantly\nNever miss out. Bring Fire TV Stick with you to watch your favorites away from home, even in hotels and dorm rooms.\nAmazon Prime members get unlimited access to Prime Video, including original programming like Transparent, plus over 1 million songs with Prime Music"},
  {sku: "B00IEFXDO8", affiliate_url: "http://www.amazon.com/AmazonBasics-Charger-Android-Devices-Output/dp/B00IEFXDO8%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00IEFXDO8", brand: "AmazonBasics", title: "AmazonBasics 4.0 Amp Dual USB Car Charger for Apple and Android Devices (High Output)", image_large: "http://ecx.images-amazon.com/images/I/41evr9FwwlL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51O9VPQs0rL._SL110_.jpg", description: "wo 2.0 amp USB ports to charging multiple devices at the same time\n20 watt power charges two devices simultaneously at full speed\nDiscrete and non-distracting LED to confirm connection\nCompatible with Apple, Android (Samsung Galaxy), and Fire Phone power cables to charge phones and tablets\nCovered under AmazonBasice 1-year Limited Warranty"},
  {sku: "B00IVPU786", affiliate_url: "http://www.amazon.com/Samsung-Class-Adapter-MB-MP32DA-AM/dp/B00IVPU786%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00IVPU786", brand: "Samsung", title: "Samsung 32GB EVO Class 10 Micro SDHC up to 48MB/s  with Adapter (MB-MP32DA/AM)", image_large: "http://ecx.images-amazon.com/images/I/41SmukivM1L.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51CHf87B%2BbL._SL110_.jpg", description: "Up to 48MB/s transfer speed\nGreat for Cell phones, Smartphones, Android Tablets, Tablet PCs.\nGreat speed and performance for full HD video recording, high resolution pictures, mobile gaming, music and more.\nWater proof, Temperature Proof, X-Ray proof, Magnetic proof\nCompatible with devices with micro SDHC and micro SDxC slots."},
  {sku: "B00JRGOKQ8", affiliate_url: "http://www.amazon.com/iOttie-Holder-iPhone-Samsung-G4-Retail/dp/B00JRGOKQ8%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00JRGOKQ8", brand: "iOttie", title: "iOttie Easy One Touch 2 Car Mount Holder for iPhone 6s Plus 6s 5s 5c, Samsung Galaxy S6 Edge Plus S6 S5 S4, Note 5 4 3, Google Nexus 5 4, LG G4-Retail Pack", image_large: "http://ecx.images-amazon.com/images/I/51Osu5ZjNIL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51ksz-hk2SL._SL110_.jpg", description: "Easy one touch mounting system locks and releases the device with just a push of a finger\nSuper sticky gel pad sticks securely to most surfaces, yet is still easily removable\nNew telescopic arm adds 2 inches to allow for closer device viewing\nThis product includes a 1 year product replacement warranty, contact for further details\nNow includes the new iOttie Sticky Gel Dashboard Pad which allows more flexibility as well as a smooth surface on textured and curved surfaces. Please note: This product opens to 3.2 inches in width, which makes it compatible with the iPhone 6 Plus which is 3.09 inches in width."},
  {sku: "B00LJT2EPK", affiliate_url: "http://www.amazon.com/Qualcomm-Certified-Aukey-Charger-Included/dp/B00LJT2EPK%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00LJT2EPK", brand: "Aukey", title: "[Qualcomm Certified] Aukey Quick Charge 2.0 30W 2 Ports USB Car Charger Adapter(AIPower 5V/2.4A+Quick Charge 12V/1.5A 9V/2A 5V/2A; Included an 20AWG 3.3FT Micro USB Cable) - Black", image_large: "http://ecx.images-amazon.com/images/I/41uOGJa-ebL._SL110_.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/41scoNYmytL.jpg", description: "Aukey Advantage: Amazon's No.1 Quick Charging Brand. Officially licensed and certified to use Qualcomm Quick ChargeTM 2.0 Technology applied to one of the ports, Charges compatible devices up to 75% faster than a standard charger\nCompatible models: Samsung Galaxy S6/S6 Edge/Edge+, Note 5, Note 4/Edge, Nexus 6, Sony Xperia Z4, Z4 Tablet, Z3, Z3 Compact, Z3 Tablet Compact, Z2 Tablet, Motorola Droid Turbo, Moto X 2014, HTC One M9, HTC One (M8), and more\nSafety Guarantee: A Quick ChargeTM 2.0 enabled device must be paired with a Quick ChargeTM 2.0 certified adapter; The car charger was tested by UL to the Qualcomm Quick Charge 2.0 specification (link to Qualcomm Website). Multiple built-in safeguards fully protect against over-current, overcharging and overheating for safe and fast charging.\nUniversal charging: Also charges all non-Quick ChargeTM 2.0 phones and tablets at their normal speed (up to 5 volts / 2.4A Max)with AIPower Tech Technology.\nPackage Content: Aukey CC-T1 Quick ChargeTM 2.0 Car Charger(with one quick charge 2.0 port), 20AWG 3.3FT USB Micro USB Cable,User manual,and full 18 Month Worry-Free Warranty"},
  {sku: "B00NH12YN0", affiliate_url: "http://www.amazon.com/AmazonBasics-Apple-Certified-Lightning-Cable/dp/B00NH12YN0%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00NH12YN0", brand: "AmazonBasics", title: "AmazonBasics Apple Certified Lightning to USB Cable - 3 Feet (0.9 Meters) - Black", image_large: "http://ecx.images-amazon.com/images/I/71Q6qO7ONlL._SL1500_.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/71Q6qO7ONlL._SX522_.jpg", description: "Charging and syncing cable for your Apple devices Apple MFi certification ensures complete charge and sync compatibility with iPhone 6 Plus / 6 / 5s / 5c / 5 / iPad Air / iPad mini / mini 2 / iPad 4th generation and iPod nano 7th generation Connects to your iPhone, iPad, or iPod with Lightning Connector and charges/syncs by connecting the USB connector into your wall charger or computer Compact Lightning Connector head works with nearly all cases Backed by an AmazonBasics 1-year Limited Warranty"},
  {sku: "B00QN1T6NM", affiliate_url: "http://www.amazon.com/iPhone-Screen-Protector-Maxboost-Glass/dp/B00QN1T6NM%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00QN1T6NM", brand: "Maxboost", title: "iPhone 6 Screen Protector, Maxboost&#174; iPhone 6 Glass Screen Protector - [Tempered Glass] World's Thinnest Ballistics Glass, 99% Touch-screen Accurate, Round Edge [0.2mm] Ultra-clear Glass Screen Protector Perfect Fit for iPhone 6 Maximum Screen Protection from Bumps, Drops, Scrapes, and Marks (Lifetime No-Hassle Warranty)", image_large: "http://ecx.images-amazon.com/images/I/51wxjlaS0qL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51Hr9M0pv5L._SL110_.jpg", description: "World's thinnest 0.2mm tempered glass screen protector for iPhone 6. Featuring maximum protection from high impact drops, scratches, scrapes, and bumps direct to the screen. [This product does not fit bigger iPhone 6 plus]\nSpecial Note: Due to the rounded design of the iPhone 6 and to enhance compatibility with most cases, the ballistic glass does not cover the entire screen. HD ultra-clear rounded glass for iPhone 6 is 99% touch-screen accurate.\n99.9% High-definition clear hydrophobic and oleo phobic screen coating protects against sweat and oil residue from fingerprints\nLifetime no-hassle warranty provides easy lifetime protection for your tempered glass screen protector.\nEasy installation with online video tutorials (saves trees!) on how to correctly install your screen protector."},
  {sku: "B00QZD81TS", affiliate_url: "http://www.amazon.com/Rain-X-Latitude-Beam-Wiper-Blade/dp/B00QZD81TS%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00QZD81TS", brand: "Itw Global Brands", title: "Rain-X Latitude Beam Wiper Blade 18", image_large: "http://ecx.images-amazon.com/images/I/31MXuAOB3gL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/31MXuAOB3gL._SL110_.jpg", description: ""},
  {sku: "B00VU4J8YY", affiliate_url: "http://www.amazon.com/Call-Duty-Black-Ops-Standard-Xbox/dp/B00VU4J8YY%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00VU4J8YY", brand: "Activision", title: "Call of Duty: Black Ops III - Standard Edition - Xbox One", image_large: "http://ecx.images-amazon.com/images/I/51sQIQc2eTL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51QeUvGc-LL._SL110_.jpg", description: "Standard\n<b>INTRODUCING A NEW ERA OF BLACK OPS:</b>Call of Duty is a dark, gritty future where a new breed of Black Ops soldier emerges and the lines are blurred between our own humanity and the cutting-edge military robotics that define the future of combat.\n<b>A CALL OF DUTY CAMPAIGN UNLIKE ANYTHING BEFORE IT:</b> Treyarch elevates the Call of Duty social gaming experience by delivering a campaign with the ability to play cooperatively with up to four players online, using the same battle-tested network infrastructure and social systems that support its world-class Multiplayer and Zombies game modes.\n<b>PREPARE FOR A LEVELED-UP MULTIPLAYER</b> With Black Ops III, Treyarch premieres a new momentum-based chained-movement system, allowing players to fluidly move through the environment with finesse, using controlled thrust jumps, slides, and mantling abilities in a multitude of combinations, all while maintaining complete control over your weapon at all times.\n<b>FIGHT THE UNDEAD IN AN ALL-NEW HORROR STORY</b> No Treyarch title would be complete without its signature Zombies offering - a full-game experience with its own distinct storyline right out of the box. Black Ops 3 Zombies is the most immersive and ambitious Call of Duty Zombies to date, with a full XP-based progression system for players that adds depth and re-playability to the engaging gameplay Zombies fans have come to expect."},
  {sku: "B00YQ2KCWO", affiliate_url: "http://www.amazon.com/Fallout-4-PlayStation/dp/B00YQ2KCWO%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB00YQ2KCWO", brand: "Bethesda", title: "Fallout 4 - PlayStation 4", image_large: "http://ecx.images-amazon.com/images/I/51fszUaTD9L.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51YPjvzVGRL._SL110_.jpg", description: "tandard\nNext generation of open-world gaming\nDeveloped by Bethesda Game Studios under the direction of Todd Howard\nFallout 4 is the follow up to the 2008 'Game of the Year' Fallout 3\nFirst title from the world-renowned studio since the release of Elder Scrolls V: Skyrim"},
  {sku: "B010OYASRG", affiliate_url: "http://www.amazon.com/Bluetooth-Speaker-Portable-Wireless-Waterproof/dp/B010OYASRG%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB010OYASRG", brand: "Cambridge Soundworks", title: "Bluetooth Speaker, Portable Wireless Waterproof: The OontZ Angle 3 Ultra Portable Speaker: 10W+ Louder Volume More Bass IPX5 Water Resistant Shower Speaker, BLACK by Cambridge SoundWorks", image_large: "http://ecx.images-amazon.com/images/I/51Or69eAMHL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/01BKeFCJnML._SL110_.jpg", description: "HIGH QUALITY CRYSTAL CLEAR SOUND distinct mids and highs from our two precision acoustic drivers delivering 10 Watts of excellent stereo sound and enhanced bass from our proprietary passive subwoofer design ------ THE OONTZ Angle 3: THE NEXT GENERATION OF ULTRA PORTABLE SPEAKER DELIVERS THE SOUND & FEATURES THAT DISTANCE IT FROM THE COMPETITION:\nLOUDER VOLUME & MORE BASS distortion-free at maximum volume; room filling sound, perfect for home, dorm room, kitchen, bathroom, car, parties\nWATER RESISTANT IPX5* splashproof, rainproof, dustproof, sandproof; outdoor shower speaker, perfect for the beach, poolside, boat & golf cart\nULTRA PORTABLE Only 9 ounces, Just 5 inches long; High capacity rechargeable 2200 mAh battery for up to 7 hours of playtime; designed to be comfortable to carry with no square edges, so much better for travel & hiking, superlight and easy to fit in your backpack, baggage\nBUILT-IN MIC for hands-free speakerphone; connect in seconds to Bluetooth devices including: iPhone, iPad, iPod, Samsung, Kindle, Smartphones, Tablets; play from laptops, PCs and non-Bluetooth devices using included 3.5mm audio cable to speaker's AUX-IN jack; includes Micro-USB cable for charging; official OontZ Angle 3 Carry Case available on Amazon.com sold separately; *IPX5 rating means speaker can resist gentle water spray & splash but cannot be partially or fully submerged"},
  {sku: "B010S9N6OO", affiliate_url: "http://www.amazon.com/AmazonBasics-Apple-Certified-Lightning-Cable/dp/B010S9N6OO%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB010S9N6OO", brand: "AmazonBasics", title: "AmazonBasics Apple Certified Lightning to USB Cable - 6 Feet (1.8 Meters) - White", image_large: "http://ecx.images-amazon.com/images/I/41uL4tOQsvL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/11UUrNnDDhL._SL110_.jpg", description: "Apple MFi certified charging and syncing cable for your Apple devices\nApple MFi certification ensures complete charge and sync compatibility with iPhone 6s Plus / 6s / 6 Plus / 6 / 5s / 5c / 5 / iPad Pro / iPad Air / Air 2 / iPad mini / mini 2 / mini 4 / iPad 4th gen / iPod Touch 5th gen / iPod nano 7th gen and Beats Pill+\nConnects to your iPhone, iPad, or iPod with Lightning Connector and charges/syncs by connecting the USB connector into your wall charger or computer\nCompact Lightning Connector head works with nearly all cases\nAn additional layer of protection has been added to the Lightning and USB ends to improve durability and reduce fraying; Cables have been tested to bend 95-degrees 4,000 times\nBacked by an AmazonBasics 1-Year Limited Warranty"},
  {sku: "B013CP5HCK", affiliate_url: "http://www.amazon.com/SanDisk-Extreme-microSDHC-Adapter-SDSQXNE-032G-GN6MA/dp/B013CP5HCK%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB013CP5HCK", brand: "SanDisk", title: "SanDisk Extreme 32GB microSDHC UHS-1 Card with Adapter (SDSQXNE-032G-GN6MA) [Newest Version]", image_large: "http://ecx.images-amazon.com/images/I/41t4YxxnBoL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/41bNQ%2Bu45OL._SL110_.jpg", description: "Engineered for the latest Android based smartphones, tablets, action and MIL cameras\nRecommended by GoPro for use with Hero, Hero3+, Hero4, & HERO+ LCD.\nShoot continuous burst mode, Full HD and 4K Ultra HD video, up to 90MB/s transfer speed\nBuilt for and tested in harsh conditions; temperature proof, water proof, shock proof, and x-ray proof\nSanDisk Memory Zone App makes it easy to manage your smartphone memory with your media files\nDeluxe data recovery software downloadable offer\nLifetime limited warranty"},
  {sku: "B014S09OKO", affiliate_url: "http://www.amazon.com/FalconZero-F170HD-DashCam-Viewing-Included/dp/B014S09OKO%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB014S09OKO", brand: "Falcon Zero", title: "FalconZero F170HD+ GPS DashCam 1080P 170° Viewing Angle", image_large: "http://ecx.images-amazon.com/images/I/41Ua-hIi1KL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/41UAxPKRG5L._SL110_.jpg", description: "Full HD 1920x1080 Recording at 30 fps, Begins Recording as Soon as Car Moves\nMotion Detection Recording When Parked, Super Wide 170 Degree Angle of Recording View\nLoop Interval Recording to micro SD Card, 32GB Class 10 SD Card Included,\nf/2.0 Six-Glass Lens with Night-Vision, WDR Enhanced Image Quality, HD Photo Capture Mode, GPS Location & Speed Recording\nUnparalleled USA Lifetime Customer Support, And Backed By Our 5 Year Hassle-Free Warranty"},
  {sku: "B014U0GRXE", affiliate_url: "http://www.amazon.com/PlayStation-500GB-Uncharted-Nathan-Collection-4/dp/B014U0GRXE%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB014U0GRXE", brand: "Sony", title: "PlayStation 4 500GB Uncharted: The Nathan Drake Collection Bundle", image_large: "http://ecx.images-amazon.com/images/I/41PTDYhhm8L.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/51CoZSXenkL._SL110_.jpg", description: "Console + One Controller\nIncludes: 500 GB PlayStation 4 System, 1 DualShock 4 Wireless Controller, AC Power Cable, HDMI Cable, USB 2.0 Cable, Mono Wired Headset, and digital voucher for Uncharted: The Nathan Drake Collection\nWith PlayStation Network and PlayStation Plus (sold separately), gain access to free games, next-gen online multiplayer, and more.\nCutting edge graphics bring game worlds to life like never before, and next gen processing speed gets you into your games faster than ever\nConnect with your friends to broadcast and celebrate your epic moments at the press of the Share button to Twitch, UStream, YouTube, Facebook and Twitter\nStream music, movies, sports, and television on Netflix, Amazon, and more. Subscription fees may apply"},
  {sku: "B01574SNES", affiliate_url: "http://www.amazon.com/PlayStation-500GB-Limited-Battlefront-Console-4/dp/B01574SNES%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB01574SNES", brand: "Sony", title: "PlayStation 4 500GB Limited Edition Star Wars Battlefront Console", image_large: "http://ecx.images-amazon.com/images/I/41NWby6rXrL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/31R8rbw-gML._SL110_.jpg", description: "Console + One Controller\nIncludes: customized 500GB Darth Vader PlayStation 4 System and 1 customized DualShock 4 Wireless Controller, AC Power Cable, HDMI Cable, USB 2.0 Cable, Mono Wired Headset, physical copy of Star Wars Battlefront - Deluxe Edition, and digital voucher for four Star Wars Classics\nWith PlayStation Network and PlayStation Plus (sold separately), gain access to free games, next-gen online multiplayer, and more.\nCutting edge graphics bring game worlds to life like never before, and next gen processing speed gets you into your games faster than ever\nConnect with your friends to broadcast and celebrate your epic moments at the press of the Share button to Twitch, UStream, YouTube, Facebook and Twitter\nStream music, movies, sports, and television on Netflix, Amazon, and more. Subscription fees may apply"},
  {sku: "B01574SORE", affiliate_url: "http://www.amazon.com/PlayStation-500GB-Console-Battlefront-Bundle-4/dp/B01574SORE%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB01574SORE", brand: "Sony", title: "PlayStation 4 500GB Console - Star Wars Battlefront Bundle", image_large: "http://ecx.images-amazon.com/images/I/41vZAl6ZapL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/41afRm2xuBL._SL110_.jpg", description: "Console + One Controller\nIncludes: 500 GB PlayStation 4 System, 1 DualShock 4 Wireless Controller, AC Power Cable, HDMI Cable, USB 2.0 Cable, Mono Wired Headset, digital voucher for Star Wars Battlefront, and digital voucher for 4 Star Wars Classics\nWith PlayStation Network and PlayStation Plus (sold separately), gain access to free games, next-gen online multiplayer, and more.\nCutting edge graphics bring game worlds to life like never before, and next gen processing speed gets you into your games faster than ever\nConnect with your friends to broadcast and celebrate your epic moments at the press of the Share button to Twitch, UStream, YouTube, Facebook and Twitter\nStream music, movies, sports, and television on Netflix, Amazon, and more. Subscription fees may apply"},
  {sku: "B015NGZFWS", affiliate_url: "http://www.amazon.com/PlayStation-1TB-Console-Limited-Bundle-4/dp/B015NGZFWS%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB015NGZFWS", brand: "Sony", title: "PlayStation 4 1TB Console - Call of Duty: Black Ops 3 Limited Edition Bundle", image_large: "http://ecx.images-amazon.com/images/I/41TxW%2BPvzrL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/31TAjtD5EkL._SL110_.jpg", description: "Console + One Controller\nIncludes: Fully customized 1 TB PlayStation 4 System and 1 customized DualShock 4 Wireless Controller inspired by the dark, futuristic world of Call of Duty: Black Ops III.  Also includes AC Power Cable, HDMI Cable, USB 2.0 Cable, Mono Wired Headset, physical copy of Call of Duty: Black Ops III, and digital voucher for the Nuk3town Bonus Map\nWith PlayStation Network and PlayStation Plus (sold separately), gain access to free games, next-gen online multiplayer, and more.\nCutting edge graphics bring game worlds to life like never before, and next gen processing speed gets you into your games faster than ever\nConnect with your friends to broadcast and celebrate your epic moments at the press of the Share button to Twitch, UStream, YouTube, Facebook and Twitter\nStream music, movies, sports, and television on Netflix, Amazon, and more. Subscription fees may apply"},
  {sku: "B017L187X2", affiliate_url: "http://www.amazon.com/Overwatch-Collectors-PC/dp/B017L187X2%3FSubscriptionId%3DAKIAJ64U7F3OSBNH7ERQ%26tag%3Dwishcastr-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB017L187X2", brand: "Activision", title: "Overwatch - Collector's Edition - PC", image_large: "http://ecx.images-amazon.com/images/I/41HMawomWEL.jpg", image_thumbnail: "http://ecx.images-amazon.com/images/I/41HMawomWEL._SL110_.jpg", description: "Collector's\nExperience the extraordinary\nPlay as heroes, not classes\nFight for the future.together\nThe world is your battlefield"},
]

samples.each do |i|
  AmazonProduct.create!(
    brand: i[:brand],
    sku: i[:sku],
    title: i[:title],
    image_large: i[:image_large],
    image_thumbnail: i[:image_thumbnail],
    description: i[:description],
    affiliate_url: i[:affiliate_url]
  )
end

products = AmazonProduct.all

# 150.times do
#   PriceHistory.create!(
#     product_id: products.sample.id,
#     currency: "USD",
#     price: Faker::Commerce.price,
#     date: Faker::Date.between(100.days.ago, Date.today))
# end

# 300.times do
#   wish = Wish.create(
#     name: Faker::Commerce.product_name,
#     user_id: rand(1..100),
#     threshold_price: rand(15.00..500.00).round(2),
#     category: Faker::Lorem.word,
#     query: Faker::Lorem.word)
#   number_of_products = (1..10).to_a.sample
#   number_of_products.times do
#     ProductsWish.create(
#       wish_id: wish.id,
#       product_id: products.sample.id)
#   end
# end

david = User.create!(
  name: "David Bernheisel",
  email: "david@wishcastr.com",
  postal_code: nil,
  amz_id: "AECXWYJZ5BRUS5KCN35V4O4XPP3Q",
  amz_raccess_token: nil,
  amz_access_token: ENV["AMZ_DAVID_TOKEN"])


lacey = User.create!(
  name: "Lacey Rice",
  email: "laceyrice@me.com",
  postal_code: nil,
  amz_id: "AE64PCCIMZPOEGXH2EG2Y7SMGU3Q",
  amz_raccess_token: nil,
  amz_access_token: ENV["AMZ_LACEY_TOKEN"])


dame = User.create!(
  name: "Da-Me Kim",
  email: "damekim1206@gmail.com",
  postal_code: nil,
  amz_id: "AEUT4REP2B6FMB7V4V6VFQ2AJJVQ",
  amz_raccess_token: nil,
  amz_access_token: ENV["AMZ_DAME_TOKEN"])

  wishy = Wish.create!(
    name: "Overwatch-Collectors-PC",
    user_id: dame.id,
    threshold_price: 1500,
    category: Faker::Lorem.word,
    saved: true,
    query: "Overwatch Collector")

  # sample_product = Product.find_by(sku: "B017L187X2")
  # PriceHistory.create!(product_id: sample_product.id, date: DateTime.now() - 1.day, price: 10000)
  # wishy.products << sample_product
