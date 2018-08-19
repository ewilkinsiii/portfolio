$("#like_<%= ref.slug %>").removeClass('heart-empty’).addClass(‘heart');
$("#like_<%= ref.slug %>").attr("href", '/refs/<%= ref.slug %>/unlike');
$("#likes_<%= ref.slug %>").html("<%= j (render partial: 'refs/likes', locals: { ref: ref } ) %>");