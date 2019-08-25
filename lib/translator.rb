require "yaml"

def load_library(file_path)
  translated = {}
    emoticons = YAML.load_file(file_path)
    emoticons.each do |k, v|
      if translated["get_meaning"] == nil
        translated["get_meaning"] = { "#{v[1]}" => k }
      end
      if translated["get_emoticon"] == nil
        translated["get_emoticon"] = { "#{v[0]}" => v[1] }
      end
      if translated["get_meaning"]
        translated["get_meaning"][v[1]] = k
      end
      if translated["get_emoticon"]
        translated["get_emoticon"][v[0]] = v[1]
      end
    end
  return translated
end


def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_emoticon"][emoticon]
    return emoticons["get_emoticon"][emoticon]
  end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_meaning"][emoticon]
    return emoticons["get_meaning"][emoticon]
  end
    return "Sorry, that emoticon was not found"
end
