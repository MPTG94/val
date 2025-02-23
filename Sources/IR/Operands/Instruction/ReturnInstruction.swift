import Core

/// A return instruction.
public struct ReturnInstruction: Terminator {

  /// The site of the code corresponding to that instruction.
  public let site: SourceRange

  /// Creates an instance with the given properties.
  fileprivate init(site: SourceRange) {
    self.site = site
  }

  public var types: [IR.`Type`] { [] }

  public var operands: [Operand] { [] }

  public var successors: [Block.ID] { [] }

  public mutating func replaceOperand(at i: Int, with new: Operand) {
    preconditionFailure()
  }

  func replaceSuccessor(_ old: Block.ID, with new: Block.ID) -> Bool {
    false
  }

}

extension Module {

  /// Creates a `return` anchored at `site`.
  func makeReturn(at site: SourceRange) -> ReturnInstruction {
    .init(site: site)
  }

}
