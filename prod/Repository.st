Object subclass: Repository [
  | items |

  Repository class [
    | default |

    default [
      ^default ifNil: [default := self new]
    ]
  ]

  addItem: anItem [
    self items add: anItem
  ]

  items [
    ^items ifNil: [items := OrderedCollection new]
  ]

  removeItem: anItem [
    self items remove: anItem
  ]
]
