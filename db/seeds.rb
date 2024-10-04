# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.create([
              { title: 'The Catcher in the Rye', content: 'A story about teenage rebellion and identity.' },
              { title: 'To Kill a Mockingbird', content: 'A novel about racial injustice in the Deep South.' },
              { title: '1984', content: 'A dystopian novel about totalitarianism and surveillance.' },
              { title: 'Pride and Prejudice', content: 'A classic romance novel by Jane Austen.' },
              { title: 'Moby-Dick', content: 'A story of Captain Ahab’s obsessive quest to kill the white whale.' },
              { title: 'The Great Gatsby', content: 'A novel that critiques the American Dream during the Jazz Age.' }
            ])
