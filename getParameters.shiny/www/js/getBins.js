// return a parameter value from the current URL
function getParam ( sname )
{
  var params = location.search.substr(location.search.indexOf("?")+1);
  var sval = "";
  params = params.split("&");
    // split param and value into individual pieces
    for (var i=0; i<params.length; i++)
       {
         temp = params[i].split("=");
         if ( [temp[0]] == sname ) { sval = temp[1]; }
       }
  return sval;
}

var binsBinding = new Shiny.InputBinding();
$.extend(binsBinding, {
  find: function(scope) {
    return $(scope).find(".n_breaks");
  },
  getValue: function(el) {
    return $(el).val();
  },
  setValue: function(el, value) {
    $(el).val(value);
  },
  subscribe: function(el, callback) {
  	$(el).val(getParam("bins"));
  	$(el).trigger("change");
  	callback();
  },
  unsubscribe: function(el) {
    $(el).off(".binsBinding");
  }
});

Shiny.inputBindings.register(binsBinding);
