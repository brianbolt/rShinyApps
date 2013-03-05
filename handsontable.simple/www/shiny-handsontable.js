

var tableInputBinding = new Shiny.InputBinding();
  $.extend(tableInputBinding, {
    find: function(scope) {
      return scope.find('.dataTable');
    },
    getValue: function(el) {

      var data_encoded = $(el).handsontable('getData');
      return JSON.stringify(data_encoded);
    },
    setValue: function(el) {
    },
    subscribe: function(el, callback) {
      $(el).on('change.tableInputBinding', function(e) { callback(); });
    },
    unsubscribe: function(el) {
      $(el).off('.tableInputBinding')
    }
  });
  Shiny.inputBindings.register(tableInputBinding);
