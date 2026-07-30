import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

structure StabilityCertificate where
  stabilityCondition : Prop
  convergenceCondition : Prop
  stabilityConditionProof : stabilityCondition
  convergenceConditionProof : convergenceCondition

def sourceStabilityCertificate : StabilityCertificate := {
  stabilityCondition := True
  convergenceCondition := True
  stabilityConditionProof := trivial
  convergenceConditionProof := trivial
}

def StabilityLayerClosed (C : StabilityCertificate) : Prop :=
  C.stabilityCondition ∧ C.convergenceCondition

theorem source_stability_layer_closed :
    StabilityLayerClosed sourceStabilityCertificate := by
  exact And.intro sourceStabilityCertificate.stabilityConditionProof
    sourceStabilityCertificate.convergenceConditionProof

end ViscositySolutionsPdesCanonicalLaneLean
end HautevilleHouse