Iliad.ILApplication subclass: HelloWorldFromIliad [
  HelloWorldFromIliad class >> path [
    ^'hello'.
  ]

  index [
    <category: 'controllers'>
    ^[ :e | e h1: 'Hello World from GNU Smalltalk Iliad! :D'. ].
  ]
]
