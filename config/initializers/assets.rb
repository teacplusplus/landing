# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( bootstrap.min.css flexslider.css font-awesome.css styles.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.js jquery.easing.1.3.min.js jquery.scrollto.js jquery.flexslider.min.js jquery.stellar.js jquery.masonry.min.js waypoints.min.js waypoints-sticky.min.js jquery.countTo.js jquery.fitvids.js contact.js quattro.js respond.min.js modernizr.min.js )

