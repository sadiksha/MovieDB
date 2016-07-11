MovieDB.MovieRatingComponent = Ember.Component.extend({
  rating: Ember.computed.alias('targetObject.content'),
  score: 0,
  click: function(event){
    this.set('score', $(event.target).val());
    }
})
