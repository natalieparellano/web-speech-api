require 'yaml'
require 'pry'

PROPERTIES = YAML.load_file("properties.yml")
TRANSITIONS = YAML.load_file("transitions.yml")
MOVES = YAML.load_file("moves.yml")

speed = ARGV[0]

def get_property(name)
  PROPERTIES.detect{ |p| p["name"] == name }
end

def new_item_from(list)
  item = list.sample.dup

  item["phrase"] = "#{item["name"]}"
  return item unless item["properties"]

  item["properties"].each do |hash|
    name = hash.first[0]
    p_info = get_property(name)
    new_value = p_info["values"].sample
    hash[name] = new_value

    next unless hash[name] # skip if the property is 'false'
    next unless p_info["phrase"] # stall and turn at the same time
    item["phrase"] += ", #{p_info["phrase"]}" % hash[name]
  end

  return item
end

while true do
  transition = new_item_from(TRANSITIONS)
  phrase = "Now"

  new_move = rand(2)
  if new_move == 1
    move = new_item_from(MOVES)
    phrase += ", to move into #{move["phrase"]}"
  end

  phrase += ", #{transition["phrase"]}"

  puts "phrase: #{phrase}"
  `say #{phrase}`

  sleep(speed.to_i)
end
