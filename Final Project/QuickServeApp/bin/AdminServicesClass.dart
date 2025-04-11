import 'dart:io';
import 'dataBase.dart';
import 'UsersClass.dart';

class ServicesAdm 
{
  late Admin objAdm;

  ServicesAdm.named({required this.objAdm});
  ServicesAdm();

  void funServicesAdm(String userName , String passWord)
  {
    try
    {
      stdout.write('''What do you want ? 
1_ Review Customer Requests .  
2_ Settings . 
3_ Exit . 
Choose Please (1 , 2 OR 3 ) :
''');
      int choice =int.parse(stdin.readLineSync()!);

      switch(choice)
      {
        case(1):
        {
          print('Review Customer Requests . ');
          funRevCusReq(userName, passWord);
        }
        case(2):
        {
          print('Settings . ');
          funSettings(userName, passWord);
        }
        case(3):
        {
          print('End the Session and EXIT . ');
          exit(0);
        }
        default:
          print('Incorrect Option, Try Again , Please .');
          funServicesAdm(userName, passWord);
      }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      funServicesAdm(userName, passWord);
    }
  }
//--------------------------------------------------------------------

  void funRevCusReq(String userName , String passWord)
  {
    try
    {
      stdout.write('''What do you want ? 
1_ Loans Submitted . 
2_ Appointment Booking Requests . 
3_ Exit . 
Choose Please (1 , 2 OR 3 ) :
''');
      int choice =int.parse(stdin.readLineSync()!);

      switch(choice)
      {
        case(1):
        {
          print('Loans Submitted . ');
          funLoansSubmitted(userName, passWord);
        }
        case(2):
        {
          print('Appointment Booking Requests . ');
          funAppBookReq(userName, passWord);
        }
        case(3):
        {
          print('End the Session and EXIT . ');
          exit(0);
        }
        default:
          print('Incorrect Option, Try Again , Please .');
          funRevCusReq(userName, passWord);
      }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      funRevCusReq(userName, passWord);
    }
  }
//--------------------------------------------------------------------

  void funLoansSubmitted(String userName , String passWord)
  {
    try
    {
      print(loanRequests);

      stdout.write('''
1_ Accepted All . 
2_ Rejected All .
3_ Exit . 
Choose Please (1 , 2 OR 3) :
''');
      int choice =int.parse(stdin.readLineSync()!);

      switch(choice)
      {
        case(1):
        {
          print('Accepted .');
          funServicesAdm(userName, passWord);
        }
        case(2):
        {
          print('Rejected .');
          funServicesAdm(userName, passWord);
        }
        case(3):
        {
          print('End the Session and EXIT . ');
          exit(0);
        }
        default:
          print('Incorrect Option, Try Again , Please .');
          funLoansSubmitted(userName, passWord);
      }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      funLoansSubmitted(userName, passWord);
    }
  }
//--------------------------------------------------------------------

  void funAppBookReq(String userName , String passWord)
  {
    try
    {
      print(appointmentsBooked);

      stdout.write('''
1_ Accepted All . 
2_ Rejected All .
3_ Exit . 
Choose Please (1 , 2 OR 3) :
''');
      int choice =int.parse(stdin.readLineSync()!);

      switch(choice)
      {
        case(1):
        {
          print('Accepted .');
          funServicesAdm(userName, passWord);
        }
        case(2):
        {
          print('Rejected .');
          funServicesAdm(userName, passWord);
        }
        case(3):
        {
          print('End the Session and EXIT . ');
          exit(0);
        }
        default:
          print('Incorrect Option, Try Again , Please .');
          funAppBookReq(userName, passWord);
      }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      funAppBookReq(userName, passWord);
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

      for(var i in adminList)
      {
        if(i.passWord==curruntPass)
        {
          stdout.write('Password Matched . ');
          stdout.write('Now please , Enter The New Password : ');
          String passWord=stdin.readLineSync()!;
          i.passWord=passWord;
          print('Password Changed Successfully ... ');
          /*
          Admin admin=Admin(userName, passWord, 'admin');
          admin.funLoginAdm(userName, passWord);
          */
        }
        else
        {
          print('Password Error , Try Again Please . ');
          stdout.write('Enter Your UserNam : ');
          String userName =stdin.readLineSync()!;
          stdout.write('Enter Your UserNam : ');
          String passWord =stdin.readLineSync()!;
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

