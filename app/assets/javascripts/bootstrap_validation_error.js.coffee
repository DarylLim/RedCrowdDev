$(document).ready ->
  for elem in $("form .error")
    do (elem) =>
      $(elem).closest(".form-group").addClass('has-error')
  for elem in $("form .has-error")
    do (elem) =>
      tab_id = $(elem).closest(".tab-pane").attr("id")
