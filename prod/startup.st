Object subclass: Startup [
  Startup class >> update: anAspect [
    anAspect == #returnFromSnapshot ifTrue: [
      HelloWorldFromSeaside initialize.
    ]
  ]
]
