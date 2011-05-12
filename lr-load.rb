#!/usr/bin/env ruby
require 'rubygems'
require 'datamapper'
require 'awesome_print'

# Time calculations
# ruby-1.9.2-p180 :029 > Time.at(Time.utc(2001).to_i + 326262250.793305).utc
# => 2011-05-05 04:24:10 UTC 

# load the source
# Normally would be in /Users/<user>/Pictures/Lightroom/<catalogname>/<catalogname>.lrcat
File_path = File.expand_path('../test1/test1.lrcat',__FILE__)

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite://#{File_path}")

module DataMapper
   class Property
      class CocoaTime < Float
         OFFSET = ::Time.utc(2001).to_f
         def load(value)
            ::Time.at(OFFSET + value.to_f)
         end
         def dump(value)
           value.to_f - OFFSET
         end
      end
   end
end

class Image
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

   # Return the preview path for an image based on the global id
   # [alan:~/Pictures/test1/test1 Previews.lrdata/D/DF42]$ ll
   # total 24
   # -rw-r--r--  1 alan  staff  9904 25 Oct  2010 DF42FC27-1CEA-4A6C-889A-81A18733B6E6-07cc63f155500a902b21fef7be6585b5.lrprev
   # [alan:~/Pictures/test1/test1 Previews.lrdata/D/DF42]$ pwd
   # /Users/alan/Pictures/test1/test1 Previews.lrdata/D/DF42
   def preview_image_path
      
   end
end

class ImageKeyword
   include DataMapper::Resource
   storage_names[:default] = "AgLibraryKeywordImage"
   property :id, Serial, :field => "id_local"
   property :image_id, Integer, :field => "image"
   property :keyword_id, Integer, :field => "tag"
   belongs_to :image
   belongs_to :keyword
end

class Keyword
   include DataMapper::Resource
   storage_names[:default] = "AgLibraryKeyword"
   property :id, Serial, :field => "id_local"
   property :name, String #, :field => "name"
   has n, :image_keywords
end

puts Image.count
Image.all(:order => :capturetime.asc).each { |x| 
#   p x.touchtime.class
##   x.update( :touchtime => Time.now )
#   x.update( :pick => 1 )
#   p x.errors
#   x.reload
#   p x.touchtime
##   p x.keywords.map { |k| 
#      k.name
#   }
#   p x.pick
#   x.update(:pick => -1)
   # Display image properties for each image
   awesome_print x
   awesome_print x.keywords
}

__END__
