function [U, S, V, psi, phi] = diffuse(A, no_dims, sigma, alpha)
  % Author: Parag Jain
  % INPUT:
  %-------
  % A is symmetric pairwise distance matrix
  % no_dims is the dimensionality of embedding
  % t is time/scale parameter
  % alpha determines the operator that is applied

  A = exp(-A.^2/(sigma));
  threshold=5E-6;
  A=sparse(A.*double(A>threshold));
  %A(A<threshold) = 0;
  if alpha ~= 0
    v = sum(A)';
    v = v.^alpha;
    K = A./(v*v');
  else
    K = A; % isotropic kernel
  end  
  u = sum(K,2);
  %D = diag(u.^(-1));
  %M = D*K;
  M = bsxfun(@rdivide,K,u);
  n = size(M,1);
  
  [U,S,V]=svds(M,no_dims+1);  % eigendecomposition of symmetric matrix
  psi=U./(U(:,1)*ones(1,no_dims+1)); % right eigenv of Markov matrix
  phi=U.*(U(:,1)*ones(1,no_dims+1)); % left eigenv of Markov matrix

end
