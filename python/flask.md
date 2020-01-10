https://stackoverflow.com/questions/15974730/how-do-i-get-the-different-parts-of-a-flask-requests-url/46176337#46176337

request:

curl -XGET http://127.0.0.1:5000/alert/dingding/test?x=y

then:

request.method:              GET
request.url:                 http://127.0.0.1:5000/alert/dingding/test?x=y
request.base_url:            http://127.0.0.1:5000/alert/dingding/test
request.url_charset:         utf-8
request.url_root:            http://127.0.0.1:5000/
str(request.url_rule):       /alert/dingding/test
request.host_url:            http://127.0.0.1:5000/
request.host:                127.0.0.1:5000
request.script_root:
request.path:                /alert/dingding/test
request.full_path:           /alert/dingding/test?x=y

request.args:                ImmutableMultiDict([('x', 'y')])
request.args.get('x'):       y


#  server static assets from flask-classful
#
#  /things/templates/derp.html
#  <link rel="stylesheet" href="{{ url_for('ThingsView:static', filename='css/things.css') }}">
# 
#  import os
#  from flask_classful import FlaskView, route
#  from flask import send_from_directory
# 
#  class SomethingView(FlaskView):
#      @route('/static/<path:filename>')
#      def static(self, filename):
#          path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'static')
#          return send_from_directory(path, filename)
