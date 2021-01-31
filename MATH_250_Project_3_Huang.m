% MATH 205 | Project 3 | Eva Huang

% Q1 Assume there are three political parties, Republican, Democrat, and United, which have consistent voting patterns from year to year represented by the following stochastic matrix T and initial voter distribution x(0). (Here tij = the proportion of members of party j who switch to party i during the next year.)
format short;
disp ('Question 1: Assume there are three political parties, Republican, Democrat, and United, which have consistent voting patterns from year to year represented by the following stochastic matrix T and initial voter distribution x(0). (Here tij = the proportion of members of party j who switch to party i during the next year.)')

disp ('a) Use MATLAB to find a steady state vector and explain what this means in terms of long-term voter behavior.')
% Markov Chain x(n-1)=T*xn

count = 0;
T = [.75, .33, .10; .10  .55 .02; .15 .12 .88]
x = [.44; .45; .11]


% Repeat x(n-1)=T*xn until steady stage
disp ('Repeat x(n-1)=T*xn until steady stage')
for i = 1:32
 %     me = 'x',i;
       x   = T * x;
       fprintf('x%d\n',i);
       disp(x);
end
% result of x(n-1)=T*xn is consistent after the 28th term 29-32 displays the same value
fprintf('29 years after the initial state, voter distripution will steadily have approximately 35.32 percent Republican votes, 10.27 percent will vote Democrat, and 54.44 percent will be undecided\n')

disp ('b) Choose different initial state vector and find the steady state vector. Does an initial state vector have any influence on long term behavior?')

T = [.75, .33, .10; .10  .55 .02; .15 .12 .88];
x = [.44; .45; .11]
x1=T*x
x2=T*x1
x3=T*x1
disp ('pick year 3 as the initial state')
x= [0.4857; 0.2148; 0.2995]
disp ('Repeat x(n-1)=T*xn until steady stage')
% Repeat x(n-1)=T*xn until steady state
for i = 1:32
 %     me = 'x',i;
       x   = T * x;
       fprintf('x%d\n',i);
       disp(x);
end


fprintf('27 years after the initial state (+3 years), voter distripution result the same as any other initial state. Initial state effect the # of terms reaching steady state, not the value of ;ong term behavior.\n')
fprintf('Even without looping till steady state, we know that the formula for steady state (P-I)q=0 does not involve initial state')
% Markov Chain Steady State: (T-I)q=0
z=[0; 0; 0]
M=[T-eye(3),z]
format rat
disp ('rref((T-I),0)')
rref(M)
% q=[172/265; 50/265; 1]=[172;50;265]
% q is probability vector, column entries must add up to 1.

format short
q=[172/(172+50+265);50/(172+50+265);265/(172+50+265)]

%/Q1
fprintf('\n====\n')

% Q2 A city is served by two newspapers, the Star and the Times. Each year the Star loses 30% of its subscribers to the Times and retains 70% of its subscribers. During the same time period, the Times loses 10% of its subscribers to the Star while retaining the other 90%.
format short;
disp ('Question 2: A city is served by two newspapers, the Star and the Times. Each year the Star loses 30% of its subscribers to the Times and retains 70% of its subscribers. During the same time period, the Times loses 10% of its subscribers to the Star while retaining the other 90%.')
disp ('a) Write down a Markov matrix that describes the transition of subscribers between the two newspapers each year.')
%          -> 0.7
% 0.3 < S         T > 0.9
%          0.1 <-
A=[.3 .1; .7 .9] 

disp ('b) Find the steady state vector for the matrix in (a), what percentage of the subscribers will subscribe to the Times? .How many years will it take to reach the steady state vector?')
% Markov Chain Steady State: (T-I)q=0
z=[0; 0]
M=[A-eye(2),z]
format rat
disp('rref(A-eye(2),0)')
rref(M)
% q=[1/7; 1]=[1;7]
% q is probability vector, column entries must add up to 1.
format short
q=[1/8;7/8]

% use A^n to find steady state vector
n=0
while( n < 8 )
fprintf('Year %d\n', n);
n = n + 1;
A^n
end
% steady state vector appear at year 16
fprintf('87.5 percent of subscribers will subscribe to the Times. It will take 4 years to reach the steady state vector \n')

%/Q2
fprintf('\n====\n')

% Q3 For each of the following matrices answer the questions 1), 2), 3) and 4) below using matlab.
disp ('Question 3: For each of the following matrices answer the questions 1), 2), 3) and 4) below using matlab.')
format rat

A=pascal(5)
B=3*eye(5)+diag(ones(4, 1), 1)
C=ones(5)
disp ('1) Find the eigenvalues and null to find the eigenvectors of the matrix.')

disp('A=pascal(5)')
disp('Eigenvalues')
eig(A)
disp('Eigenvectors')
disp('272/25103')
null(A-(272/25103)*eye(5),'r')
disp('143/789')
null(A-(143/789)*eye(5),'r')
disp('1')
null(A-(1)*eye(5),'r')
disp('789/143')
null(A-(789/143)*eye(5),'r')
disp('25103/272')
null(A-(25103/272)*eye(5),'r') 

disp ('A=3*eye(5)+diag(ones(4, 1), 1)')
disp('Eigenvalues')
eig(B)
disp('Eigenvector (3)')
null(B-(3)*eye(5),'r')

disp('A=ones(5)')
disp('Eigenvalues')
eig(C)
disp('Eigenvectors')
disp('0')
null(C-(0)*eye(5),'r')
disp('5')
null(C-(5)*eye(5),'r')
% Evaluate whether eigenvectors are linearly independent
disp('rref(all eigenvectors)')
rref(null(C-(0)*eye(5),'r'),null(C-(5)*eye(5),'r'))

disp ('2) Determine which of the matrices are diagonalizable if any.')
fprintf('A=pascal(5) is not diagonalizable because the sum of sufficient eigenvectors is smaller than 5.\nA=3*eye(5)+diag(ones(4, 1), 1) is already diagnalized \nA=ones(5)is not diagonalizable because the eigenvectors are not linearly independent\n\n')

disp ('3) Use rank to compute the dimension of each eigenspace for each of the matrices.')

disp('A=pascal(5)')
disp('Dimension for 272/25103')
rank(A-(272/25103)*eye(5))
disp('Dimension for 143/789')
rank(A-(143/789)*eye(5))
disp('Dimension for 1')
rank(A-(1)*eye(5))
disp('Dimension for 789/143')
rank(A-(789/143)*eye(5))
disp('Dimension for 25103/272')
rank(A-(25103/272)*eye(5))

disp('A=3*eye(5)+diag(ones(4, 1), 1)')
disp('Dimension for 3')
rank(B-(3)*eye(5))

disp('A=ones(5)')
disp('Dimension for 0')
rank(C-(0)*eye(5))
rank(C-(5)*eye(5))

disp ('4) The MATLAB function poly(A) computes the coefficients of the characteristic polynomials of A. For each of the matrices, compute poly(A) and write the characteristic polynomials for A.')
fprintf('A=pascal(5)')
poly(A)
fprintf('a^5 -99a^4 +626a^3 -626a^2 +99a -1=(a-1)(a^4-98a^3+528a^2-98a+1)\n\n')
disp('A=3*eye(5)+diag(ones(4, 1), 1)')
poly(B)
fprintf('(a-3)^4\n\n')
disp('A=ones(5)')
poly(C)
disp('a^4(a-5)')

%/Q3
fprintf('\n====\n')

% Q4 Suppose A and B are n by n matrices with the properties that AB = BA and Nul(A) = Nul(B) (the nullspaces are the same). Show that if v is an eigenvector for A corresponding to the non-zero eigenvalue λ, then Bv is also a λ-eigenvector for A.
disp ('Question 4: Suppose A and B are n by n matrices with the properties that AB = BA and Nul(A) = Nul(B) (the nullspaces are the same). Show that if v is an eigenvector for A corresponding to the non-zero eigenvalue λ, then Bv is also a λ-eigenvector for A.')
fprintf('Given that AB=BA and Null(A)=Null(B). Let v be an eigenvector of A corresponding to the nonzero eigenvalue λ.')
% Show Bv is also an eigen vector for A corrspndig to λ.
fprintf('Av=λv \n=> A(Bv)=(AB)v=BAv=B(λv)=λBv\n=> ABv=λBv\nBv is an eigenvector corresponding to the eigenvalue λ of A')
%/Q4
fprintf('\n====\n')
