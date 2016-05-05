var forms = forms || {};

forms.limit_checkbox_selection = (function() {
  var checkbox = "input[type='checkbox']";
  var availableCount = ".availableCount";
  //move to data-limit;
  var limit = 12;

  var limit_checkbox = function() {
    $(checkbox).on('change', function(e) {
      if ($(checkbox + ':checked').length > limit) {
        this.checked = false;
      } else {
        var count = parseInt($('.votesLeftCount').text());
        if ($(this).is(':checked')) {
          $('.votesLeftCount').text(--count);
        } else {
          $('.votesLeftCount').text(++count);
        }
      }
    });
  };

  return {
    init: function() {
      limit_checkbox();
    }
  }
}());
