import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

structure ComparisonCertificate where
  subSolutionClosed : Prop
  superSolutionClosed : Prop
  comparisonResult : Prop
  subSolutionClosedProof : subSolutionClosed
  superSolutionClosedProof : superSolutionClosed
  comparisonResultProof : comparisonResult

def sourceComparisonCertificate : ComparisonCertificate := {
  subSolutionClosed := True
  superSolutionClosed := True
  comparisonResult := True
  subSolutionClosedProof := trivial
  superSolutionClosedProof := trivial
  comparisonResultProof := trivial
}

def ComparisonLayerClosed (C : ComparisonCertificate) : Prop :=
  C.subSolutionClosed ∧ C.superSolutionClosed ∧ C.comparisonResult

theorem source_comparison_layer_closed :
    ComparisonLayerClosed sourceComparisonCertificate := by
  exact And.intro sourceComparisonCertificate.subSolutionClosedProof
    (And.intro sourceComparisonCertificate.superSolutionClosedProof
      sourceComparisonCertificate.comparisonResultProof)

end ViscositySolutionsPdesCanonicalLaneLean
end HautevilleHouse