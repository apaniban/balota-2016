var forms = forms || {};

forms.uncheck_radiobox = (function() {
  var radiobox = "input[type='radio']";

  var uncheck_radiobox = function() {
    $(radiobox).on('click', function(e) {
      var checked = $(this).attr('checked');
      var name = $(this).attr('name');

      if (checked === 'checked') {
        $(this).attr('checked', false);
      } else {
        $(this).attr('checked', true);
      }
    });
  };

  return {
    init: function() {
      uncheck_radiobox();
    }
  }

}());
