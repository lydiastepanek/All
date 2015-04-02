JournalApp.Views.PostForm = Backbone.View.extend({

  template: JST['post_form'],

  events: {
    'submit #edit-post': "submitForm"
  },

  initialize: function(post) {
    this.model = post;
    this.model.fetch({});
    this.listenTo(this.model, "sync", this.render)
  },

  render: function () {
    var content = this.template({post: this.model});
    this.$el.html(content);
    return this;
  },

  submitForm: function () {
    event.preventDefault();
    var formData = $(event.target).serializeJSON();
    this.model.save(formData, {
      success: function () {
        Backbone.history.navigate("", {trigger: true})
      }, error: function (model, errors) {
        console.log(errors.responseJSON)
        this.$el.append(errors.responseJSON);
      }.bind(this)
    });
  }

})
