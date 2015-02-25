var timeFormatter = function () {

  $('time').each(function (index) {
    var formatted = moment( new Date($(this).html() ) ).fromNow();
    $(this).html(formatted);
  });

};
