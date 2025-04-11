import 'dart:io';
import 'dataBase.dart';
import 'UsersClass.dart';

class Services 
{
  late Customer objCus;

  Services.named({required this.objCus});
  Services();

  void funChoice(Map<String,int>dataBaseBalance , String userName , String passWord)
  {
    try
    {
      stdout.write('''What do you want to do ? 
1_Show Current Balance .
2_Services .
3_EXIT .
Choose Please (1 , 2 OR 3) :''');
      int choice=int.parse(stdin.readLineSync()!);

    switch(choice)
    {
      case (1):
      {
        print('Show Current Balance . ');
        funShowBalance(dataBaseBalance, userName, passWord);
      }
      case (2):
      {
        print('Services . ');
        funServices(userName, passWord);
      }
      case(3):
      {
        print('End the Session and EXIT . ');
        exit(0);
      }
      default:
        print('Incorrect Option, Try Again , Please .');
        funChoice(dataBaseBalance, userName, passWord);
    }
    }
  catch(e)
  {
    print('There is an Error, Try Again Please . $e');
    funChoice(dataBaseBalance, userName, passWord);
  }
}
//--------------------------------------------------------------------

  void funShowBalance(Map<String,int>dataBaseBalance , String userName , String passWord)
  {

    try
    {
      if(dataBaseBalance.containsKey(userName))
      {
        print('Your Balance is : ${dataBaseBalance[userName]}');
      }
      stdout.write('''Would you Like Another Service ?
1_Yes .
2_No .
Choose Please (1 OR 2) :''');
      int choice=int.parse(stdin.readLineSync()!);

      switch(choice)
      {
        case (1):
        {
          print('You Want Another Service .');
          funServices(userName, passWord);
          break;
        }
        case (2):
        {
          print('You don\'t want Any Other Service , Session End . ');
          exit(0);
        }
        default:
        {
        print('Incorrect Option, Try Again , Please .');
        funShowBalance(dataBaseBalance, userName, passWord);
        }
      }
  }
  catch(e)
  {
    print('There is an Error , Try Again Please .$e');
    funShowBalance(dataBaseBalance, userName, passWord);
  }
  }
//--------------------------------------------------------------------

  void funServices(String userName , String passWord)
  {

    try
    {
      stdout.write('''What Service Do You Need ?
1_Pay Bills .
2_Submit A Request .
3_Settings .
4_EXIT .
Choose Please (1 , 2 , 3 OR 4) :''');
      int choice=int.parse(stdin.readLineSync()!);

    switch(choice)
    {
      case(1):
      {
        print('Pay Bills . ');
        funPayBills(dataBaseBalance, userName, passWord);
      }

      case(2):
      {
        print('Submit A Request .');
        funSubmitRequest(userName, passWord);
      }

      case(3):
      {
        print('Settings . ');
        funSettings(userName, passWord);
      }
      case(4):
      {
        print('End the Session and EXIT . ');
        exit(0);
      }
    default:
      print('Incorrect option, Try Again , Please .');
      funServices(userName, passWord);
    }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please .$e');
      funServices(userName, passWord);
    }
  }
//--------------------------------------------------------------------

  void funPayBills(Map<String,int>dataBaseBalance , String userName ,String passWord)
  {
    try
    {
      stdout.write('''What Bill Do you Want To Pay ?
1_Electricity Bill .
2_Water Bill .
3_Telephone Bill .
4_EXIT .
Choose Please (1 , 2 , 3 OR 4) :''');
      int choice=int.parse(stdin.readLineSync()!);

    switch(choice)
    {
      case(1):
      {
        print('Electricity Bill . ');
        funElecBill(dataBaseBalance, userName, passWord);
      }

      case(2):
      {
        print('Water Bill . ');
        funWaterBill(dataBaseBalance, userName, passWord);
      }
      case(3):
      {
        print('Telephone Bill . ');
        funTeleBill(dataBaseBalance, userName, passWord);
      }
      case(4):
      {
        print('End the Session and EXIT . ');
        exit(0);
      }
      default:
        print('Incorrect Option , Try Again , Please .');
        funPayBills(dataBaseBalance, userName, passWord);
    }  
    }
    catch(e)
    {
      print('There is an Error , Try Again Please .$e');
      funPayBills(dataBaseBalance, userName, passWord);
    }
  }
//--------------------------------------------------------------------

  void funElecBill(Map<String,int>dataBaseBalance , String userName , String passWord)
{
  try
  {
  stdout.write('Please Enter the Invoice Value : ');
  int invoiceValue=int.parse(stdin.readLineSync()!);

  if(invoiceValue<=0)
  {
    print('Invalid invoice value . ');
    funElecBill(dataBaseBalance, userName, passWord);
  }
  else if(dataBaseBalance.containsKey(userName))
  {
    int currentBalance=dataBaseBalance[userName]!;

    if(currentBalance>=invoiceValue)
    {
      currentBalance-=invoiceValue;
      dataBaseBalance[userName]=currentBalance;
      print('Your Bill Has Been Successfully Paid And Your Remaining Balance is : $currentBalance');
      funChoice(dataBaseBalance, userName, passWord);
    }
    else
    {
      print('You Don\'t Have Enough Credit To Pay Your Bill . ');
      funShowBalance(dataBaseBalance, userName, passWord);

    }
  }
  else
  {
    print('There is an Error , Try Again Please . ');
    funElecBill(dataBaseBalance, userName, passWord);
  }
  }
  catch(e)
  {
    print('There is an Error , Try Again Please .$e');
    funElecBill(dataBaseBalance, userName, passWord);
  }
}
//--------------------------------------------------------------------

  void funWaterBill(Map<String,int>dataBaseBalance , String userName ,String passWord)
{
  try
  {
  stdout.write('Please Enter the Invoice Value : ');
  int invoiceValue=int.parse(stdin.readLineSync()!);

  if(invoiceValue<=0)
  {
    print('Invalid Invoice Value . ');
    funTeleBill(dataBaseBalance, userName, passWord);
  }
  else if(dataBaseBalance.containsKey(userName))
  {
    int currentBalance=dataBaseBalance[userName]!;

    if(currentBalance>=invoiceValue)
    {
      currentBalance-=invoiceValue;
      dataBaseBalance[userName]=currentBalance;
      print('Your Bill Has Been Successfully Paid And Your Remaining Balance is : $currentBalance');
      funChoice(dataBaseBalance, userName, passWord);

    }
    else
    {
      print('You Don\'t Have Enough Credit To Pay Your Bill . ');
      funShowBalance(dataBaseBalance, userName, passWord);
    }
  }
  else
  {
    print('There is an Error , Try Again Please . ');
    funWaterBill(dataBaseBalance, userName, passWord);
  }
  }
  catch(e)
  {
    print('There is an Error , Try Again Please .$e');
    funWaterBill(dataBaseBalance, userName, passWord);
  }
}
//--------------------------------------------------------------------

  void funTeleBill(Map<String,int>dataBaseBalance , String userName , String passWord)
{
  try
  {
  stdout.write('Please Enter the Phone Number : ');
  int phoneNumber=int.parse(stdin.readLineSync()!);

  if(phoneNumber<10 || phoneNumber<10)
  {
    print('Invalid Phone Number , Please Try Again .');
    funTeleBill(dataBaseBalance, userName, passWord);
  }
  else
  {
    print('Phone Number is Correct .');
    stdout.write('Please Enter the Invoice Value : ');
    int invoiceValue=int.parse(stdin.readLineSync()!);
    if(invoiceValue<=0) 
    {
      print('Invalid Invoice Value . ');
      funTeleBill(dataBaseBalance, userName, passWord);
    }
    else 
    {
      if(dataBaseBalance.containsKey(userName))
      {
      int currentBalance=dataBaseBalance[userName]!;
      if(currentBalance>=invoiceValue)
      {
      currentBalance-=invoiceValue;
      dataBaseBalance[userName]=currentBalance;
      print('Your Bill Has Been Successfully Paid and Your Remaining Balance is : $currentBalance');
      funChoice(dataBaseBalance, userName, passWord);
      }
      }
      else
      {
        print('You Don\'t Have Enough Credit to Pay your Bill .');
        funShowBalance(dataBaseBalance, userName, passWord);
      }
    }
  }
  }
  catch(e)
  {
    print('There is an Error , Try Again Please .$e');
    funTeleBill(dataBaseBalance, userName, passWord);
  }
}
//--------------------------------------------------------------------

  void funSubmitRequest(String userName , String passWord)
{
  try
  {
  stdout.write('''What is your Request ?
1_Loan Request .
2_Request An Appointment With Customer Service .
3_EXIT .
Choose Please (1 , 2 OR 3 ) :''');
  int choice=int.parse(stdin.readLineSync()!);

  switch(choice)
  {
    case(1):
    {
      print('Loan Request .');
      funLoanRequest(userName, passWord);
    }

    case(2):
    {
      print('Request An Appointment With Customer Service .');
      funRaquestCusSer(userName, passWord);
      
    }
    case(3):
    {
      print('End the Session and EXIT .');
      exit(0);
    }
    default:
    print('Incorrect Option , Try Again , Please .');
    funSubmitRequest(userName, passWord);
  }
  }
  catch(e)
  {
    print('There is an Error , Try Again Please .$e');
    funSubmitRequest(userName, passWord);
  }
}
//--------------------------------------------------------------------

  void funLoanRequest(String userName , String passWord)
{
  try
  {
    stdout.write('Enter Loan Amount ? ');
    int loanValue=int.parse(stdin.readLineSync()!);

    if(loanRequests.containsKey(userName))
    {
      print('You Have Already Submitted A Request . We are Sorry to Provide the Service.');
      print('Loan Value for Request Submitted : ${loanRequests[userName]}');
      funServices(userName, passWord);

    }
    else
    {
      if(loanValue<=0)
      {
        print('Error Entering Value, Try Again . ');
        funLoanRequest(userName, passWord);
      }
      else
      {
      loanRequests[userName]=loanValue;
      print('Your Loan Application Has Been Submitted Successfully . ');
      funServices(userName, passWord);
      }
    }
  }
  catch(e)
  {
    print('There is an Error, Try Again Please . $e');
    funLoanRequest(userName, passWord);
  }
}
//--------------------------------------------------------------------

  void funRaquestCusSer(String userName , String passWord)
{
  try
  {
  stdout.write('Enter the Date & Time for booking , In this way Please ( YYYY-MM-DD HH:MM ) : ');
  String inDateTime=stdin.readLineSync()!;

  if(appointmentsBooked.containsKey(userName))
  {
    print('You already have an appointment. ${appointmentsBooked[userName]}');
    
  }
  else
  {
    if(!appointmentsBooked.containsKey(userName) && inDateTime=='2025-02-10 12:00')
    {
      appointmentsBooked[userName]={};
      print('Booking has been completed successfully At : $inDateTime ');
      funServices(userName, passWord);
    }
  }
  }
  catch(e)
  {
    print('There is an Error, Try Again Please . $e');
    funRaquestCusSer(userName, passWord);
  }
}
//--------------------------------------------------------------------

  void funSettings(String userName , String passWord)
{
  try
  {
  stdout.write('''What is your Request ?
1_Change Password .
2_Sign Out .
Choose Please (1 OR 2 ) :''');
  int choice=int.parse(stdin.readLineSync()!);

  switch(choice)
  {
    case(1):
    {
      print('Change Password . ');
      funChangePass(userName, passWord);
    }

    case(2):
    {
      print('Sign Out . ');
      funSignOut();
    }
    default:
    print('Incorrect Option , Try Again , Please .');
    funSettings(userName, passWord);
  }
  }
  catch(e)
  {
    print('There is an Error , Try Again Please .$e');
    funSettings(userName, passWord);
  }
}
//--------------------------------------------------------------------

void funChangePass(String userName , String passWord)
{
  try
  {
    stdout.write('To Change Your Password , Enter Your Current Password : ');
    String curruntPass=stdin.readLineSync()!;

    for(var i in customerList)
    {
      if(i.passWord==curruntPass)
        {
          stdout.write('Password Matched . ');
          stdout.write('Now please , Enter The New Password : ');
          String passWord=stdin.readLineSync()!;
          i.passWord=passWord;
          print('Password Changed Successfully ... ');
          funChoice(dataBaseBalance, userName, passWord);
          
          /*
          Customer customer=Customer(userName, passWord, 'customer');
          customer.funLoginCus(userName, passWord);
          */
        }
        else
        {
          print('Password Error , Try Again Please . ');
          funChangePass(userName, passWord);
        }
    }
  }
  catch(e)
  {
    print('There is An Error , Try Again Please .$e');
    funChangePass(userName, passWord);
  }
}
//--------------------------------------------------------------------

void funSignOut()
{
  print('Thank You, You Will Be Logged Out . ');
  exit(0);
}
//--------------------------------------------------------------------

}

