class Keyword

  include DataMapper::Resource
  storage_names[:default] = "AgLibraryKeyword"
  property :id, Serial, :field => "id_local"
  property :name, String #, :field => "name"
  has n, :image_keywords

end
