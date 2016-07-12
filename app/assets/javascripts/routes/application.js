MovieDB.ApplicationRoute = Ember.Route.extend({
  model: function() {
    if (window.movie_rating.id){
      return(this.store.find('rating', window.movie_rating.id));
    } else {
      return(this.store.createRecord('rating', {
        movieId: window.movie_rating.movie_id
      }));
    }
  }
});
