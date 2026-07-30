import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

abbrev Space := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space → ℝ

def zeroScalarField : ScalarField := fun _ _ => 0

structure SecondOrderOperator where
  source : ScalarField → ScalarField
  sourceMonotone : ∀ u v, (u ≤ v) → source u ≤ source v
  degenerateElliptic : ∀ u, source u - source u = zeroScalarField

structure ViscosityTestFunction where
  phi : ScalarField
  testPoint : Space × Time
  superSolution : Prop

structure ViscositySolutionCondition where
  subSolution : ∀ (phi : ViscosityTestFunction), phi.superSolution → sourceOperator (phi.phi) ≤ 0
  superSolution : ∀ (phi : ViscosityTestFunction), ¬ phi.superSolution → sourceOperator (phi.phi) ≥ 0
  sourceOperator : SecondOrderOperator

structure ViscosityFlow where
  solution : ScalarField
  condition : ViscositySolutionCondition
  domain : Set (Space × Time)

end ViscositySolutionsPdesCanonicalLaneLean
end HautevilleHouse