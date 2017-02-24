class Comment 
  include Neo4j::ActiveNode
  property :body, type: String

  has_one :out, :post, type: :comments_on

end
