angular.module('fosjsrouting', []).filter('routing', [
  '$routing', function($routing) {
    return function(route, params, absolute) {
      return $routing.generate(route, params, absolute);
    };
  }
]).provider('$routing', [
  '$log', function($log) {
    var Router, defaultParams;
    defaultParams = {};
    this.setDefaultParams = function(params) {
      return angular.extend(defaultParams, params);
    };
    Router = (function() {
      var _class;

      function Router() {
        return _class.apply(this, arguments);
      }

      _class = Router.defaultParams;

      Router.prototype.generate = function(route, params, absolute) {
        if (typeof Routing === 'undefined' || typeof Routing.generate === 'undefined') {
          $log.error('Cannot generate Symfony2 route. Routing component is not defined.');
          return '';
        }
        return Routing.generate(route, angular.extend(this.defaultParams, params), absolute);
      };

      return Router;

    })();
    return this.$get = function() {
      return new Router(defaultParams);
    };
  }
]);
