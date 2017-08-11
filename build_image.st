PackageLoader fileInPackage: 'Iliad'.
Directory working allFilesMatching: 'prod/*.st' do: [ :file | file fileIn ].
ObjectMemory addDependent: Startup.
ObjectMemory snapshot: 'prod.im'
