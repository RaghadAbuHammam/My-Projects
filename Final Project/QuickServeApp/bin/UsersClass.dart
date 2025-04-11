import 'dart:io';
import 'dataBase.dart';
import 'AdminServicesClass.dart';
import 'CustomerServicesClass.dart';

class Users
{

  String userName;
  String passWord;
  String userType;
  
  Users({required this.userName , required this.passWord ,required this.userType});

}

class Admin extends Users
{
  Admin(String userName , String passWord, String userType ):super(userName: userName , passWord: passWord , userType: userType);

  void funLoginAdm (String userName , String passWord )
  {
    try
    {
      for(var i in adminList)
      {
        if(i.userName ==userName)
        {
          if(i.passWord==passWord)
          {
            ServicesAdm admin = ServicesAdm.named(objAdm: i);
            admin.funServicesAdm(userName, passWord);
          }
          else
          {
            print('Password Error , Try Again Please . ');
            stdout.write('Enter Your Password Again , please : ');
            String passWord=stdin.readLineSync()!;
            funLoginAdm(userName, passWord);
          }

        }
        else
        {
          print('UserName Error , Try Again Please . ');
          stdout.write('Enter Your UserName Again , please : ');
          String userName=stdin.readLineSync()!;
          funLoginAdm(userName, passWord);
        }
      }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      funLoginAdm(userName, passWord);
    }
  }
}

class Customer extends Users
{
  Customer(String userName , String passWord , String userType ):super(userName: userName , passWord: passWord, userType: userType);

  void funQ (String passWord)
  {
    try
    {
      stdout.write('''Are you ? 
1_ New Customer .
2_ Old Customer .
3_ Exit . 
please Choose (1 , 2 OR 3) : ''');
      int choice=int.parse(stdin.readLineSync()!);

      switch(choice)
      {
        case(1):
        {
          print('Welcome , You Automatically Entered Your Name and Password . ');
          funRegCus(userName, passWord);
        }
        case(2):
        {
          print('Great , That Means you\'ve Dealt With Us Before.');
          funLoginCus(userName, passWord);
        }
        default:
        {
          print('Incorrect Option, Try Again , Please .');
          funQ(passWord);
        }
     }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      funQ(passWord);
    }
  }
//--------------------------------------------------------------------

  void funRegCus (String userName , String passWord)
  {
    try
    {
      if(userName != ' ')
      {
        if(passWord !=' ')
        {
          customerList.add(Customer(userName, passWord, 'customer'));
          stdout.write('Just Now , Enter Your Balance : ');
          int balance=int.parse(stdin.readLineSync()!);
          dataBaseBalance[userName]=balance;
          print('Your Account Has Been Created Successfully . You Will Be Transferred To The Services Section . ');
          Services customer=Services();
          customer.funChoice(dataBaseBalance, userName, passWord);
        }
        else
        {
          print('This Password Alredy Exists . Try Again . ');
          stdout.write('Enter Onther Password : ');
          String passWord=stdin.readLineSync()!;
          customerList.add(Customer(userName, passWord, 'customer'));
          print('Registration Is Successful . Go To Login.');
          funLoginCus(userName, passWord);
        }
      }
      else
      {
        print('This UserName Alredy Exists . Try Again . ');
        stdout.write('Enter Onther UserName : ');
        String userName=stdin.readLineSync()!;
        customerList.add(Customer(userName, passWord, 'customer'));
        print('Registration Is Successful . Go To Login.');
        funLoginCus(userName, passWord);
      }
      
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      funRegCus(userName, passWord);
    }
  }
//--------------------------------------------------------------------

  void funLoginCus (String userName , String passWord )
  {
    try
    {
      for(var i in customerList)
      {
        if(i.userName ==userName)
        {
          if(i.passWord==passWord)
          {
            Services customer=Services();
            customer.funChoice(dataBaseBalance, userName, passWord);
          }
          else
          {
            print('Password Error , Try Again Please . ');
            stdout.write('Enter Your Password Again , please : ');
            String passWord=stdin.readLineSync()!;
            funLoginCus(userName, passWord);
          }
        }
        else
        {
          print('UserName Error , Try Again Please . ');
          stdout.write('Enter Your UserName Again , please : ');
          String passWord=stdin.readLineSync()!;
          funLoginCus(userName, passWord);
        }
      }
    }
    catch(e)
    {
      print('There is an Error, Try Again Please . $e');
      stdout.write('Enter Your UserName Again , please : ');
      String userName=stdin.readLineSync()!;
      stdout.write('Enter Your Password Again , please : ');
      String passWord=stdin.readLineSync()!;
      funLoginCus(userName, passWord);
    }
  }
//--------------------------------------------------------------------

}
