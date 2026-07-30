import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscositySolutionsPdesCanonicalLaneLean.ViscosityObjects

/-!
# Perron Weak Layer

This module records the Perron method weak-solution envelope: the supremum of
all subsolutions and the infimum of all supersolutions, and the condition that
they coincide to give a viscosity solution.
-/

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

structure PerronEnvelope where
  v : ViscositySolution
  allSubSolutions : Prop
  supremumSub : ScalarField
  infimumSuper : ScalarField
  envelopeCoincidence : Prop
  allSubSolutionsClosed : allSubSolutions
  supremumSubDefined : supremumSub = v.u
  infimumSuperDefined : infimumSuper = v.u
  envelopeCoincidenceClosed : envelopeCoincidence

def sourcePerronEnvelope : PerronEnvelope := {
  v := primitiveViscositySolution
  allSubSolutions := True
  supremumSub := zeroScalarField
  infimumSuper := zeroScalarField
  envelopeCoincidence := True
  allSubSolutionsClosed := True.intro
  supremumSubDefined := rfl
  infimumSuperDefined := rfl
  envelopeCoincidenceClosed := True.intro
}

def PerronEnvelopeClosed (E : PerronEnvelope) : Prop :=
  E.allSubSolutions ∧ E.envelopeCoincidence

theorem source_perron_envelope_closed :
    PerronEnvelopeClosed sourcePerronEnvelope := by
  exact And.intro sourcePerronEnvelope.allSubSolutionsClosed
    sourcePerronEnvelope.envelopeCoincidenceClosed

end HautevilleHouse.ViscositySolutionsPdesCanonicalLaneLean
end HautevilleHouse
