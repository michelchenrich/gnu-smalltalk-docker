Object subclass: Startup [
  Startup class >> update: anAspect [
    anAspect == #returnFromSnapshot ifTrue: [
      Iliad.SwazooIliad startOn: 8080.
    ]
  ]
]
