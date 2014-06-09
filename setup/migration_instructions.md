# # migration commands

# Initialize Rails App
# rails new kitter -d postgresql

# User Model
# rails g model user username name email background_photo_url profile_photo_url bio website verified:boolean location password_digest country_id:integer

# Tweet Model
# rails g model tweet content user:references
# add num_of_favs and num_of_retweets
# rails g migration add_num_of_favs_and_num_of_retweets_to_tweet num_of_favs:integer,default:0 num_of_retweets:integer, default: 0
# add avatar (paperclip gem)
# rails g migration add_avatar_to_tweet avatar
# add video_url (oembed gem)
# rails g migration add_video_url_to_tweet video_url

# Followers Self-Join Migration
# rails g migration create_followers_join_table user:references follower:references

# Blockees Self-Join Migration
# rails g migration create_blocked_users_join_table user:references blocked_user:references

# Hashtag Model
# rails g model hashtag num_of_times_used:integer content

# Hashtag Tweet Join Migration
# rails g migration create_twitter_hashtags_join_table tweet:references hashtag:references
# add default num_of_times_used value to 1
#rails g migration add_default_value_num_of_times_used_to_hasht


# Favorites Migration
# rails g migration create_favorites tweet:references user:references

# Retweets Migration
# rails g migration create_retweets tweet:references user:references

# Replies Model
# rails g model reply user:references tweet:references content
