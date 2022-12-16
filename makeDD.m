function [A,B] = makeDD(A,B)
  % takes a square matrix A and permutes the rows if possible so that A is diagonally dominant
  [n,m] = size(A);
  if n~= m
    error('A is not square')
  end
  
  % test to see if a valid permutation exists
  [maxrow,maxind] = max(abs(A),[],2);
  
  if all(maxrow > (sum(abs(A),2) - maxrow)) && isequal(sort(maxind),(1:numel(maxind))')
    % success is both possible and easy to achieve
    A(maxind,:) = A;
    B(maxind,:)=B;
  else
    error('Sorry, but this matrix can never be made to be diagonally dominant')
    
    A = [];
  end
  
end