# require modules here
require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  result = {get_meaning: {}, get_emoticon: {}}
  
  result = emoticons.reduce(result) do |memo, (key, value)|
    (english_emoticon, japanese_emoticon) = value
    memo[:get_meaning][japanese_emoticon] = key
    memo[:get_emoticon][english_emoticon] = japanese_emoticon
    memo
  end
end

def get_japanese_emoticon(path, emoticon)
  load_library(path)[:get_emoticon].fetch(emoticon, "Sorry, that emoticon was not found")
end

def get_english_meaning(path, emoticon)
  load_library(path)[:get_meaning].fetch(emoticon, "Sorry, that emoticon was not found")
end