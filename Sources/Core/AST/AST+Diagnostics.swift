import Utils

extension Diagnostic {

  static func error(
    illegalGlobalBindingIntroducer i: SourceRepresentable<BindingPattern.Introducer>
  ) -> Diagnostic { .error("global binding must be introduced by 'let'", at: i.site) }

  static func error(
    illegalMemberBindingIntroducer i: SourceRepresentable<BindingPattern.Introducer>
  ) -> Diagnostic { .error("member binding must be introduced by 'let' or 'var'", at: i.site) }

  static func error(
    invalidOperatorLabels found: [String?], expected: [String?], at site: SourceRange
  ) -> Diagnostic {
    .error(
      """
      invalid operator labels '\(Name.describe(labels: found))', \
      expected '\(Name.describe(labels: found))'
      """, at: site)
  }

  static func error(
    invalidOperatorNotation found: OperatorNotation, expected: OperatorNotation,
    at site: SourceRange
  ) -> Diagnostic {
    .error("invalid operator notation '\(found)', expected '\(expected)'", at: site)
  }

  static func error(missingFunctionIdentifier d: FunctionDecl) -> Diagnostic {
    .error("missing identifier in function declaration", at: d.introducerSite)
  }

  static func error(missingMethodIdentifier d: MethodDecl) -> Diagnostic {
    error(missingMethodIdentifierAt: d.introducerSite)
  }

  static func error(missingMethodIdentifierAt site: SourceRange) -> Diagnostic {
    .error("missing identifier in method bundle declaration", at: site)
  }

  static func error(missingSubscriptIdentifier d: SubscriptDecl) -> Diagnostic {
    .error("missing identifier in subscript declaration", at: d.introducer.site)
  }

  static func error(missingTypeAnnotation p: BindingPattern, in ast: AST) -> Diagnostic {
    .error("missing type annotation", at: ast[p.subpattern].site)
  }

  static func error(missingTypeAnnotation p: ParameterDecl, in ast: AST) -> Diagnostic {
    .error("missing type annotation", at: p.identifier.site)
  }

  static func error(unexpectedAssociatedTypeDecl d: AssociatedTypeDecl) -> Diagnostic {
    .error("associated type declaration is not allowed here", at: d.introducerSite)
  }

  static func error(unexpectedAssociatedValueDecl d: AssociatedValueDecl) -> Diagnostic {
    .error("associated value declaration is not allowed here", at: d.introducerSite)
  }

  public static func error(unexpectedCapture p: BindingPattern) -> Diagnostic {
    .error("explicit capture is not allowed here", at: p.introducer.site)
  }

  static func error(unexpectedImportDecl d: ImportDecl) -> Diagnostic {
    .error("import declaration is not allowed here", at: d.introducerSite)
  }

  static func error(unexpectedGenericParameterDecl d: GenericParameterDecl) -> Diagnostic {
    .error("generic parameter declaration is not allowed here", at: d.identifier.site)
  }

  static func error(unexpectedInitializerDecl d: InitializerDecl) -> Diagnostic {
    .error("initializer declaration is not allowed here", at: d.introducer.site)
  }

  static func error(unexpectedMemberwiseInitializerDecl d: InitializerDecl) -> Diagnostic {
    .error(
      "memberwise initializer declaration may only appear in product type declaration",
      at: d.introducer.site)
  }

  public static func error(
    unexpectedMemberModifier m: SourceRepresentable<MemberModifier>
  ) -> Diagnostic {
    .error("unexpected member modifier '\(m.value)'", at: m.site)
  }

  public static func error(unexpectedMethodDecl d: MethodDecl) -> Diagnostic {
    .error("method bundle declaration is not allowed here", at: d.introducerSite)
  }

  public static func error(unexpectedMethodImpl d: MethodImpl) -> Diagnostic {
    .error("method implementation declaration is not allowed here", at: d.introducer.site)
  }

  public static func error(unexpectedNamespaceDecl d: NamespaceDecl) -> Diagnostic {
    .error("namespace declaration is not allowed here", at: d.introducerSite)
  }

  public static func error(unexpectedOperatorDecl d: OperatorDecl) -> Diagnostic {
    .error("operator declaration is not allowed here", at: d.introducerSite)
  }

  public static func error(unexpectedParameterDecl d: ParameterDecl) -> Diagnostic {
    .error("parameter declaration is not allowed here", at: d.identifier.site)
  }

  public static func error(unexpectedPropertyDecl d: SubscriptDecl) -> Diagnostic {
    .error("property declaration is not allowed here", at: d.introducer.site)
  }

  public static func error(unexpectedSubscriptImpl d: SubscriptImpl) -> Diagnostic {
    .error("subscript implementation declaration is not allowed here", at: d.introducer.site)
  }

  public static func error(unexpectedTraitDecl d: TraitDecl) -> Diagnostic {
    .error("trait declaration is not allowed here", at: d.identifier.site)
  }

  public static func error(unexpectedVarDecl d: VarDecl) -> Diagnostic {
    .error("variable declaration is not allowed here", at: d.identifier.site)
  }
}
