Object subclass: TodoListItem [
  | deadline title body completed |
  
  completed [
    ^completed ifNil: [false]
  ]

  completed: aBoolean [
    completed := aBoolean
  ]

  deadline [
    ^deadline ifNil: [deadline := Date today]
  ]

  deadline: aDeadline [
    deadline := aDeadline
  ]

  body [
    ^body ifNil: ['']
  ]

  body: aString [
    body := aString
  ]

  title [
    ^title ifNil: ['']
  ]

  title: aString [
    title := aString
  ]
]
