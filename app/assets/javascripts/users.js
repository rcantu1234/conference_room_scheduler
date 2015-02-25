var ready = function () {
  timeFormatter();
  $('#user-table').DataTable();
};

$(document).ready(ready);
$(document).on('page:load', ready);
