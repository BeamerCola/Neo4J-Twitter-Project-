class Tweet 
  include Neo4j::ActiveNode
  property :uid, type: String
  property :text, type: String 
  property :sentiment
  property :topics 
  #property :created_at, type: DateTime
  #property :updated_at, type: DateTime
  has_one :out, :user, type: :user, model_class: :User
  #has_many :images
  serialize :topics
end


