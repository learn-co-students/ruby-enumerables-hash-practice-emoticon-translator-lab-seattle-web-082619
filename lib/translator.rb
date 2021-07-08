require "yaml"
$ENG = 0
$JAP = 1 

def load_library(file_path)
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  yaml = YAML.load_file(file_path)
  
  yaml.each_pair do |meaning, emoticons|
    library["get_meaning"][emoticons[$JAP]] = meaning
    library["get_emoticon"][emoticons[$ENG]] = emoticons[$JAP]
  end
  
  library
end

def get_japanese_emoticon(file_path, emoticon)
  search(load_library(file_path), "get_emoticon", emoticon)
end

def get_english_meaning(file_path, emoticon)
  search(load_library(file_path), "get_meaning", emoticon)
end

def search(library, search_type, search_value)
  result = library[search_type][search_value]
  result ? result : "Sorry, that emoticon was not found"
end