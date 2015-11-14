myApp.factory("Plan", function($resource) {
  return $resource("plans/:id", { id: '@id' }, {
    index:   { method: 'GET', isArray: true, responseType: 'json' },
    update:  { method: 'PUT', responseType: 'json' }
  });
})

myApp.controller("plansController", function($scope, Plan) {
  $scope.plans = Plan.index()

  $scope.addPlan = function() {
    plan = Plan.save($scope.newPlan)

    $scope.plans.push(plan)
    $scope.newPlan = {}
  }
})