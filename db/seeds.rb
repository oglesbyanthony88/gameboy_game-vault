

# Create 2 users

kirby = User.create(username: "kingkirby", password: "Hello1")
samus = User.create(username: "SamusRox", password: "Hello2")

# Create 2 games each

kirby.Games.create(gamename: "Mercenary Force", console_format: "DMG-001",
 developer: "KAZe Co., Ltd.", publisher: "Meldac of Japan", authentic: true, 
 releasedate: "October 1990", condition: "Great")

kirby.Games.create(gamename: "Pocket Bomberman", console_format: "GBC",
 developer: "Hudson Soft", publisher: "Nintendo", authentic: true, 
 releasedate: "November, 1998", condition: "Great")

samus.Games.create(gamename: "Metroid Fusion", console_format: "GBA",
 developer: "Nintendo R&D1", publisher: "Nintendo", authentic: false, 
 releasedate: "November, 2002", condition: "Perfect")

samus.Games.create(gamename: "Pokemon Blue", console_format: "GBC",
 developer: "Game Freak", publisher: "Nintendo", authentic: true, 
 releasedate: "September, 1998", condition: "Good")

# Create wishlist for each

kirby.Wishlist.create(gamename: "Pokemon Gold", console_format: "GBC", user_id: kirby.id)
samus.Wishlist.create(gamename: "The Legend of Zelda: Link's Awakening", console_format: "DMG-001")