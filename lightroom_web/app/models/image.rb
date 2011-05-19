class Image
  require Rails.root.join("lib/datamapper_cocoatime")
  include DataMapper::Resource

  storage_names[:default] = "Adobe_images"
  
  property :id, Serial, :field => "id_local"
  property :global_id, UUID, :field => "id_global"
  property :pick, Integer, :field => "pick"
  property :rating, Integer, :field => "rating"
  property :touchtime, CocoaTime, :field => "touchtime"
  property :capturetime, DateTime, :field => "capturetime"
  has n, :image_keywords
  has n, :keywords, :through => :image_keywords
  before :save do
     self.touchtime = Time.now
  end
  


end
