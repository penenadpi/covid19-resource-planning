param numCities;
set Cities:=1..numCities;
param Travel_Cost {i in Cities, j in Cities};        
param CriticalPatients {i in Cities}; 
param RespiratorAmount {i in Cities}; 
param RespiratorPrice {i in Cities};
param Budget {i in Cities};

# variable declaration
var X {i in Cities, j in Cities} >= 0;

# objective function
minimize cost:
	sum{i in Cities, j in Cities} (Travel_Cost[i,j]+X[i,j]*RespiratorPrice[j]);   
	 
subject to cover_critical {i in Cities}:
	RespiratorAmount[i]+sum{j in Cities}(X[i,j]-X[j,i])>=CriticalPatients[i];

subject to budget_limit {i in Cities}:
	Budget[i]>=sum{j in Cities}(Travel_Cost[i,j]+X[i,j]*RespiratorPrice[j]);