MovieDB.MovieRatingComponent = Ember.Component.extend({
  score: Ember.computed.alias('rating.score'),
  score_array: [1,2,3,4,5],
  click: function(event){
    this.set('score', $(event.target).val());
    this.get('rating').save();
  }
})
