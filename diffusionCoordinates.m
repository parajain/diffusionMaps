function [ X ] = diffusionCoordinates( psi,eigenvals,no_dims,t,n)
    
  
  lambda_t=eigenvals(2:end).^t; lambda_t=ones(n,1)*lambda_t';
  X = psi(:,2:no_dims+1).*lambda_t(:,1:no_dims);  % diffusion coords X
  %X = psi(r+1:r+n1, 2:no_dims+1) .* lambda_t(r+1:r+n1 , 1:no_dims);
end

