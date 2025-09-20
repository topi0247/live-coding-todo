env_seed_file = Rails.root.join("db", "seeds", "#{Rails.env.downcase}.rb")
load env_seed_file if File.exist?(env_seed_file)
