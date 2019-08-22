require "yaml"
$ENG = 0
$JAP = 1 

def load_library(file_path)
  lib = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  yaml = YAML.load_file(file_path)
  
  yaml.each_pair do |meaning, emoticons|
    lib["get_meaning"][emoticons[$JAP]] = meaning
    lib["get_emoticon"][emoticons[$ENG]] = emoticons[$JAP]
  end
  
  lib
end

def get_japanese_emoticon(file_path, emoticon)
  lib = load_library(file_path)
  
  if !lib["get_emoticon"][emoticon]
    return "Sorry, that emoticon was not found"
  end
  
  lib["get_emoticon"][emoticon]
end

def get_english_meaning(file_path, emoticon)
   lib = load_library(file_path)
  
  if !lib["get_meaning"][emoticon]
    return "Sorry, that emoticon was not found"
  end
  
  lib["get_meaning"][emoticon]
end