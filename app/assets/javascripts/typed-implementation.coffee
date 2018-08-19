(->
  ready = undefined

  ready = ->
    new Typed('.element',
      strings: [
        "Please feel free to checkout my blogs and my portfolio of Ruby on Rails applications that I've created.
         If you like what you see, you can reach me by clicking on the contact tab above."
      ]
      typeSpeed: 10)
    return

  $(document).ready ready
  $(document).on 'turbolinks:load', ready
  return
).call this