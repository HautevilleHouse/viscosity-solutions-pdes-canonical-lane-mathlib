import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscositySolutionsPdesCanonicalLaneLean.ComparisonPrincipleLayer
import HautevilleHouse.ViscositySolutionsPdesCanonicalLaneLean.StabilityCompactnessLayer

/-!
# Final Theorem: Viscosity Solutions PDE Closure

This module defines the admissible theorem closure for viscosity solutions PDEs,
combining the bridge and gate conditions from the underlying admissible class.
-/

namespace HautevilleHouse
namespace ViscositySolutionsPdesCanonicalLaneLean

def ConstrainedViscosityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_viscosity_closure (A : AdmissibleClass) :
    ConstrainedViscosityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse.ViscositySolutionsPdesCanonicalLaneLean
end HautevilleHouse
