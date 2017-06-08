# generate pretty json fixture from something
thing = { happy: 'sad' }
JSON.pretty_generate(JSON.parse(thing.to_json))

# build basic ostruct from json
object = JSON.parse(json_string, object_class: OpenStruct)
