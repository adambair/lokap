# Note re: default/primary relationships
# 
# Do not flag the related object, it shouldn't care about if it's primary
# The parent entity is what cares about who it has as primary
# The user is just a user
# Primary is a idea of the Company, the user shouldn't care about it. It would know too much.
# Instead, add primary_admin_id to the parent object and keep the logic in the appropriate place
# All the logic is simplified, no flags to set, no whatevers.first, just thing.primary_admin
# 
# # admin: boolean
# # company_id: integer
# class User < AR::Base
#   belongs_to :company
# end
# 
# # primary_admin_id
# class Comany < AR::Base
#   has_many :users
#   has_many :admins, through :users, -> { where(admin: true) }
# 
#   has_one :primary_admin, class_name: User
#     # primary_admin_id
# 
# end
# 
