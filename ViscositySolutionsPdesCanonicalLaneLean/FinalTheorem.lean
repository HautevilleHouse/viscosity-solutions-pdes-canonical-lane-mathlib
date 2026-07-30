import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

def ConstrainedViscositySolutionsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_viscosity_solutions_endgame (A : AdmissibleClass) :
    ConstrainedViscositySolutionsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ViscositySolutionsPdesCanonicalLaneLean
end HautevilleHouse