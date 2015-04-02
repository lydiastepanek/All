window.PostApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    PostApp.posts = new PostApp.Collections.Posts;
    new PostApp.Routers.Router({$rootEl: $("#content")});
    Backbone.history.start();
  }
};

Function.prototype.myBind = function myBind (context) {
  args = [].slice.call(arguments,1)
  fn = this;
  return function () {
    args2 = [].slice.call(arguments)
    return fn.apply(context, args.concat(args2))
  }
};

JSA = {};

JSA.myCall = function (fn, obj) {
  args = [].slice.apply(arguments,[2])
  return fn.apply(obj, args)
};

JSA.myCurry = function (fn, obj, numArgs) {
  arr = []

  var curry = function(arg) {
    arr.push(arg);
    if (arr.length === numArgs) {
      return fn.apply(obj, arr)
    } else {
      return curry
    };
  }

  return curry
};
