MovieDB.MovieRatingComponent = Ember.Component.extend({
  rating: Ember.computed.alias('targetObject.content'),
  click: function(event){
    this.set('score', $(event.target).val());
    }
})
