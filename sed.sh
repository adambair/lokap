
# Remove hosts from ~/.ssh/config
#   sed multiline is '//,+<lines>d'
#   , -> separate command
#   d -> delete

sed "/Host\s172.104.23.81.*/,+3d" ~/.ssh/config
