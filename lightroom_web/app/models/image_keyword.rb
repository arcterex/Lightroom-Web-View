class ImageKeyword

  include DataMapper::Resource

  storage_names[:default] = "AgLibraryKeywordImage"
  property :id, Serial, :field => "id_local"
  property :image_id, Integer, :field => "image"
  property :keyword_id, Integer, :field => "tag"
  belongs_to :image
  belongs_to :keyword

end
