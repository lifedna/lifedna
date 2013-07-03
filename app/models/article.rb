# coding: utf-8
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
  field :category, type: String

  validates :title, :body, :presence => true
  validates :category, :inclusion => {:in => %w(健康知识 就医指南 治疗交流 护理园地 用药常识), :message => "%{value} is not a valid category" }, :allow_nil => true

  belongs_to :column
  belongs_to :user
  belongs_to :community

  def hit!
    self.class.increment_counter :hits, id
  end

end