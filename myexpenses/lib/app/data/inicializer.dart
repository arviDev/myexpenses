abstract class InicializerDatabase {
  ///if relational initialize database, in doc types, open box if local or
  ///estabilize connections for external
  dynamic onInitializer();

  ///if relational create a tables, in doc types, create the box
  ///database == box
  onCreateDocs(dynamic database, List<String> docsCreate);

  ///insert primary data
  onInsertDocs(dynamic dabase, Map<String, dynamic> map);
}
