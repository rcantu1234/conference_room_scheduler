var ready = function () {
  timeFormatter();
  $('#meetings-table').DataTable();
};

$(document).ready(ready);
$(document).on('page:load', ready);
