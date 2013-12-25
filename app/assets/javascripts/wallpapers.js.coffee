$ ->
  if $('body.wallpapers.show').length == 1
    $imgWallpaper = $('.img-wallpaper')

    $imgWallpaper.click ->
      $this = $(this)
      if $this.is('.state-1')
        $this.removeClass('state-1')
        $this.addClass('state-2')
      else
        $this.removeClass('state-2')
        $this.addClass('state-1')

  if $('body.wallpapers.index, body.collections.show, body.users.show').length == 1
    applyLazyLoad = ->
      $('.list-wallpaper .img-wallpaper.lazy:not(.lazy-loaded)').each ->
        $this = $(this)
        $this.addClass('lazy-loaded')
        $this.on 'load', ->
          $this.addClass 'lazy-show'
        $this.one 'inview', =>
          $this.attr('src', $this.data('src'))

    loadNextPage = (event, visible) ->
      return unless visible
      $this = $(this)
      url = $this.attr 'href'
      $this.unbind 'inview'
      $this.replaceWith('<hr /><div class="loading" />')
      $.get url, (html) ->
        $main = $('#main')
        $main.find('.loading').remove()
        $main.append(html)
        applyLazyLoad()
        $('[rel=next]').bind('inview', loadNextPage)
      window.analytics.page(null, null, { path: url })

    applyLazyLoad()
    $('[rel=next]').bind('inview', loadNextPage)

    # Favourite action
    $('body').on 'click', '[data-action=like]', (event) ->
      $this = $(this)
      $this.on 'ajax:success', (event, data, status, xhr) ->
        $this.find('span.count').text data.count
        if data.favourite
          $this.addClass 'btn-success'
          window.analytics.track('Favourited a wallpaper')
        else
          $this.removeClass 'btn-success'
          window.analytics.track('Unfavourited a wallpaper')
      $this.on 'ajax:error', (event, xhr, status, error) ->
        # alert error
        Wallgig.Utilities.alert 'Error!', error
      $this.on 'ajax:complete', (event, xhr, status) ->
        Ladda.stopAll()

  if $('.btn-group-purity').length
    Ladda.bind '.btn-group-purity .btn'
    $this = $(this)
    $this.on 'ajax:success', (event, data, status, xhr) ->
      $("[data-action=change-purity][data-wallpaper-id=#{ data.id }]")
        .removeClass 'btn-active'
      $("[data-action=change-purity][data-wallpaper-id=#{ data.id }][data-purity=#{ data.purity }]")
        .addClass 'btn-active'
      window.analytics.track('Changed wallpaper purity')
    $this.on 'ajax:error', (event, xhr, status, error) ->
      # alert error
      Wallgig.Utilities.alert 'Error!', xhr.responseText || error
    $this.on 'ajax:complete', (event, xhr, status) ->
      Ladda.stopAll()

  if $('#wallpaper_tag_list').length
    $tagList = $('#wallpaper_tag_list')
    $tagList.tagsinput()
    $tagList.tagsinput('input').typeahead
      name: 'tags'
      prefetch: $tagList.data('prefetch-path')