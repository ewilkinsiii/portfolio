jQuery ->
  $('#blog_topic_name').autocomplete
    source: $('#blog_topic_name').data('autocomplete-source')
    
 $(document).on 'turbolinks:load', ->
    simplemde = new SimpleMDE()
