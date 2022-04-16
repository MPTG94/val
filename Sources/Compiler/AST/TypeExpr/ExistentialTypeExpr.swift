/// The expression of an existential type.
public struct ExistentialTypeExpr: TypeExpr {

  public static let kind = NodeKind.existentialTypeExpr

  /// The traits to which the witness conforms.
  public var traits: SourceRepresentable<TraitComposition>

  /// The where clause of the expression, if any.
  public var whereClause: SourceRepresentable<WhereClause>?

}