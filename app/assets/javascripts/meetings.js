var ready = function () {
  $('#meetings-table').DataTable();
};

$(document).ready(ready);
$(document).on('page:load', ready);
