Iliad.ILApplication subclass: TodoListApplication [
  | todoListGridWidget |
  
  TodoListApplication class >> path [
    ^'todo'
  ]

  selectCompleted [
    self todoListGridWidget selectBlock: [:item | item completed].
    self todoListGridWidget markDirty
  ]

  selectPending [
    self todoListGridWidget selectBlock: [:item | item completed not].
    self todoListGridWidget markDirty
  ]

  todoListGridWidget [
    ^todoListGridWidget ifNil: [todoListGridWidget := TodoListWidget new]
  ]

  initialize [
    super initialize.
    self model: Repository default
  ]

  updateFromHash [
    | path |
    path := self router hashRoute next.
    path = 'pending' ifTrue: [self selectPending].
    path = 'completed' ifTrue: [self selectCompleted] 
  ]

  updatePage: aPage [
    super updatePage: aPage.
    aPage head stylesheet href: '/stylesheets/iliad.css'
  ]

  index [
    <category: 'controllers'>
    self updateFromHash.
    ^self mainContents
  ]

  mainContents [
    ^[:e |
       e div 
       class: 'wrapper';
       build: [:div |
                div h1: 'Todo List'.
                div build: self actionLinksContents.
                div build: self todoListGridWidget]]
  ]

  actionLinksContents [
    ^[:e | |div|
       div := e div class: 'selection'; yourself.
       div a
       action: [self selectPending]
       hash: 'pending';
       text: 'pending'.
       div space.
       div a
       action: [self selectCompleted]
       hash: 'completed';
       text: 'completed'.
       e br]
  ]
]
