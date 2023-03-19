class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time
  belongs_to :camper
  belongs_to :activity
end
