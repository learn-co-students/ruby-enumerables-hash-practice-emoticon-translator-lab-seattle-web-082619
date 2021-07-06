#require modules here
require 'yaml'

def load_library(file_path)
  emoticons = { "get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |emotion, faces|
    eng = faces[0]
    jap = faces[1]
    emoticons["get_meaning"][jap] = emotion
    emoticons["get_emoticon"][eng] = jap
  end
  emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path)["get_emoticon"][emoticon] ? load_library(file_path)["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  load_library(file_path)["get_meaning"][emoticon] ? load_library(file_path)["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end