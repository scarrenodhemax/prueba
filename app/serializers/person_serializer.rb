class PersonSerializer < ActiveModel::Serializer
  attributes  :nationalId, :name, :lastName, :age, :originPlanet, :pictureUrl
end
