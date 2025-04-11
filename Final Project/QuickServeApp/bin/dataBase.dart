import 'UsersClass.dart';

List<Admin>adminList=
[
  Admin('Raghad', '123' , 'admin')
];

List<Customer>customerList=
[
  Customer('Rana', '789' , 'admin'),
  Customer('Rashed', '147' , 'customer')
];

Map<String,int> dataBaseBalance=
{
  'Rana' : 1000 , 'Rashed' : 2000 
};

Map<String,int> loanRequests=
{
  'Rana' : 3000
};

Map<String,Map<String,String>> appointmentsBooked=
{
  'Rana' :{'Date' : '2025-02-04' , 'Time' : '12:00' } ,
  'Rashed' :{'Date' : '2025-02-08' , 'Time' : '12:00' }
};

