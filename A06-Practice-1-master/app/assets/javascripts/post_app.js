window.PostApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    PostApp.posts = new PostApp.Collections.Posts();
    new PostApp.Routers.Router({
      $rootEl: $("#content")
    })
    Backbone.history.start()
  }
};

Function.prototype.myBind = function myBind (context) {
  var that = this;
  var arguments1 = [].slice.call(arguments,1);
  return function () {
    var arguments2 = [].slice.call(arguments);
    return that.apply(context, arguments1.concat(arguments2));
  }
};

JSA = {};

JSA.myCall = function (fn, obj) {
  var args = [].slice.apply(arguments,[2]);
  return fn.apply(obj, args);
};

JSA.myCurry = function (fn, obj, numArgs) {
  var array = []

  var curry = function(args) {
    array.push(args)
    if (array.length === numArgs) {
      return fn.apply(obj, array);
    } else {
      return curry;
    }
  }

  return curry;
};
