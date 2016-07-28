class Usertw < ActiveRecord::Base
  # Remember to create a migration!
  validates :user,  uniqueness: true
  has_many :tweets

  def cliente(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "nfPgdwQB4sscL3tVQb9R2HQVk"
      config.consumer_secret     = "AXvAEzEHYjxNS1U3uI6O78Ts7QHnAR6EnXeBZx3fWcKtjuSxhs"
      config.access_token        = self.access_token
      config.access_token_secret = self.access_token_secret
    end
  client.update(tweet)
  end


  def tweet_later(text,num)
    # tweet = # Crea un tweet relacionado con este usuario en la tabla de tweets
    # user = Usertw.find_by(user: session[:name])
    # tweet = user.cliente(text)
    tweet = Tweet.create(tweet: text, usertw_id: self.id)
    # Este es un método de Sidekiq con el cual se agrega a la cola una tarea para ser
    # 
    # id_job = TweetWorker.perform_async(tweet.id)
    jid = TweetWorker.perform_in(num.seconds,tweet.id)
    #La última linea debe de regresar un sidekiq job id
    tweet.update(job_id: jid)
  end

end


