abstract class InicializerDatabase {
  ///if relational initialize database, in doc types, open box if local or
  ///estabilize connections for external
  dynamic onInitializer();

  ///if relational create a tables, in doc types, create the box
  onCreateDocs();
}
