# Features, Products, Plans, Subscriptions, Subscribers
#
#
# feature a                           subscription -> subscriber
#          \                         /
# feature b -> product a -> plan a -> subscription -> subscriber
#          /               \         \
# feature c                 plan b    subscription -> subscriber
#          \                      \
#           \                      -> subscription -> subscriber
#            \
#              product b -> plan c -> subscription -> subscriber
#
#                                     subscription -> subscriber
#                                    /
# feature d -> product c -> plan d -> subscription -> subscriber
#          /                         \
# feature e                           subscription -> subscriber
#          \
#           -> product d -> plan e -> subscription -> subscriber
#
#                                     subscription -> subscriber
#                                    /
# feature f -> product e -> plan d -> subscription -> subscriber
#                                    \
#                                     subscription -> subscriber
#
#
