jQuery ->
  $('#myModal').modal('hide');
  
  $('.survey_details').click ->
    $link = $(this)
    $('#details_email').html($link.data('email'))
    $('#details_rating').rateit({ max: 3, value: parseInt($link.data('rating')), readonly: true })
    $('#details_comment').html($link.data('comment'))
    $('#myModal').modal('show')
