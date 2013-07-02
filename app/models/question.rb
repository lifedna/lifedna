class Question 
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :anonymous, type: Boolean, default: false
  field :category, type: Integer

  field :closed, type: Boolean, default: false
  field :closed_at, type: Time
  
  # attr_accessible :title, :body, :qa_id, :community_id

  has_many :answers
  belongs_to :user
  belongs_to :qa
  belongs_to :community

end