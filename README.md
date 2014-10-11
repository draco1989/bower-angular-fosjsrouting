Angular-FosJSRouting
=============

Provides AngularJS support for [FOSJsRoutingBundle](https://github.com/FriendsOfSymfony/FOSJsRoutingBundle).

Installation
-----------

Include main script in your html
    
    <script type="text/javascript" src="path/to/angular-fosjsrouting/angular-fosjsrouting.min.js"></script>
    

Usage
-----

Import `fosjsrouting` in your angular module.

```javascript
    angular.module('MyModule', ['fosjsrouting']);
```

Configure it throught `$routingProvider`

```javascript
    angular.module('MyModule', ['fosjsrouting']).
            config(function ($routingProvider) {
                $routingProvider.setDefaultParams({
                    '%user_id%': 3
                });
            });
```

This package includes AngularJS configurable filter and service/provider.

Filter
------

To generate a simple path

```html
    <a href="{{ 'my_symfony_path_name'|routing }}">Go home</a>
```

To generate a path with parameters

```html
    <a href="{{ 'hello_user_path_name'|routing:{'%user%':'David'} }}">Go home</a>
```

To generate an absolute path with parameters

```html
    <a href="{{ 'hello_user_path_name'|routing:{'%user%':'David'}:true }}">Go home</a>
```

Service
------

To generate a simple path

```javascript
    angular.module('MyModule', ['fosjsrouting']).
            controller(function ($scope, $routing) {
                $scope.path = $routing.generate('my_symfony_path_name');
            });
```

To generate a path with parameters

```javascript
    angular.module('MyModule', ['fosjsrouting']).
            controller(function ($scope, $routing) {
                $scope.path = $routing.generate('hello_user_path_name', {'%user%': 'David'});
            });
```

To generate an absolute path with parameters

```javascript
    angular.module('MyModule', ['fosjsrouting']).
            controller(function ($scope, $routing) {
                $scope.path = $routing.generate('hello_user_path_name', {'%user%': 'David'}, true);
            });
```
