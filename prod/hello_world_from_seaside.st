Seaside.WAComponent subclass: HelloWorldFromSeaside [
  HelloWorldFromSeaside class >> initialize [
    self registerAsApplication: 'hello'.
  ]

  HelloWorldFromSeaside class >> canBeRoot [
    ^ true. 
  ]

  renderContentOn: html [
    html heading: 'Hello World from GNU Smalltalk Seaside! :D'.
  ]
]
