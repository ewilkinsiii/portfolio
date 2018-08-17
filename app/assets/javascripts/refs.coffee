$("#like_<%= ref.slug %>").removeClass('heart-empty’).addClass(‘heart');
$("#like_<%= ref.slug %>").attr("href", '/refs/<%= ref.slug %>/unlike');
$("#likes_<%= ref.slug %>").html("<%= j (render partial: 'refs/likes', locals: { ref: ref } ) %>");
ready = undefined
set_positions = undefined

set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  
ready = -> 
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: '/refs/sort'
      data: order: updated_order
    return
  return
$(document).ready ready