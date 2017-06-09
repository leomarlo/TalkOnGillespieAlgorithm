seed=10;
rng(seed);

% Initialise Network
N=100;
Edges=200;
x=randi([0,1],1,N);
A=newERG(N,Edges);


% Initial Populations of Infected and SI-Edges
N_I=sum(x);
N_SI=(1-x)*(A*x');
h=[N_I,N_SI];
rho(1)=N_I/N;

% Initialise Rates
recovery=1;
infrate=0.5;
c=[recovery,infrate]; % rates

% Initialise Times
t=0;
tmax=10;
Nt=1000;
times=t:(tmax-t)/Nt:tmax;
i=0;

while t<tmax
    a_mu=h.*c; %vector of reaction rates
    a=sum(a_mu); %sum of all a_mu
    mu=1+(a_mu(1)<rand()*a); 
    tau=-log(rand())/a;
    
    if mu==1
        inf=find(x); % find all infected nodes
        k=randi(length(inf)); % pick an infected node
        x(k)=0; % recover that node
    elseif mu==2
        SI=(A & (x')*ones(1,N)==0 & ones(N,1)*x); % SI-links
        [ro,co]=find(SI);
        k=randi(length(ro));
        x(ro(k))=1;
    end
    
    N_I=sum(x);
    N_SI=(1-x)*(A*x');
    h=[N_I,N_SI];
    t=t+tau;  % update time
    
    %
    ind=find(times<=t,1,'last'); % index of the recorded events. 
    if ind>i; rho(i+1:ind)=N_I/N;  end   % record rho
    i=ind; %update the new index.
end