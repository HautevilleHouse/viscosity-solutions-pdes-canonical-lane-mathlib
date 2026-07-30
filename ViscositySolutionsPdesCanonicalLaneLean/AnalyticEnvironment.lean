import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

abbrev Time := ℝ
abbrev Space := ℝ
abbrev State := ℝ

structure TestFunction where
  phi : Time → Space → State
  smoothnessClass : String
deriving Repr, DecidableEq

structure HJBOperator where
  H : State → Space → State
  continuous : Bool
deriving Repr, DecidableEq

structure ViscositySolution where
  u : Time → Space → State
  testFunction : TestFunction
  subsolutionProperty : Prop
  supersolutionProperty : Prop
  operator : HJBOperator
  viscosityProperty : subsolutionProperty ∧ supersolutionProperty
deriving Repr, DecidableEq

def zeroTestFunction : TestFunction := {
  phi := fun _ _ => 0
  smoothnessClass := "C^∞"
}

class AdmissibleViscositySolution (A : AdmissibleClass) where
  solution : ViscositySolution
  bridgeCondition : Prop
  gateCondition : Prop
  bridgeProof : bridgeCondition
  gateProof : gateCondition

end ViscositySolutionsPdesCanonicalLaneLean
end HautevilleHouse