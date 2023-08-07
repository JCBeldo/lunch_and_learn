class RecipeSerializer
  include JSONAPI::Serializer

  set_type :recipe
  set_id :id
  attributes  :title,
              :url,
              :country,
              :image
end
