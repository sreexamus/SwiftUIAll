1. If  we mention Counter.datasource as ReservedObject then it gets created everytime Counter is created. In this case we loose the data that data source holds

2. If  we mention Counter.datasource as @StateObject then datasource object is not created fresh even though Counter is created fresh. That means Counter will hold the state of the datasource object.

3. If we mention Counter.datasource as @StateObject and instantiate datasource in the Counter that means we are creating new Datasource everytime Counter is created. then thos newly created datasource objects will be ignored, only the initial state object will be considered by Counter. It will be bug to create StateObject multiple times.


Outline: 1.Use @StateObject when Observable objected is created with in the View
 2.Use @Reserved Object if the Observable object is created outside and assigned to variable in the view