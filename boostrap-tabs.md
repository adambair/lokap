# Bootstrap Tabs

## Make tabs work across page reloads

coffeescript

  #= require vendor/js.cookie
  # https://github.com/js-cookie/js-cookie

  wireTabNavAnchor()

  wireTabNavAnchor = ->
    # Load correct tab based on url anchor
    hash = document.location.hash
    suffix = "-tab"
    if (hash)
      $('.nav-tabs a[href="'+hash.replace(suffix,"")+'"]').tab('show')

    # Change url anchor when changing tabs
    $('.nav-tabs a').on 'shown.bs.tab', (e) ->
      urlTab = e.target.hash + suffix
      window.location.hash = urlTab
      Cookies.set('tab', urlTab)

view

  Bootstrap tabs, nothing special

controller

  def referer_with_anchor
    request.referer + cookies[:tab]
  end
