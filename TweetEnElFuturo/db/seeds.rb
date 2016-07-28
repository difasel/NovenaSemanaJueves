user = Usertw.create(user: "Ivan")
tweet = Tweet.create(tweet: "Esto es una prueba")
user.tweets << tweet