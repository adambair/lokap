
# HTTP Resource Routing for REST APIs

## Single Resource

C create  POST    /resources     -> create  -> create single resource
R read    GET     /resource/:id  -> show    -> show single resource
U update  PUT     /resource/:id  -> update  -> update single resource
D destroy DELETE  /resource/:id  -> destroy -> delete single resource
I index   GET     /resources     -> index   -> show all resources

## Nested Resource

C create  POST    /thing/:thing_id/resources     -> create  -> create single resource
R read    GET     /thing/:thing_id/resource/:id  -> show    -> show single resource
U update  PUT     /thing/:thing_id/resource/:id  -> update  -> update single resource
D destroy DELETE  /thing/:thing_id/resource/:id  -> destroy -> delete single resource
I index   GET     /thing/:thing_id/resources     -> index   -> show all resources

## Add-to/Remove-from Resource

PUT       /resource/:resource_id/things/:id  -> add thing to resource
DELETE    /resource/:resource_id/things/:id  -> remove thing to resource

## Flagging Resources

PUT       /resource/:id/secure            -> secure a resource
DELETE    /resource/:id/secure            -> unsecure a resource

NOTES:

- status fields should always be lowercase
