# Ham-Ham Post - Message Board App

This is a Ruby-on-Rails application, built as a Phase 2 project for the Flatiron School Software Engineering Bootcamp. Best viewed in Google Chrome. Core functionality includes:
* User signup and creation
* Create message boards with a name and topic
  * Publicly listed message boards for all users to join
  * Personal boards for 1-on-1 chats
  * Personal boards where users can post anonymous (positive!) messages for each other (message vetting not yet implemented)

Key extras used:
* [Devise](https://github.com/heartcombo/devise) gem
* [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html)

### Installation and Set-up

* Fork and clone to a local machine
* Run `$ rails db:migrate` to build the database schema
* Optional: run `$ rails db:seed` to enter [Faker](https://github.com/faker-ruby/faker) generated dummy data
* Start the server with `$ rails s`.

 