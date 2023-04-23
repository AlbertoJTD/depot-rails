# The pragmatic bookshelf 📚

This is an application where you can upload your second-hand items

<p align="center">
  <img src="https://user-images.githubusercontent.com/89556233/233820005-e2d690f2-351a-4ae4-a16f-bd644e0a0923.png" width="900" height="540" style="text-align:center;">
</p>


## Minimum requirements
- Ruby 3.2.1
- Rails 7.0.4

# Libraries
- [PosgreSQL](https://www.postgresql.org/)

## Configuration
1. Create the data base and run the migrations:
```ruby
rails db:create db:migrate
```

2. Install the gems
```ruby
bundle install
```

## Start the server
After pre-configuring the application, use the following command to run the server:
```ruby
rails s
```
