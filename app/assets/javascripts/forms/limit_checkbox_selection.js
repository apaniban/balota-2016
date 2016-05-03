var forms = forms || {};

forms.limit_checkbox_selection = (function() {
  var checkbox = "input[type='checkbox']";
  var availableCount = ".availableCount";
  //move to data-limit;
  var limit = 12;

  var limit_checkbox = function() {
    $(checkbox).on('change', function(e) {
      if ($(checkbox + ':checked').length >= limit) {
        this.checked = false;
      }
    });
  };

  return {
    init: function() {
      limit_checkbox();
    }
  }
}());
