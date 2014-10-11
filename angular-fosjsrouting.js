angular.module('fosjsrouting', []).
  filter('routing', ['$routing', function($routing) {
    return function(route, params, absolute) {
      return $routing.generate(route, params, absolute);
    };
  }]).
  provider('$routing', function() {
    var defaultParams = {};

    Router = function (defaultParams, $log) {
      this.generate = function(route, params, absolute) {
        if (typeof Routing === 'undefined' || typeof Routing.generate === 'undefined') {
          $log.error('Cannot generate Symfony2 route. Routing component is not defined.');
          return route;
        }
        return Routing.generate(route, angular.extend(defaultParams, params), absolute);
      };
    }

    this.setDefaultParams = function (params) {
      angular.extend(defaultParams, params);
    }
      
    this.$get = ['$log', function($log) {
      return new Router(defaultParams, $log);
    }];
  });
