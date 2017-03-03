require 'algorithmia'
require 'json'

class User
  include Neo4j::ActiveNode
  #has_many :tweets
  property :uid, type: String
  property :username, type: String
 
  #method fetch that takes in username, fetc
  def fetch(username)
    tweets = $twitter.user_timeline(username, count: 2)
    tweets.each do |tweet|
      input = {
        document: tweet.text
      }
      client = Algorithmia.client('simfbN8P4yYea9DAJza5vcPSp811')
      algo = client.algo('nlp/SentimentAnalysis/1.0.3')
      sentiment = algo.pipe(input).result
      json_sent = JSON.parse(sentiment[0].to_json)

      algo_2 = client.algo('nlp/AutoTag/1.0.1')
      topics = algo_2.pipe(tweet.text).result
      Tweet.create(user: self,uid: tweet.id, text: tweet.text, sentiment: json_sent["sentiment"], topics: topics )
    end
  end




end
