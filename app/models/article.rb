class Article
  include Mongoid::Document	
  include Mongoid::Timestamps
  include Mongoid::TaggableWithContext

  include Mongoid::TaggableWithContext::AggregationStrategy::MapReduce

  taggable

  field :title, type: String
  field :body, type: String
  field :hits, type: Integer, :default => 0
  field :sticky, type: Boolean, :default => false
  field :locked, type: Boolean, :default => false
  # field :posts_count, type: Integer, :default => 0
  field :category, type: Integer

  validates :title, :body, :presence => true

  belongs_to :column
  belongs_to :user
  belongs_to :community

  def hit!
    self.class.increment_counter :hits, id
  end

end