$ ->
  $('#button').click ->
    event_id = $('#event_id').val()
    if !event_id.trim()
      return
    $.post('/relationships',
      event:
        event_id: event_id,
    ).success (resp) ->
      console.log(resp)

#      div_comment = $('<div>', { class: 'comment'})
#      comment_text = "<h4>#{resp.comment.content}</h4> <p>#{resp.user_mail}</p> <p>#{resp.comment.created_at}</p>  "
#      div_comment.html(comment_text)
#      comments = $('#comments')
#      $(div_comment).appendTo(comments)
#      $('#comment_content').val('')
#    .error (resp) ->
#      alert('error')