import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

abbrev SpaceN := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → SpaceN → ℝ

def zeroScalarField : ScalarField := fun _ _ => 0

structure SecondOrderOperator where
  laplacian : ScalarField → ScalarField
  gradient : ScalarField → SpaceN
  hessian : ScalarField → (SpaceN → SpaceN)

structure ViscosityPDE where
  F : SecondOrderOperator → ScalarField → ScalarField
  f : ScalarField

def primitiveSecondOrder : SecondOrderOperator := {
  laplacian := fun _ => zeroScalarField
  gradient := fun _ => fun _ => 0
  hessian := fun _ => fun _ => fun _ => 0
}

def primitivePDE : ViscosityPDE := {
  F := fun _ _ => zeroScalarField
  f := zeroScalarField
}

end HautevilleHouse
end ViscositySolutionsPdesCanonicalLaneLean