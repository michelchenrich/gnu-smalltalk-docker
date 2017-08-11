Iliad.ILWidget subclass: TodoListWidget [
  | selectBlock dataGrid |

  addNewItem [
    | newItem |
    newItem := TodoListItem new.
    self lightbox: ((self formulaForItem: newItem) addMessage: [:e | e h2: 'Add item ', newItem title]; yourself)
         onAnswer: [:item | 
                     item ifNotNil: [self application model addItem: item.
                                     self updateDataGridItems]]
  ]

  editItem: anItem [
    self lightbox: ((self formulaForItem: anItem) addMessage: [:e | e h2: 'Edit item ', anItem title]; yourself)
  ]

  removeItem: anItem [
    self application model removeItem: anItem.
    self markDirty
  ]

  setItem: anItem completed: aBoolean [
    anItem completed: aBoolean.
    self updateDataGridItems
  ]

  updateDataGridItems [
    self dataGrid items: 
      (self items asSortedCollection: [:a :b | a deadline < b deadline])
  ]

  contents [
    ^[:e |
       self updateDataGridItems.
       e build: self dataGrid.
       e div a
       action: [self addNewItem];
       text: 'Create']
  ]

  formulaForItem: anItem [
    | formula |
    formula := ILFormula on: anItem.
    (formula dateInputOn: #deadline) label: 'Deadline'.

    (formula inputOn: #title)
      labelContents: [:e | e span class: 'required'; text: 'Title'];
      addCondition: [:val | val notNil and: [val notEmpty]]
      labelled: [:val | 'This field is required'].

    (formula textareaOn: #body)
      labelContents: [:e | e span class: 'required'; text: 'Body'];
      size: 30@10;
      addCondition: [:val | val notNil and: [val notEmpty]]
      labelled: [:val | 'This field is required'].

    (formula checkboxOn: #completed) label: 'Completed'.

    ^formula
  ]

  dataGrid [
    ^dataGrid ifNil: [
      dataGrid := (ILPagedDataGrid new
                   items: (self items asSortedCollection: [:a :b | a deadline < b deadline]);
                   columnNames: #('Completed' 'Title' 'Body' 'Deadline' '' '');
                   column: 1 buildContents: [:e :item | 
                                               e form checkbox checked: item completed;
                                               beSubmitOnClick;
                                               action: [:val | self setItem: item completed: val]];
                   column: 2 buildContents: [:e :item | e text: item title];
                   column: 3 buildContents: [:e :item | e text: item body];
                   column: 4 buildContents: [:e :item | e text: item deadline greaseString];
                   column: 5 buildContents: [:e :item | e a text: 'Edit'; action: [self editItem: item]];
                   column: 6 buildContents: [:e :item | e a text: 'Remove'; action: [self removeItem: item]];
                   rowsPerPage: 3;
                   yourself)]
  ]

  items [
    ^self application model items select: self selectBlock
  ]

  selectBlock [
    ^selectBlock ifNil: [selectBlock := [:each | each completed not]]
  ]

  selectBlock: aBlock [
    selectBlock := aBlock
  ]
]
