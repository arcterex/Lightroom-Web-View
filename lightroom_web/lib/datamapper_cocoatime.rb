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