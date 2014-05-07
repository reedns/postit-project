module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

  def vote_total
      up_vote - down_vote
    end

  def up_vote
    self.votes.where(vote: true).size
  end

  def down_vote
    self.votes.where(vote: false).size
  end
end

#normal metaprograming
=begin 
module Voteable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      votes
    end
  end

  module InstanceMethods
    def vote_total
      up_vote - down_vote
    end

    def up_vote
      self.votes.where(vote: true).size
    end

    def down_vote
      self.votes.where(vote: false).size
    end
  end

  module ClassMethods
    def votes
      has_many :votes, as: :voteable
    end
  end
end
=end