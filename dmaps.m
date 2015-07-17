function [U, S, V, X, psi, phi,  v, u,K, M] = dmaps(A, no_dims, t, sigma, alpha)
	[U, S, V, psi, phi]= diffuse(A, no_dims, sigma, alpha);
    eigenvals = diag(S);
	X = diffusionCoordinates( psi , eigenvals , no_dims , t,size(A,1));
end