# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
#...
Product.create!(title: 'Build Chatbot Interactions',
  description:
    %{<p>
      <em>Responsive, Intuitive Interfaces with Ruby</em>
      The next step in the evolution of user interfaces is here.
      Chatbots let your users interact with your service in their
      own natural language. Use free and open source tools along
      with Ruby to build creative, useful, and unexpected interactions
      for users. Take advantage of the Lita framework’s step-by-step
      implementation strategy to simplify bot development and testing.
      From novices to experts, chatbots are an area in which everyone
      can participate. Exercise your creativity by creating chatbot
      skills for communicating, information, and fun.
      </p>},
  image_url: 'calculating.png',
  price: 20.00)

Product.create!(title: 'The amazing spider-man',
  description:
    %{<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
      Eligendi error impedit molestiae, officiis alias consequatur! Beatae,
      quis fugiat ad porro repudiandae, nisi qui nobis asperiores
      exercitationem quibusdam quidem, provident itaque.
    </p>},
  image_url: 'spiderman.png',
  price: 19.99)

Product.create!(title: 'How to train your dog?',
  description:
    %{<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
      Eligendi error impedit molestiae, officiis alias consequatur! Beatae,
      quis fugiat ad porro repudiandae, nisi qui nobis asperiores
      exercitationem quibusdam quidem, provident itaque.
      </p>},
  image_url: 'perro.png',
  price: 19.99)

Product.create!(title: 'To the infinity and beyond',
  description:
    %{<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
      Eligendi error impedit molestiae, officiis alias consequatur! Beatae,
      quis fugiat ad porro repudiandae, nisi qui nobis asperiores
      exercitationem quibusdam quidem, provident itaque.
    </p>},
    image_url: 'astronauta.png',
    price: 25.50)

Product.create!(title: 'Mathematics',
  description:
    %{<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
      Eligendi error impedit molestiae, officiis alias consequatur! Beatae,
      quis fugiat ad porro repudiandae, nisi qui nobis asperiores
      exercitationem quibusdam quidem, provident itaque.
      </p>},
    image_url: 'calculating.png',
    price: 25.50)