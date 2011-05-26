#!/bin/env ruby

filepath = "test1/test1 Previews.lrdata/0/0BBE/0BBEE255-DB9D-4090-B54F-6BBF93BB509D-07cc63f155500a902b21fef7be6585b5.lrprev"

# Header format 
# AgHg\x00 \x00\x00\x00\x00\x00\x00\x00\x00\x01\xDD\x00\x00\x00\x00\x00\x00\x00\x03header\x00\x00pyramid = {\n\tcolorProfile = \"AdobeRGB\",\n\tcroppedHeight = 1600,\n\tcroppedWidth = 2560,\n\tdigest = \"07cc63f155500a902b21fef7be6585b5\",\n\tfileTimeStamp = 308435085,\n\tformatVersion = 3,\n\tlevels = {\n\t\t{\n\t\t\theight = 57,\n\t\t\twidth = 90,\n\t\t},\n\t\t{\n\t\t\theight = 113,\n\t\t\twidth = 180,\n\t\t},\n\t\t{\n\t\t\theight = 225,\n\t\t\twidth = 360,\n\t\t},\n\t\t{\n\t\t\theight = 450,\n\t\t\twidth = 720,\n\t\t},\n\t\t{\n\t\t\theight = 900,\n\t\t\twidth = 1440,\n\t\t},\n\t},\n\tquality = \"standard\",\n\tuuid = \"0BBEE255-DB9D-4090-B54F-6BBF93BB509D\",\n}\n\x00\x00\x00AgHg\x00

#contents = open(filename, "rb") { |io|
#   io.read
#}
