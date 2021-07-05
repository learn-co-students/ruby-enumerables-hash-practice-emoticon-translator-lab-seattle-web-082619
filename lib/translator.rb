# require modules here
require "yaml"
require 'pry'

def load_library(yaml)
  emoticons = YAML.load_file(yaml)
  emoticon_keys = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  emoticons.each do |(keys, values)|
    emoticon_keys[:get_meaning][values[1]] = keys #(japanese emote => meaning)
    emoticon_keys[:get_emoticon][values[0]] = values[1] #(english emote => japanese emote)
  end #emoticons.each
  return emoticon_keys
end

def get_japanese_emoticon(yaml, emote)
  emoticon_keys = load_library(yaml)

  if emoticon_keys[:get_emoticon].keys.include?(emote)
    return emoticon_keys[:get_emoticon][emote]
  else
    return "Sorry, that emoticon was not found"
  end #if
end

def get_english_meaning(yaml, jemote)
  emoticon_keys = load_library(yaml)
  if emoticon_keys[:get_meaning].keys.include?(jemote)
    return emoticon_keys[:get_meaning][jemote]
  else
    return "Sorry, that emoticon was not found"
  end #if
end
