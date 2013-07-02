class Community
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :name, type: String
  field :brief, type: String

  embeds_one :owner

  validates :name, :presence => true, :uniqueness => true

  has_and_belongs_to_many :users
  has_many :sections
  has_many :widgets
  has_many :articles
  has_many :questions  
  has_many :topics
  has_many :posts 

end