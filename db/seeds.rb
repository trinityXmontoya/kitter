# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
#
# User.create(
#     username: "felixthecat",
#     name: "Felix",
#     email: "felixthecat@gmail.com",
#     background_photo_url: 'http://hdwallpappers.com/images/wallpapers/felix-the-cat-collage-wallpaper.gif',
#     profile_photo_url: "http://www.mobymusic.biz/images/register/user/felix_the_cat.png",
#     bio: " A funny animal cartoon character created in the silent film era.",
#     website: "http://www.felixthecat.com/",
#     verified: true,
#     location: "NYC",
#     country_id: 1)
#
#
# User.create(
#     username: "therealpusheen",
#     name: "pusheen",
#     email: "therealpusheen@gmail.com",
#     background_photo_url: "http://fc01.deviantart.net/fs70/f/2013/190/8/f/pusheen_by_pieu57-d6cq4fr.jpg",
#     profile_photo_url: "http://fc09.deviantart.net/fs70/f/2013/184/4/6/gato_pusheen_png_4_by_vaniiina-d6bsuyz.png",
#     bio: "An animated webcomic series that depicts the life and dreams of the titular gray tabby cat",
#     website: "http://pusheen.com/",
#     verified: true,
#     location: "Park Ridge, Illinois",
#     country_id: 1)
#
#   User.create(
#         username: "garfield",
#         name: "Garfield",
#         email: "Garfield@gmail.com",
#         background_photo_url: "http://cartoonpapers.com/wp-content/uploads/2014/02/garfield2as8.jpg",
#         profile_photo_url: "http://upload.wikimedia.org/wikipedia/en/thumb/b/bc/Garfield_the_Cat.svg/250px-Garfield_the_Cat.svg.png",
#         bio: "I've loved lasagna since the day I was born",
#         website: "http://garfield.com/",
#         verified: false,
#         location: "Marion, Indiana",
#
#         country_id: 1)
#
# User.create(
#     username: "PussInBoots",
#     name: "Master Cat",
#     email: "pussinboots@gmail.com",
#     background_photo_url: "http://art.ngfiles.com/images/72/shayphis_forest-background.jpg",
#     profile_photo_url: "http://img4.wikia.nocookie.net/__cb20110515182613/villains/images/c/c7/Puss-in-boots_(Shrek).png",
#     bio: "Il gatto con gli stivali",
#     website: "http://www.pussinbootsthemovie.com/",
#     verified: true,
#     location: "Glendale, CA",
#     country_id: 1)
#
#   User.create(
#       username: "hellokitty",
#       name: "kitty",
#       email: "hellokitty@gmail.com",
#       background_photo_url: "http://www.leadingwallpapers.com/wp-content/uploads/2013/10/Hello-Kitty-Backgrounds.jpg",
#       profile_photo_url: "http://www.clipartbest.com/cliparts/9T4/A58/9T4A58qTE.gif",
#       bio: "An animated webcomic series that depicts the life and dreams of the titular gray tabby cat",
#       website: "http://pusheen.com/",
#       verified: true,
#       location: "NYC",
#       country_id: 1)
#
#
# Tweet.create(
#   content: "where is john with my lasagna?" ,
#   user_id: 3 ,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 10,
#   num_of_retweets: 2
#   )
#
# Tweet.create(
#   content: "what does it take to get a lasagna in here!" ,
#   user_id: 3,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 5 ,
#   num_of_retweets: 5
#   )
#
# Tweet.create(
#   content: "My name will become legend..." ,
#   user_id: 4,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 3,
#   num_of_retweets: 11
#   )
#
# Tweet.create(
#   content: "Holy frijoles!" ,
#   user_id: 4 ,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 5,
#   num_of_retweets: 2
#   )
#
# Tweet.create(
#   content: "Who let all these cats out?" ,
#   user_id: 7 ,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 5 ,
#   num_of_retweets: 1
#   )
#
# Tweet.create(
#   id: 90,
#   content: "What do you guys feel about letting #dogs on the site?" ,
#   user_id: 7,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 0 ,
#   num_of_retweets: 10
#   )
#
# Tweet.create(
#   id: 91,
#   content: "@trinity Allowing #DOGS ?!?!?! That's treason!" ,
#   user_id: 3 ,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 24 ,
#   num_of_retweets: 3
#   )
#
#   Reply.create(
#     original_tweet_id: 90 ,
#     reply_tweet_id: 91 ,
#     created_at: '2014-06-10 15:41:03 -0400',
#     updated_at: '2014-06-10 15:41:03 -0400'
#     )
#    Reply.create(
#     original_tweet_id: 90 ,
#     reply_tweet_id: 92 ,
#     created_at: '2014-06-10 15:41:03 -0400',
#     updated_at: '2014-06-10 15:41:03 -0400'
#     )
#     Reply.create(
#     original_tweet_id: 90 ,
#     reply_tweet_id: 93,
#     created_at: '2014-06-10 15:41:03 -0400',
#     updated_at: '2014-06-10 15:41:03 -0400'
#     )
#     Reply.create(
#     original_tweet_id: 90 ,
#     reply_tweet_id: 94,
#     created_at: '2014-06-10 15:41:03 -0400',
#     updated_at: '2014-06-10 15:41:03 -0400'
#     )
#
#
#
# Tweet.create(
#   id: 93,
#   content: "Guys, #dogs aren't that bad..." ,
#   user_id: 2 ,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 1 ,
#   num_of_retweets: 1
#   )
#
# Tweet.create(
#   id: 94,
#   content: "yeah really @kitty you gotta relax" ,
#   user_id: 4 ,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 5 ,
#   num_of_retweets: 1
#   )
#
# Tweet.create(
#   id: 95,
#   content: "@trinity Seriously, who let you on this site?" ,
#   user_id: 5 ,
#   created_at: '2014-06-10 15:41:03 -0400',
#   updated_at: '2014-06-10 15:41:03 -0400',
#   num_of_favs: 8 ,
#   num_of_retweets: 2
#   )
#
#    Reply.create(
#     original_tweet_id: 90 ,
#     reply_tweet_id: 95 ,
#     created_at: '2014-06-10 15:41:03 -0400',
#     updated_at: '2014-06-10 15:41:03 -0400'
#     )
