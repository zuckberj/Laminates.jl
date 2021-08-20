module Laminates

using LinearAlgebra

struct OrthotropicMaterial
	E1::Real
	E2::Real
	ν12::Real
	G12::Real
	Xt::Real
	Yt::Real
	Xc::Real
	Yc::Real
	S12::Real
	
	OrthotropicMaterial(E1, E2, nu12, G12) = new(E1, E2, nu12, G12)
	OrthotropicMaterial(E1, E2, nu12, G12, Xt, Yt, Xc, Yc, S12) = new(E1, E2, nu12, G12, Xt, Yt, Xc, Yc, S12)
end

function Q(mat::OrthotropicMaterial)
	Q11 = mat.E1^2/(mat.E1-mat.ν12^2*mat.E2)
	Q12 = mat.ν12*mat.E1*mat.E2/(mat.E1-mat.ν12^2*mat.E2)
	Q22 = mat.E1*mat.E2/(mat.E1-mat.ν12^2*mat.E2)
	Q66 = mat.G12
	[Q11 Q12 0
	 Q12 Q22 0
	  0   0  Q66]
end


end # module
