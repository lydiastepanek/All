PostApp.Views.PostForm = Backbone.View.extend({
  tagName: 'form',
  template: _.template("<h1><%= post.isNew() ? 'New Post' : 'Edit Post' %></h1><label for='title'>Title</label><br><input type='text' name='title' id='title' value='<%= post.escape('title') %>'><br><label for='body'>Body</label><br><textarea name='body' id='body'><%= post.escape('body') %></textarea><br><button>Submit</button><a href='#/'>Back</a>"),

  initialize: function() {
    this.listenTo(this.model, 'add change:title remove reset', this.render)
  },

  render: function() {
    content = this.template({post: this.model})
    this.$el.html(content)
    return this;
  },

  events: {
    "click button": "submit"
  },

  submit: function () {
    var attrs = this.$el.serializeJSON();
    this.model.set(attrs)
    var model = this.model;
    var collection = this.collection;
    model.save({}, {
      success: function () {
        collection.add(model)
        Backbone.history.navigate('', {trigger: true})
      }
    })
  }


});
