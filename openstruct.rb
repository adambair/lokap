# generate pretty json fixture from something
thing = { happy: 'sad' }
JSON.pretty_generate(JSON.parse(thing.to_json))

# build basic ostruct from json
object = JSON.parse(json_string, object_class: OpenStruct)


# Cheapass fixture support
# spec/support/ostruct_fixture.rb
#
def ostruct_fixture(fixture_path)
  fixture = Rails.root.join('spec/fixtures', "#{fixture_path}")
  JSON.parse(File.read(fixture), object_class: OpenStruct)
end

# in your specs
let(:event) { ostruct_fixture('stripe_event/transfer_paid.json') }
subject     { described_class.new(event) }

