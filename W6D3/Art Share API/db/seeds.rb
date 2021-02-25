# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create(username: 'user1')
user2 = User.create(username: 'user2')
user3 = User.create(username: 'user3')

art1 = Artwork.create(title: 'art1', image_url: 'url1', artist_id: 1)
art2 = Artwork.create(title: 'art2', image_url: 'url2', artist_id: 2)
art3 = Artwork.create(title: 'art3', image_url: 'url3', artist_id: 3)

share1 = ArtworkShare.create(artwork_id: 1, viewer_id: user1.id)
share2 = ArtworkShare.create(artwork_id: 2, viewer_id: user2.id)
share3 = ArtworkShare.create(artwork_id: 3, viewer_id: user3.id)
