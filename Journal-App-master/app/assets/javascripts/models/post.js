// function () {
//   if (typeof JournalApp === "undefined") {
//     window.JournalApp = {};
//   }
// }

  JournalApp.Models.Post = Backbone.Model.extend({
    urlRoot: "posts"

  });
