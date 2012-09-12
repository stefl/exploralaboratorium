class Idea
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :name, :type => String
  field :email, :type => String
  field :title, :type => String
  field :description, :type => String
  field :sponsor, :type => String
end
