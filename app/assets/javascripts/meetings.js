var ready = function () {
  $('#posts-table').DataTable();
};

$(document).ready(ready);
$(document).on('page:load', ready);
