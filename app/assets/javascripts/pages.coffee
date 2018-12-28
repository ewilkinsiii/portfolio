$(document).ready ->
  $('.dropdown-menu a.dropdown-toggle').on 'click', (e) ->
    $el = $(this)
    $parent = $(this).offsetParent('.dropdown-menu')
    if !$(this).next().hasClass('show')
      $(this).parents('.dropdown-menu').first().find('.show').removeClass 'show'
    $subMenu = $(this).next('.dropdown-menu')
    $subMenu.toggleClass 'show'
    $(this).parent('li').toggleClass 'show'
    $(this).parents('li.nav-item.dropdown.show').on 'hidden.bs.dropdown', (e) ->
      $('.dropdown-menu .show').removeClass 'show'
      return
    if !$parent.parent().hasClass('navbar-nav')
      $el.next().css
        'top': $el[0].offsetTop
        'left': $parent.outerWidth() - 4
    false
  return

