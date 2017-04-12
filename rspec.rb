# http://www.rubydoc.info/github/rspec/rspec-expectations/RSpec%2FMatchers:aggregate_failures

# Allows multiple expectations in the provided block to fail, and then aggregates them into a single exception, rather than aborting on the first expectation failure like normal. This allows you to see all failures from an entire set of expectations without splitting each off into its own example (which may slow things down if the example setup is expensive).

aggregate_failures("verifying response") do
  expect(response.status).to eq(200)
  expect(response.headers).to include("Content-Type" => "text/plain")
  expect(response.body).to include("Success")
end

