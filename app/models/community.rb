class Community
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :name, type: String
  field :subdomain, type: String
  field :brief, type: String

  embeds_one :owner

  validates :name, :subdomain, :presence => true, :uniqueness => true

  has_and_belongs_to_many :users
  has_many :sections
  has_many :widgets
  has_many :articles
  has_many :questions  
  has_many :polls
  has_many :topics
  has_many :posts 

  def activities
    Activity.where(target_object:{"id" => self.id, "type"=>"Community"})
  end

  def the_owner
    User.find_by(id: self.owner.id)
  end
end