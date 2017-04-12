# awesome output with minimal fuss
# great for generating json files for openstruct fixtures for mock objects

thing = { happy: 'sad' }
JSON.pretty_generate(JSON.parse(thing.to_json))
 # => "{\n  \"happy\": \"sad\"\n}"

# ----------------
# generate pretty json fixture from something
thing = { happy: 'sad' }
JSON.pretty_generate(JSON.parse(thing.to_json))

# build basic ostruct from json
object = JSON.parse(json_string, object_class: OpenStruct)
# ----------------
