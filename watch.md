
# vanilla - run command every second
`while :; do output=$(rspec spec/unit/services/new_onramps/**/*); clear; echo "$output"; sleep 1; done`

# watch - run command every second
`watch -c -n 1 rspec spec/unit/services/new_onramps/**/*`

# fswatch - run command whenever a file in specified paths are changed (poor man's guard)
`fswatch -r spec/unit app/services | xargs -n1 -I{} rspec spec/unit/services/new_onramps/**/*`
