function [U, S, V, X, psi, phi,  v, u,K, M] = dmaps(A, no_dims, t, sigma, alpha)
 % A is symmetric pairwise distance matrix
 % no_dims is the dimensionality of embedding
 % sigma heat kernel paramater 
 % t is time/scale parameter
 % alpha determines the operator that is applied
	[U, S, V, psi, phi]= diffuse(A, no_dims, sigma, alpha);
    eigenvals = diag(S);
	X = diffusionCoordinates( psi , eigenvals , no_dims , t,size(A,1));
end