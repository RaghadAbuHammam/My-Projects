import 'dart:io';
//import 'dataBase.dart';
import 'UsersClass.dart';

main()
{
  print('''Welcome To Quick Service App... 
Thank You For Your Trust And Choosing Us . ''');

  while(true)
  { 
    try 
    {
      stdout.write('Enter Your Type (Admin OR Customer) , Please :');
      String Type=stdin.readLineSync()!;

      if(Type.toLowerCase()=='admin')
      { 
        print('Please , Login Now ... ');
        //class admin
        stdout.write('Please , Enter Your Name :');
        String userName=stdin.readLineSync()!;
        stdout.write('Please , Enter Your Password :');
        String passWord=stdin.readLineSync()!;
        Admin admin=Admin(userName, passWord , Type);
        admin.funLoginAdm(userName, passWord);
      } 
      else if(Type.toLowerCase()=='customer')
      {
        print('You Will Go To The Customer List . ');
        //class customer
        stdout.write('Please , Enter Your Name :');
        String userName=stdin.readLineSync()!;
        stdout.write('Please , Enter Your Password :');
        String passWord=stdin.readLineSync()!;
        Customer customer =Customer(userName, passWord, 'Customer');
        customer.funQ(passWord);
      }
    }
    catch(e)
    {  
      print('There is an Error, Try Again Please . $e');
    }
  }
}


