class Tweet 
  include Neo4j::ActiveNode
  property :user, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime
  


end
