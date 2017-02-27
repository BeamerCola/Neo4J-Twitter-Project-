class Image 
  include Neo4j::ActiveNode
  property :url, type:String
  property :clarifai
  serialize :clarifai 
  has_one :out, :user, model_class: User
  has_one :out, :tweet, model_class: Tweet 

end
